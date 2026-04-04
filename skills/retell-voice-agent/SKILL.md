# Skill: Retell Voice Agent Builder
**Last Updated:** March 15, 2026

> **Also read:** `retell-browser-control/SKILL.md` — CTO-level reference for node configuration, flow editing, transfer protocols, global settings, testing, and deployment. This skill covers import + TCPA; that skill covers everything else.

## Production Specs (Standard)
- Nodes: 10 (never 21+) | Interrupt sensitivity: 0.8 | Max call: 300s | Silence timeout: 120s
- Voice ID: cd2fbc5e381df2b880e4533e52 | Model: gemini-3.0-flash | Language: en-US
- Webhook: https://hanfluxai2026.app.n8n.cloud/webhook/c8f31eb3-9a96-49d8-b223-433911ed0a99

## Node Architecture (10-Node Standard)
Opening → Sales Qualify / Service Qualify → Schedule / Callback / Transfer / OptOut / WrongNumber / Voicemail → Dynamic Closing (1 node)

## API Import (2 Steps — Dashboard Import DOES NOT WORK)
1. POST /v1/create-conversation-flow → get conversation_flow_id
2. POST /v1/create-agent with that conversation_flow_id
Remove before importing: agent_id, version, last_modification_timestamp, channel, nested conversationFlow

## Post-Call Variables (Standard 12)
caller_name, email, appointment_booked, appointment_date, appointment_timestamp, car_model, callback_scheduled, callback_reason, Customer_sentiment, recording_consent, caller_name, Query_Type

## TCPA Checklist (Every Agent Must Have)
- [ ] AI disclosure at opening
- [ ] Recording notice
- [ ] Opt-out instruction at opening
- [ ] DNC suppression list
- [ ] Opt-out confirmation (immediate, no further questions)
- [ ] Quiet hours enforcement

## Global Interrupt Handlers
"Not now" → callback | "Stop calling" → opt-out | "Who is this?" → identity disclosure
"Already bought" → opt-out | "Send info" → callback | "Human/Agent" → transfer | "Recording?" → acknowledge

## Conversation Rules
- One question per turn — never stack
- Permission-first opening ("Do you have 2 minutes?")
- Micro-prompts: 2-6 lines per node (not paragraphs)
- No pressure tactics — concierge tone

## Common API Errors
| Error | Fix |
|---|---|
| 400 Bad Request | Remove auto-generated fields |
| conversation_flow not found | Re-run Step 1, use returned ID |
| Voice ID error | Verify cd2fbc5e381df2b880e4533e52 |
| Phone number error | Use E.164: +1XXXXXXXXXX |

## Source Files
- Downloads/Documents/COMPLETE_IMPORT_GUIDE.md
- Downloads/Documents/FINAL_SOLUTION.md
- Downloads/Kimi_Agent_Mercedes-Level Retell Voice Agent/
