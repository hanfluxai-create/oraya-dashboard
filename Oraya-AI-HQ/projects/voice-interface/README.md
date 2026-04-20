# Oraya Voice HQ

Two-brain voice agent. Gemini 3.1 Flash Live is the face. Claude HQ is the brain.

## Architecture

```
  ┌──────────────┐   audio   ┌──────────┐   audio   ┌──────────────────┐
  │   Browser    │ ───────▶  │ bridge.py│ ────────▶ │ Gemini 3.1 Live  │
  │ (mic+speaker)│ ◀───────  │  (WSS    │ ◀──────── │  (voice I/O,     │
  └──────────────┘           │  proxy)  │           │   short-term)    │
                             └────┬─────┘           └──────────────────┘
                                  │ tool call: ask_claude_hq
                                  ▼
                       ┌──────────────────────┐
                       │   claude -p (CLI)    │
                       │   in Oraya-AI-HQ/    │
                       │   - all MCPs         │
                       │   - all skills       │
                       │   - .auto-memory     │
                       │   - dashboard, etc.  │
                       └──────────────────────┘
```

Gemini holds only the current turn. Anything that requires memory, files,
tools, or thinking gets routed through `ask_claude_hq` to a headless
Claude Code process running in your `Claude hq` workspace, which has
access to every MCP and skill you have connected.

## Setup (one time)

1. **Get a Gemini API key** at https://aistudio.google.com/apikey
2. **Make sure `claude` CLI is installed** and works (it does, you already use it).
3. **Install Python deps:**
   ```bash
   pip3 install --break-system-packages websockets
   ```

## Run

```bash
cd ~/Downloads/Claude\ hq/Oraya-AI-HQ/projects/voice-interface
export GEMINI_API_KEY=AIza...your-key...
./run.sh
```

The browser opens to `index.html` automatically. Click **Connect**, then
**hold spacebar** (or hold the Talk button) and speak.

## Files

| File          | Purpose                                                  |
|---------------|----------------------------------------------------------|
| `bridge.py`   | Python WebSocket bridge between browser and Gemini Live. |
| `index.html`  | Single-file browser UI: mic capture, audio playback, log.|
| `run.sh`      | One-shot launcher (deps + bridge + open UI).             |
| `README.md`   | This file.                                               |

## How the brain split works

**Gemini handles itself only:**
- Back-channel ("mm-hmm", "go on")
- Greetings, sign-offs
- Re-asking you to clarify what you just said
- Reading aloud whatever Claude HQ returns

**Gemini calls `ask_claude_hq` for:**
- Any factual question about Oraya, HanFlux, projects, people, deals
- Memory recall (past decisions, names, dates)
- Any side effect (send, create, push, open, draft, book, update)
- Multi-step reasoning or planning

The system prompt (in `bridge.py`, `GEMINI_SYSTEM_INSTRUCTION`) enforces
this. The single tool `ask_claude_hq(intent, user_request, urgency)` is
the only escape hatch from Gemini's voice loop into the HQ brain.

## Customization

- **Voice:** edit `voiceName` in `bridge.py` setup. Options: Puck, Charon,
  Kore, Fenrir, Aoede.
- **Model:** set `GEMINI_MODEL` env var (default `gemini-3.1-flash-live-preview`).
- **HQ workspace:** set `HQ_ROOT` env var (default `~/Downloads/Claude hq`).
- **Bridge port:** set `BRIDGE_PORT` env var (default `8787`). Update `BRIDGE_URL`
  in `index.html` to match.

## Troubleshooting

- **"bridge unreachable"** — bridge isn't running, or port is taken. Check terminal.
- **"GEMINI_API_KEY not set"** — `export GEMINI_API_KEY=...` before `./run.sh`.
- **Mic permission** — Chrome will prompt the first time. If you decline,
  reset in `chrome://settings/content/microphone`.
- **"HQ timed out"** — heavy task ran past 120s. Increase `CLAUDE_TIMEOUT_SEC`.
- **No audio playback** — some browsers gate audio behind a user gesture.
  Click the page once after connecting.

## Roadmap (next slices)

- v1.1 — interim filler ("checking HQ...") streamed to Gemini while
  `claude -p` is still running, so there's never dead air.
- v1.2 — screen-share input to Gemini so you can say "what's wrong with
  this dashboard" while pointing at it.
- v1.3 — native menu-bar app with global PTT hotkey (Fn).
- v1.4 — persistent conversation log written to `Oraya-AI-HQ/projects/voice-interface/sessions/`.
- v2.0 — bidirectional: Claude HQ can also push to Gemini ("hey, that
  meeting starts in 5") via a /push endpoint on the bridge.
