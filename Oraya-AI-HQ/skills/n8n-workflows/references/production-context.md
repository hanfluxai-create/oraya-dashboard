# Production Context — Chitraksh's N8N Instance
**Owner:** Chitraksh Mayank
**Last Updated:** March 15, 2026
**Instance:** https://hanfluxai2026.app.n8n.cloud
**Primary Webhook:** /webhook/c8f31eb3-9a96-49d8-b223-433911ed0a99
**Source:** Copy Outbound Post Call.json (production) + N8N_WORKFLOW_EXTRACTION_REPORT.txt + 86-workflow library

> Read this file whenever building or debugging workflows for Chitraksh's production instance.
> For JSON schema, node types, expressions, and critical rules → see main SKILL.md.

---

## 1. PRODUCTION CREDENTIALS (Real IDs — Use These, Not Placeholders)

| Service | Credential Name | ID |
|---|---|---|
| Supabase | "Supabase account" | `t68H7KhMcrrNgUPs` |
| Gmail | "Gmail account" | `1EASaEHAoK3fG6X1` |
| Twilio | "Twilio account" | `PcO0YC16KIquuS6x` |
| Google Calendar | "Google Calendar account" | `2BaP72YO9q5pyBGt` |

**Hardcoded production values:**
- Admin email: `mayankchitraksh@gmail.com`
- Admin SMS: `+15105204265`
- Calendar account: `flashworkflow@gmail.com`
- Twilio messaging service SID: `MGf97f28db3567e1ab6c95434bec15889c`

---

## 2. RETELL → N8N PAYLOAD (Exact Field Paths — From Production JSON)

### Standard Retell Fields
```javascript
$json.body.call.direction                          // "outbound" | "inbound"
$json.body.call.to_number                          // "+15551234567"
$json.body.call.call_analysis.user_sentiment       // Retell built-in
$json.body.call.call_analysis.call_summary         // Retell built-in
$json.body.call.call_analysis.call_successful      // boolean
```

### Custom Analysis Data
```javascript
$json.body.call.call_analysis.custom_analysis_data.Caller_Name
$json.body.call.call_analysis.custom_analysis_data['Caller\'s email id']
$json.body.call.call_analysis.custom_analysis_data['appointment date']
$json.body.call.call_analysis.custom_analysis_data.appointment_booked       // boolean
$json.body.call.call_analysis.custom_analysis_data.appointment_timestamp    // ISO datetime
$json.body.call.call_analysis.custom_analysis_data.car_model
$json.body.call.call_analysis.custom_analysis_data.call_back_scheduled      // boolean
$json.body.call.call_analysis.custom_analysis_data.call_back_reason
$json.body.call.call_analysis.custom_analysis_data.Customer_sentiment
$json.body.call.call_analysis.custom_analysis_data.Query_Type               // "Sales"|"Service"|"Parts"|"Other"
```

### Safe Name Extraction (Handles Nulls + Junk — From Production)
```javascript
(() => {
  const name = $json.body.call.call_analysis.custom_analysis_data.Caller_Name;
  if (!name || !name.trim() || /^n\/?a$|{{|caller|unknown|none/i.test(name.trim())) {
    return 'Valued Customer';
  }
  return name;
})()
```

### Safe Phone Extraction
```javascript
$json.body.call.to_number && $json.body.call.to_number.trim() !== ''
  ? $json.body.call.to_number : 'N/A'
```

### Timezone Timestamp (LA)
```javascript
$now.setZone('America/Los_Angeles').toFormat('MMMM d, yyyy \'at\' h:mm a')
```

---

## 3. PRODUCTION ARCHITECTURE — 3 STAGES (Voice Backend)

### Entry: PCDE Node (Always First for Post-Call)
```
Node type: n8n-nodes-base.if
Name: "PCDE"
Condition: $json.body.call.call_analysis.call_successful.toString() EXISTS
```

### STAGE 1: PRE-CALL ENRICHMENT
```
Webhook (POST /inbound)
  → Data Validation (Code) — validate call_id, customer_phone, agent_id
  → CRM Lookup (HTTP Request) — timeout: 3s | retry: 2x | backoff: 1s
      on fail: continue, flag crm_enrichment_failed
  → Data Enrichment (Code) — merge CRM + Retell context
  → Set Variables — name, email, context, vehicle_interest
  → Response 200 OK (must be within 3s)
```

### STAGE 2: IN-CALL EVENT HANDLING
```
Webhook (POST /event)
  → Event Router (Switch)
      "appointment_requested" → queue calendar hold
      "callback_requested"   → create CRM task
      "transfer_requested"   → alert human queue
      "opt_out_requested"    → suppression list
  → Idempotency Check (Code) — dedup_key = call_id + event_type
  → API Client (HTTP) — timeout: 5s | retry: 3x | backoff: 1s→2s→4s
  → Log to Supabase
```

### STAGE 3: POST-CALL RECONCILIATION (Core — Always Implement)
```
Webhook (POST /post-call)
  → PCDE (IF: call_successful exists)
  → Appointment (IF: appointment_booked == true)
      YES:
        → HTML5 node (appointment confirmation email)
        → Book Appointment (Google Calendar)
            start/end: appointment_timestamp
            summary: "Mercedes of South Bay - {{Query_Type}}"
            description: "{{Caller_Name}} | {{to_number}} | {{call_summary}}"
        → SMS to Admin (Twilio: +15105204265)
        → Appointment Log (Supabase: "Appointment Log" table)
  → Callback (IF: call_back_scheduled == true)
      YES:
        → HTML6 node (callback request email)
        → Gmail to Admin (mayankchitraksh@gmail.com)
        → Call back log (Supabase: "Call back log" table)
```

---

## 4. SUPABASE TABLE SCHEMAS (Production — Exact Field Names)

### "Appointment Log"
| Field | Expression |
|---|---|
| Date and Time | `$now.setZone('America/Los_Angeles').toFormat(...)` |
| Agent Direction | `$json.body?.call?.direction ?? 'N/A'` |
| Outbound Number | `$json.body?.call?.to_number ?? 'N/A'` |
| Caller Name | `...custom_analysis_data.Caller_Name` |
| Caller Email | `...custom_analysis_data['Caller\'s email id']` |
| Appointment Date | `...custom_analysis_data['appointment date']` |
| Appointment Reason | `$('PCDE').item.json.body.call.call_analysis.custom_analysis_data.Query_Type` |
| Vehicle Type | `...custom_analysis_data.car_model` |
| Sentiment | `...call_analysis.user_sentiment` |
| Appointment Notes | `...call_analysis.call_summary` |

### "Call back log"
| Field | Expression |
|---|---|
| Date and Time | `$now.setZone(...)` |
| Agent Direction | `$json.body?.call?.direction ?? 'N/A'` |
| Query Category | `...custom_analysis_data.Query_Type` |
| Outgoing Number | `...to_number ? ... : 'N/A'` |
| Caller Name | `...custom_analysis_data.Caller_Name` |
| Caller Sentiment | `Retell - {{user_sentiment}} / Custom - {{Customer_sentiment}}` |
| Call Back Reason | `...custom_analysis_data.call_back_reason` |

---

## 5. ERROR HANDLING (Production Pattern)

```
HTTP Request node settings:
  retryOnFail: true | maxTries: 3 | waitBetweenTries: 1000ms
  onError: continueErrorOutput (NOT continueRegularOutput)

Error branch:
  → Log to Supabase (call_id, node_name, error, timestamp)
  → Create retry queue entry (if retryable)
  → Create manual follow-up task in CRM
  → Alert via Gmail (critical failures only)
  → Return 200 to Retell (NEVER block the call)
```

**Retry backoff:** 1s → 2s → 4s → circuit breaker (60s cooldown)

---

## 6. RATE LIMITS

| Service | Limit | N8N Implementation |
|---|---|---|
| CRM API | 100 req/min | Wait node before CRM calls |
| Google Calendar | 50 req/min | Queue excess requests |
| SMS/Email | 200 req/min | splitInBatches for bulk |

---

## 7. IDEMPOTENCY PATTERN

```javascript
// In Code node — always check before processing
const dedup_key = `${$json.call_id}_${$json.event_type}`;
// Query Supabase for existing dedup_key
// If exists → return { status: 'already_processed' }
// If not → process, then insert dedup_key
```

---

## 8. STRUCTURED LOGGING

```json
{
  "timestamp": "{{ $now.toISO() }}",
  "level": "INFO|WARN|ERROR",
  "call_id": "{{ $json.body.call.call_id }}",
  "workflow_stage": "pre_call|in_call|post_call",
  "node_name": "string",
  "duration_ms": 0,
  "success": true,
  "error_code": null,
  "metadata": {}
}
```

---

## 9. CALL STORAGE RETELL — AI AGENT PROMPTS (Production)

*Source: `Call storage retell (2).json` — 40-node Mercedes dealership call management system*

### AI Agent 1: Mercedes Appointment Manager (5,710 chars)
```
=DATE AND TIME: {{ $now.setZone('America/Los_Angeles').toISO() }}
APPOINTMENT STATUS: {{ $json.body.call.call_analysis.custom_analysis_data.appointment_booked }}
CALLBACK SCHEDULED: {{ $json.body.call.call_analysis.custom_analysis_data.call_back_schduled }}

# CRITICAL INSTRUCTIONS
You are an elite appointment manager for a Mercedes-Benz dealership with expertise in accurately
interpreting customer conversations and extracting critical appointment details.

## PRIMARY TASK
Analyze the provided call transcript between a customer and our voice agent, then determine
the appropriate action based on appointment status.

## Tool Usage Instructions
RULE: Do not use any tool unless a callback has been scheduled OR appointment booked.

SCENARIO 1: Appointment Booked
- Use BOOK_APPOINTMENT tool to create calendar event
- Use Appointment_log tool to populate Google Sheet with appointment log data

SCENARIO 2: Callback Requested
- Use SHEETS_TOOL to append callback information to callback log

## Data Extraction Guidelines:
- If field missing/not mentioned: write 'N/A'
- Never make assumptions beyond transcript content
- Handle transcription errors with context clues
- Use 12-hour time format with proper date conversion
- Validate email format and phone numbers
- Default to 'N/A' rather than guessing
```

**Prompt:** `"=***USE SHEETs_TOOL TO FILL INFORMATION S INSTRUCTED and CREATE EVENT ON CALENDER (IF APPLICABLE)***"`

### AI Agent 2: JSON Output Agent (2,166 chars)
```
# CRITICAL INSTRUCTIONS
You are an elite appointment manager for a Mercedes-Benz dealership. Your job is to analyze
the call transcript and output a strict JSON object for our database.

## LOGIC RULES:
1. If appointment_booked is TRUE: Set event_type to 'appointment'
2. If call_back_scheduled is TRUE: Set event_type to 'callback'
3. If both FALSE: Set event_type to 'general_log'

## JSON OUTPUT SCHEMA:
{
  "event_type": "appointment" | "callback" | "general_log",
  "customer_name": "String or N/A",
  "email": "String (lowercase, no spaces) or N/A",
  "phone_number": "{{ $json.body.call.from_number }}",
  "appointment_date": "ISO Format or null",
  "car_model": "String (e.g., C-Class, GLE) or N/A",
  "appointment_reason": "Service/Sales/Test Drive or N/A",
  "callback_reason": "String or null",
  "sentiment": "Positive | Neutral | Negative | Urgent",
  "summary_notes": "Concise summary",
  "dealership_id": "String or default"
}

## DATA CLEANING RULES:
- Convert relative dates to actual ISO timestamps
- Correct misheard vehicle models
- Use N/A for missing/unspecified info
- Do not guess beyond transcript content
```

**Prompt:** `"FILL INFORMATION S INSTRUCTED"`

### Reminder Schedule
- 24h prior → SMS/WhatsApp to customer
- 6h prior → SMS/WhatsApp to customer
- 3h prior → SMS/WhatsApp to customer

---

## 10. WORKFLOW LIBRARY (86 Workflows — Downloads/Code & Data/)

### Call Processing (17)
| File | Nodes | Purpose |
|---|---|---|
| `Copy Outbound Post Call.json` | 17 | **PRODUCTION STANDARD** — appointment+callback post-call handler |
| `Inbound Og Post Call.json` | ~17 | Inbound variant |
| `Call storage retell (2).json` | 40 | Advanced: AI transcript analysis, multi-stage reminders |
| `Call storage retell (3).json` | 40 | Latest version |

### AI Chat Bots (40)
| File | Nodes | Purpose |
|---|---|---|
| Hanflux Legal v3 | 58 | Multi-LLM legal doc generation |
| Fraudopedia BOT | ~20 | RAG fraud knowledge Q&A |
| Nyay GPT | ~15 | Legal research |
| NMIMS GUEST BOT | ~12 | Event guest management |

### Content Generation (7)
- Social_Media_Auto_Poster — X + LinkedIn + Instagram
- Content_Generator v1/v2/v3 — AI content pipelines
- Canva_Brochure_Email_Sender — Canva API → PDF → Gmail

### Data Processing (10)
- Supabase_RAG_AI_Agent — pgvector Q&A (21 nodes)
- DATA_CLEANER — Government data normalization (4 nodes)
- AAER_Engine (x8) — SEC enforcement report analysis

### Lead Gen (1)
- Insurance_Lead_Main — 48 nodes, keyword+LLM → 4 verticals

---

## 11. NEW WORKFLOW CHECKLIST

Before building:
- [ ] Check library — similar workflow already exists?
- [ ] Identify trigger (webhook/schedule/manual/chat)
- [ ] Map services → match to existing credentials above
- [ ] Plan error handling for every external API call
- [ ] Add logging node at key decision points
- [ ] Add idempotency if event can fire more than once

After building:
- [ ] Test webhook with n8n test URL
- [ ] Verify Supabase inserts land correctly
- [ ] Test error path (temporarily block an API)
- [ ] Verify all Retell field paths match Section 2
- [ ] Activate workflow (don't just save)

---

## SOURCE FILES
- `Downloads/Copy Outbound Post Call.json` — Production workflow (real node config)
- `Downloads/Code & Data/` — Full 86-workflow library
- `Downloads/N8N_WORKFLOW_EXTRACTION_REPORT.txt` — AI prompts extracted 2026-03-15
