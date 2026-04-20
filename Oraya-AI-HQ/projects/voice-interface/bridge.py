#!/usr/bin/env python3
"""
Voice Interface Bridge. Gemini 3.1 Flash Live <-> Claude HQ

Architecture:
  Browser mic/speaker  <--WS-->  bridge.py  <--WS-->  Gemini Live API
                                     |
                                     v  (on tool call)
                                claude -p  (headless Claude Code CLI)
                                     |
                                     v
                                Oraya-AI-HQ workspace + all MCPs

Gemini is the face (short-term memory, voice I/O).
Claude HQ is the brain (long-term memory, tools, execution).

Gemini has exactly ONE tool: ask_claude_hq(intent, payload).
Every non-trivial query routes through Claude HQ.
"""

import asyncio
import base64
import json
import os
import subprocess
import sys
from pathlib import Path

import websockets
from websockets.server import WebSocketServerProtocol

# -------- Config --------
GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY", "").strip()
GEMINI_MODEL = os.environ.get("GEMINI_MODEL", "models/gemini-3.1-flash-live-preview")
GEMINI_WS_URL = (
    "wss://generativelanguage.googleapis.com/ws/"
    "google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent"
    f"?key={GEMINI_API_KEY}"
)

HQ_ROOT = Path(
    os.environ.get(
        "HQ_ROOT",
        str(Path.home() / "Downloads" / "Claude hq"),
    )
).expanduser()

CLAUDE_CLI = os.environ.get("CLAUDE_CLI", "claude")
CLAUDE_TIMEOUT_SEC = int(os.environ.get("CLAUDE_TIMEOUT_SEC", "120"))

BRIDGE_HOST = os.environ.get("BRIDGE_HOST", "127.0.0.1")
BRIDGE_PORT = int(os.environ.get("BRIDGE_PORT", "8787"))

# -------- Gemini system prompt (voice-interface discipline) --------
GEMINI_SYSTEM_INSTRUCTION = """You are the voice interface for Chitraksh Mayank, CTO of Oraya Labs and founder of HanFlux AI.

YOU ARE NOT A REASONER. You are the face and the ears. The real brain is Claude HQ, which you reach by calling the `ask_claude_hq` tool.

CORE RULE: For ANY of the following, you MUST call ask_claude_hq and wait for its reply before speaking:
- Factual questions about Oraya, HanFlux, projects, people, deals, contracts, transcripts, or any company context
- Anything that requires memory (past conversations, decisions, names, dates)
- Anything that requires action (send email, create doc, push dashboard, update Notion, open app, run code, book meeting, draft reply)
- Any multi-step task or planning
- Anything you are not 100 percent sure of from the last 30 seconds of conversation

ONLY handle yourself:
- Back-channel sounds ("mm-hmm", "yes", "go on")
- One-word acknowledgements when Claude HQ has just answered
- Asking Chitraksh to repeat or clarify what HE just said
- Greetings and sign-offs

WHILE waiting for ask_claude_hq to return, you may say a brief filler like "one sec, checking HQ" or "pulling that up" but only once per call, never repetitive.

When ask_claude_hq returns, speak the `spoken_reply` field verbatim in natural voice. If the reply is long, summarize it in 1-2 sentences aloud and offer to send the full version to his screen.

You address him as "Chitraksh" or nothing. Never "sir". Never "boss". Never em dashes in your speech (he hates them). Keep replies tight. He runs two companies, he does not have time for preamble.

If Claude HQ does not return in 20 seconds, say "HQ is still working, hold on" and continue waiting. Never fabricate an answer.
"""

# -------- Gemini tool declaration --------
ASK_CLAUDE_HQ_TOOL = {
    "functionDeclarations": [
        {
            "name": "ask_claude_hq",
            "description": (
                "Send a query or task to Claude HQ, the main brain. "
                "Claude HQ has access to all of Chitraksh's memory, files, "
                "Oraya-AI-HQ workspace, dashboards, MCP tools (Notion, Gmail, "
                "Canva, Figma, computer-use, Chrome, Retell, n8n), and can "
                "execute multi-step tasks. Call this for ANY non-trivial "
                "intent. Returns a spoken_reply field to read aloud."
            ),
            "parameters": {
                "type": "OBJECT",
                "properties": {
                    "intent": {
                        "type": "STRING",
                        "description": (
                            "Short label for the intent category: "
                            "'recall' (memory lookup), 'action' (side effect), "
                            "'question' (factual), 'plan' (multi-step), "
                            "'remember' (save to memory), 'other'."
                        ),
                    },
                    "user_request": {
                        "type": "STRING",
                        "description": (
                            "The user's request, paraphrased in full sentences. "
                            "Include all context from the last few turns that "
                            "Claude HQ needs to act. Do not summarize away detail."
                        ),
                    },
                    "urgency": {
                        "type": "STRING",
                        "description": "'now' | 'normal' | 'background'",
                    },
                },
                "required": ["intent", "user_request"],
            },
        }
    ]
}


# -------- Claude HQ invocation --------
async def call_claude_hq(intent: str, user_request: str, urgency: str = "normal") -> str:
    """
    Spawn `claude -p` with the HQ workspace mounted. Returns spoken_reply text.
    """
    # Wrap the request so Claude HQ knows it's coming from a voice interface
    # and should return a tight, speakable answer.
    framed_prompt = (
        f"[VOICE INTERFACE REQUEST. intent={intent} urgency={urgency}]\n\n"
        f"The user spoke this to the Gemini voice layer:\n"
        f"\"{user_request}\"\n\n"
        f"Execute the request fully using your HQ tools and memory. "
        f"Then return a JSON object exactly of this shape, nothing else:\n"
        f'{{"spoken_reply": "<1-3 sentences, natural spoken English, no em dashes, '
        f'for Gemini to read aloud>", "full_answer": "<longer written form if useful, '
        f'else empty string>", "actions_taken": ["<list of side effects>"]}}\n\n'
        f"Rules: No em dashes. No preamble. Address him as Chitraksh or nothing. "
        f"If you need to send him a long document, save it to Oraya-AI-HQ/ and mention "
        f"the filename in spoken_reply so Gemini can tell him. If you took actions "
        f"(dashboard push, memory write, Notion update, etc.), list them."
    )

    cmd = [
        CLAUDE_CLI,
        "-p", framed_prompt,
        "--output-format", "json",
        "--permission-mode", "bypassPermissions",
    ]

    proc = await asyncio.create_subprocess_exec(
        *cmd,
        cwd=str(HQ_ROOT),
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE,
    )

    try:
        stdout, stderr = await asyncio.wait_for(
            proc.communicate(), timeout=CLAUDE_TIMEOUT_SEC
        )
    except asyncio.TimeoutError:
        proc.kill()
        return json.dumps({
            "spoken_reply": "HQ timed out on that one. Try asking again or simpler.",
            "full_answer": "",
            "actions_taken": [],
        })

    if proc.returncode != 0:
        err = stderr.decode("utf-8", errors="replace")[:500]
        return json.dumps({
            "spoken_reply": "HQ hit an error. Check the bridge log.",
            "full_answer": f"stderr: {err}",
            "actions_taken": [],
        })

    raw = stdout.decode("utf-8", errors="replace")

    # Claude CLI --output-format json wraps the result. Extract the assistant's final text.
    try:
        outer = json.loads(raw)
        # Claude Code CLI json output shape: {"result": "...text...", ...}
        inner_text = outer.get("result") or outer.get("response") or raw
    except json.JSONDecodeError:
        inner_text = raw

    # Inner text should itself be the JSON object we asked for. Try to parse.
    try:
        # Strip markdown fences if Claude wrapped it
        stripped = inner_text.strip()
        if stripped.startswith("```"):
            stripped = stripped.split("```", 2)[1]
            if stripped.startswith("json"):
                stripped = stripped[4:]
            stripped = stripped.rsplit("```", 1)[0]
        parsed = json.loads(stripped.strip())
        if "spoken_reply" in parsed:
            return json.dumps(parsed)
    except (json.JSONDecodeError, IndexError):
        pass

    # Fallback: return the raw text as the spoken reply
    return json.dumps({
        "spoken_reply": inner_text[:400],
        "full_answer": inner_text,
        "actions_taken": [],
    })


# -------- Gemini <-> Browser proxy --------
async def handle_browser(browser_ws: WebSocketServerProtocol):
    """
    Per-client session. Opens a Gemini Live WS, proxies audio both ways,
    intercepts tool calls, dispatches them to Claude HQ.
    """
    print(f"[bridge] browser connected from {browser_ws.remote_address}")

    if not GEMINI_API_KEY:
        await browser_ws.send(json.dumps({
            "type": "error",
            "message": "GEMINI_API_KEY not set in environment. Start bridge with GEMINI_API_KEY=... python bridge.py",
        }))
        return

    try:
        async with websockets.connect(GEMINI_WS_URL, max_size=None) as gemini_ws:
            # 1. Send setup message
            setup_msg = {
                "setup": {
                    "model": GEMINI_MODEL,
                    "generationConfig": {
                        "responseModalities": ["AUDIO"],
                        "speechConfig": {
                            "voiceConfig": {
                                "prebuiltVoiceConfig": {"voiceName": "Puck"}
                            }
                        },
                    },
                    "systemInstruction": {
                        "parts": [{"text": GEMINI_SYSTEM_INSTRUCTION}]
                    },
                    "tools": [ASK_CLAUDE_HQ_TOOL],
                }
            }
            await gemini_ws.send(json.dumps(setup_msg))
            print("[bridge] sent setup to Gemini")

            # 2. Run two proxy tasks in parallel
            async def browser_to_gemini():
                async for raw in browser_ws:
                    try:
                        msg = json.loads(raw)
                    except json.JSONDecodeError:
                        continue

                    if msg.get("type") == "audio":
                        # Browser ships PCM16 @ 16kHz base64
                        audio_b64 = msg["data"]
                        realtime = {
                            "realtimeInput": {
                                "mediaChunks": [
                                    {
                                        "mimeType": "audio/pcm;rate=16000",
                                        "data": audio_b64,
                                    }
                                ]
                            }
                        }
                        await gemini_ws.send(json.dumps(realtime))
                    elif msg.get("type") == "text":
                        # Debug/typed input
                        client_content = {
                            "clientContent": {
                                "turns": [{
                                    "role": "user",
                                    "parts": [{"text": msg["data"]}],
                                }],
                                "turnComplete": True,
                            }
                        }
                        await gemini_ws.send(json.dumps(client_content))
                    elif msg.get("type") == "end_turn":
                        await gemini_ws.send(json.dumps({
                            "clientContent": {"turnComplete": True}
                        }))

            async def gemini_to_browser():
                async for raw in gemini_ws:
                    try:
                        msg = json.loads(raw)
                    except json.JSONDecodeError:
                        continue

                    # Forward audio chunks to browser
                    server_content = msg.get("serverContent", {})
                    if server_content:
                        model_turn = server_content.get("modelTurn", {})
                        for part in model_turn.get("parts", []):
                            inline = part.get("inlineData")
                            if inline and "audio/pcm" in inline.get("mimeType", ""):
                                await browser_ws.send(json.dumps({
                                    "type": "audio",
                                    "data": inline["data"],
                                }))
                            text = part.get("text")
                            if text:
                                await browser_ws.send(json.dumps({
                                    "type": "transcript",
                                    "data": text,
                                }))
                        if server_content.get("turnComplete"):
                            await browser_ws.send(json.dumps({"type": "turn_complete"}))
                        if server_content.get("interrupted"):
                            await browser_ws.send(json.dumps({"type": "interrupted"}))

                    # Handle tool calls from Gemini
                    tool_call = msg.get("toolCall")
                    if tool_call:
                        responses = []
                        for fc in tool_call.get("functionCalls", []):
                            name = fc.get("name")
                            args = fc.get("args", {})
                            call_id = fc.get("id")
                            print(f"[bridge] tool call {name} args={args}")

                            if name == "ask_claude_hq":
                                # Notify browser that HQ is being queried
                                await browser_ws.send(json.dumps({
                                    "type": "hq_query",
                                    "data": args,
                                }))

                                result_json = await call_claude_hq(
                                    intent=args.get("intent", "other"),
                                    user_request=args.get("user_request", ""),
                                    urgency=args.get("urgency", "normal"),
                                )

                                await browser_ws.send(json.dumps({
                                    "type": "hq_response",
                                    "data": result_json,
                                }))

                                responses.append({
                                    "id": call_id,
                                    "name": name,
                                    "response": {"output": result_json},
                                })
                            else:
                                responses.append({
                                    "id": call_id,
                                    "name": name,
                                    "response": {"error": f"unknown tool {name}"},
                                })

                        await gemini_ws.send(json.dumps({
                            "toolResponse": {"functionResponses": responses}
                        }))

                    if msg.get("setupComplete"):
                        await browser_ws.send(json.dumps({"type": "ready"}))

            await asyncio.gather(browser_to_gemini(), gemini_to_browser())

    except websockets.exceptions.ConnectionClosed:
        print("[bridge] connection closed")
    except Exception as e:
        print(f"[bridge] error: {e}", file=sys.stderr)
        try:
            await browser_ws.send(json.dumps({"type": "error", "message": str(e)}))
        except Exception:
            pass


async def main():
    if not GEMINI_API_KEY:
        print("WARNING: GEMINI_API_KEY not set. Bridge will error on first connection.",
              file=sys.stderr)
    print(f"[bridge] Claude HQ root: {HQ_ROOT}")
    print(f"[bridge] Gemini model: {GEMINI_MODEL}")
    print(f"[bridge] listening on ws://{BRIDGE_HOST}:{BRIDGE_PORT}")

    async with websockets.serve(handle_browser, BRIDGE_HOST, BRIDGE_PORT, max_size=None):
        await asyncio.Future()  # run forever


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n[bridge] shutdown")
