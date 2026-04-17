# Skill: Retell AI Browser Control
**Source:** Retell AI Browser Control: Master Training Document v1.0, March 2026
**Last Updated:** March 15, 2026
**Scope:** CTO-level reference — agent config, flow construction, transfer logic, testing, deployment

> Read this skill before: building/editing Retell flows, configuring agents, designing transfer logic, testing or deploying to production.
> For import process and TCPA → see `retell-voice-agent/SKILL.md`
> For production deployment monitoring → cross-reference `voice-agent-deployment/SKILL.md`

---

## 1. PLATFORM ARCHITECTURE

### Node Types
| Node | Purpose |
|---|---|
| **Conversation Node** | Primary interaction — agent speaks and listens |
| **Function Node** | Executes API calls, webhooks, custom functions |
| **Logic Split Node** | Routes based on conditions (if/else) — no user interaction |
| **Call Transfer Node** | Transfers to human or another number |
| **Agent Transfer Node** | Hands off to another Retell AI agent |
| **Press Digit Node** | DTMF/IVR-style input handling |
| **Extract Variable Node** | Captures info into dynamic variables |
| **SMS Node** | Sends SMS during or after call |
| **MCP Node** | Model Context Protocol — external tool integration |
| **End Node** | Terminates call gracefully |

### Execution Modes
| | Flex Mode | Rigid Mode |
|---|---|---|
| Behavior | All nodes share context, flexible | Step-by-step, strictly follows flow |
| Use Case | 3-4 branches, simple FAQ bots | 5+ branches, state tracking, complex logic |
| Reliability | Lower determinism | Higher determinism |
| **Use For** | Prototypes only | **All production agents** |

**Rule:** Use **Rigid Mode** for any production agent with appointment booking, sales flows, multi-step logic, or 4+ branches.

---

## 2. GLOBAL SETTINGS

### Access
Dashboard → open agent → click **empty canvas area** (not a node) → right panel = "Agent Settings"

### LLM Selection Strategy
| Node Type | Recommended Model |
|---|---|
| High-stakes (sales closing, objection handling) | GPT-4.1 or Claude Sonnet |
| Simple routing (greetings, confirmations) | Claude Haiku (faster, cheaper) |
| Complex reasoning (qualification logic) | GPT-4.1 |
| Creative/personality nodes | GPT-4o |

**Temperature:** 0.0-0.3 for production (deterministic). 0.4-0.7 balanced. 0.8-1.0 = high variance (avoid in production).

### Global Prompt Structure
```
## Objective
[One sentence: what this agent does and why it exists]

## Core Persona
[Personality traits, speaking style, authority level]

## Identity
- Company: {{company_name}}
- Role: [Agent's role title]
- Name: [Agent name if applicable]

## Guardrails
- Never discuss: [forbidden topics]
- Always verify: [required confirmations]
- Escalation triggers: [when to transfer to human]

## Response Framework
- Keep responses under 3 sentences unless asked for detail
- Use active voice and direct language
- Confirm understanding before proceeding to next step
```

**Critical:** Global prompt is **inherited by all nodes**. Node-specific prompts ADD TO (not replace) global prompt. Never duplicate global guardrails in node prompts.

### Speech Settings (Advanced)
| Setting | Purpose | Recommendation |
|---|---|---|
| Background Sound | Ambient realism | "Call Center" for B2B sales |
| Responsiveness | Agent response delay | 1.0 default. Lower to 0.8-0.9 for elderly |
| Interruption Sensitivity | How easily interrupted | 1.0 default. Lower to 0.7-0.8 for noisy |
| Backchanneling | "mm-hmm", "I see" | Enable for natural feel |
| Boosted Keywords | STT bias toward brand names | Add dealership names, product names |
| Speech Normalization | Converts numbers to words | Enable to prevent TTS mispronunciation |

### Call Settings
- **Voicemail Detection** — Enable for outbound. Set hangup or leave message.
- **End Call on Silence** — 30 seconds default
- **Max Call Duration** — Hard limit (e.g., 10 min). Prevents runaway costs.
- **Pause Before Speaking** — Useful for inbound (user still lifting phone)

### PII Redaction (ALWAYS enable for production)
- Location: Global Settings → Privacy & Webhook → PII Redaction
- Redacts: SSN, credit cards, phone numbers, emails, names, addresses from transcripts/recordings/logs

### Webhook Configuration
- Event types: `call_started`, `call_ended`, `call_analyzed`, `transcript_update`
- Use for N8N integration, CRM logging, analytics

---

## 3. CONVERSATION FLOW NODES

### Node Naming Convention
- Conversation: Persona + Purpose → `"Greetings - Nia"`, `"Appointment Booking"`
- Function: Action performed → `"Fetch Customer Data"`, `"Send Confirmation Email"`
- Logic Split: Condition checked → `"Check Business Hours"`, `"Validate Email Format"`
- Transfer: Destination → `"Transfer to Human Support"`, `"Transfer to Sales Team"`

### Conversation Node Prompt Structure (Best Practice)
```
## Task
[One sentence: specific goal of this node]

## Context
[Relevant information agent needs]

## Behavior
- [Specific instruction 1]
- [Specific instruction 2]

## Examples
User: [example input]
Agent: [example response]
```

**Rules:** Keep prompts focused on single task. Include 2-3 examples for complex behaviors. NEVER duplicate global guardrails.

### Transitions and Edge Conditions
Each node can have multiple outgoing edges. Agent evaluates conditions top-to-bottom, takes first match. Always include a "default" fallback edge.

| Condition Type | Example |
|---|---|
| Natural Language | "User confirmed appointment", "User declined offer" |
| Equation-Based | `{{appointment_confirmed}} == "yes"` |
| Variable Existence | `{{email}} exists`, `{{phone_number}} does not exist` |
| Always/Default | "Always" (catch-all fallback) |

**Best practice:** Most specific conditions first. Default/always edge last.

### Function Node Configuration
1. Create Function Node → set function name + description (agent uses description to decide when to call)
2. Set parameters (fields agent will populate), webhook URL or API endpoint
3. Set timing:
   - **Speak ON + Wait ON** (recommended): Agent speaks while running, waits for result, then transitions
   - **Speak OFF + Wait OFF**: Background task, immediate transition
4. Define transitions: Success path + Failure path (ALWAYS define failure path)

### Logic Split Node
Pure routing — no user interaction. Agent evaluates conditions silently and routes.

```
Logic Split: Check Business Hours
├── Edge 1: {{current_hour}} >= 9 AND {{current_hour}} < 17 → Business Hours Flow
├── Edge 2: {{current_hour}} < 9 OR {{current_hour}} >= 17 → After Hours Flow
└── Edge 3: Always → Error Handler
```

### Extract Variable Node
Captures info from conversation into typed variables.

| Type | Example Use |
|---|---|
| Text | Names, addresses, notes |
| Number | Ages, quantities, prices |
| Enum | Yes/No/Maybe, product categories |
| Boolean | True/False |

Example:
```
Variable Name: appointment_date
Type: Text
Instruction: "Extract the date the user wants to schedule their appointment.
              Accept formats like 'next Tuesday', 'March 15th', or '3/15'."
Transitions:
├── {{appointment_date}} exists → Confirm Appointment Node
└── {{appointment_date}} does not exist → Ask for Date Again Node
```

---

## 4. HUMAN TRANSFER PROTOCOL (2-ATTEMPT RULE)

### Principle
AI agent should attempt to handle requests **twice** before escalating to human.

### 2-Attempt Flow Pattern
```
Node 1: Initial Service Attempt
├── User satisfied → Continue Flow
└── User requests human → Count = 1 → Node 2

Node 2: Second Service Attempt
Prompt: "I understand you'd prefer to speak with someone. Let me try to help
         you with [specific issue]. Can you tell me more about what you need?"
├── User provides info, resolved → Continue Flow
└── User insists on human → Count = 2 → Transfer Node

Transfer Node: Human Handoff
Type: Warm Transfer
Phone: {{support_number}}
Whisper: "Customer requesting assistance with [issue]. I've attempted to help
          twice. Customer details: {{customer_name}}, {{issue_summary}}"
Transitions:
├── Transfer successful → End Call Node
└── Transfer failed → Callback Offer Node
```

### Transfer Types
| Type | Behavior | Use Case |
|---|---|---|
| Cold Transfer | Agent disconnects, user transferred directly | Standard CS escalation |
| Warm Transfer | Agent stays, introduces user to human, then disconnects | VIP customers |
| Agentic Warm Transfer | Agent briefs human first (user can't hear), then 3-way intro | High-value sales |

### Transfer Node Configuration Fields
- Transfer Type (Cold/Warm/Agentic Warm)
- Phone Number (can use `{{support_number}}`)
- Dial Timeout: 30-60 seconds
- Human Detection: Enable (detects human vs voicemail)
- Whisper Message: What agent says to human before user joins (agentic warm)
- Three-Way Message: Introduction when user joins

**Critical Rule:** NEVER leave transfer node without a failure path.

### Transfer Failure Handling
```
Transfer Failed → Callback Offer Node
Prompt: "I apologize, but I'm unable to connect you with a team member right now.
         Can I have someone call you back within the next hour? I'll need to
         confirm your callback number."
├── User accepts → Capture Callback Details → Schedule Callback Function → End Call
└── User declines → Apology + End Call
```

### Tracking Attempts
**Method 2 (Recommended for Rigid Mode):** Node-based counting
- First Request → First Attempt Node (attempt = 1)
- Second Request → Second Attempt Node (attempt = 2)
- Third Request → Transfer Node (no further attempts)

---

## 5. DYNAMIC VARIABLES

### Syntax: `{{variable_name}}`

### Variable Types
| Type | Examples |
|---|---|
| Custom | `{{customer_name}}`, `{{order_id}}`, `{{appointment_date}}` |
| System | `{{current_time}}`, `{{call_id}}`, `{{direction}}` |
| Timezone | `{{current_time_America/Los_Angeles}}`, `{{current_calendar_Australia/Sydney}}` |
| Call | `{{user_number}}`, `{{agent_number}}`, `{{session_duration}}` |

### System Variables (Always Available)
| Variable | Description |
|---|---|
| `{{current_time}}` | Current time in America/Los_Angeles |
| `{{current_time_[tz]}}` | e.g., `{{current_time_Europe/London}}` |
| `{{current_hour}}` | Decimal hour (e.g., 14.5 for 2:30 PM) |
| `{{current_calendar}}` | 14-day calendar starting today |
| `{{session_duration}}` | How long call has been active |
| `{{direction}}` | "inbound" or "outbound" |
| `{{user_number}}` | User's phone number |
| `{{call_id}}` | Unique call session ID |
| `{{call_type}}` | "web_call" or "phone_call" |

### Passing Variables at Call Time (Outbound via N8N)
```json
POST https://api.retellai.com/v2/create-phone-call
{
  "from_number": "+14155551000",
  "to_number": "+14155552000",
  "agent_id": "agent_123abc",
  "retell_llm_dynamic_variables": {
    "customer_name": "John Smith",
    "reason": "2024 E-Class Test Drive Follow-Up",
    "appointment_date": "March 20th at 2pm"
  }
}
```

### Default Variables (Global Settings → Default Dynamic Variables)
```json
{
  "company_name": "Mercedes-Benz South Bay",
  "support_number": "+14155551234",
  "business_hours": "9am-6pm PST Monday-Saturday"
}
```

### Components System
- **Library Components** — shared across all agents. Edits sync everywhere. Use for: identity verification, payment, FAQ handling.
- **Agent Components** — local to single agent. Use for: agent-specific variations.
- Structure: Begin Node → Internal Nodes → Exit Node

---

## 6. TESTING WORKFLOW

### Step 1: Simulation Mode (Text Only)
Top bar → "Simulation" tab. Set variables, start conversation, observe node transitions, variable updates. **Limitation:** Does not test voice quality, latency, or interruptions.

### Step 2: Test Agent (Voice Testing)
Global Settings → Test Agent → select phone number → set variables → initiate call.

**Voice Testing Checklist:**
- [ ] Voice quality and clarity
- [ ] Speaking pace appropriate
- [ ] Interruption handling (talk over agent, verify it stops and listens)
- [ ] Pronunciation of boosted keywords
- [ ] Transfer functionality
- [ ] Function execution (API calls trigger)
- [ ] End call scenarios (hangup, silence timeout, max duration)

### Step 3: Version Control
- **Draft** = working version (only you see it)
- **Published** = live version handling real calls
- Workflow: Draft → Simulate → Voice Test → Compare → Publish → Monitor first 20 calls

### KPI Targets
| Metric | Target |
|---|---|
| Call Completion Rate | >80% |
| Human Transfer Rate | <20% |
| User Sentiment | >70% positive/neutral |
| Function Success Rate | >95% |
| Average Call Duration | Monitor for outliers (>10 min = possible loop) |

---

## 7. PRODUCTION DEPLOYMENT CHECKLIST

### Pre-Launch (Full checklist in `references/checklists.md`)
1. **Global Settings:** Rigid mode, voice tested, global prompt complete, PII redaction ON, webhook configured
2. **Flow Architecture:** All nodes named, no orphaned nodes, every conversation node has transitions, all transfer nodes have failure paths, all logic splits have default/fallback edges
3. **Human Transfer:** 2-attempt pattern, transfer type selected, whisper messages written, failure paths connected
4. **Variables:** Defaults set, no missing variables in prompts
5. **Testing:** 5+ simulation scenarios passed, 3+ voice tests done, edge cases tested (interruptions, silence, invalid inputs)
6. **Compliance:** PII redaction, TCPA for outbound, recording consent if required

### Launch Monitoring (First 24 Hours)
Review every call (first 20-30). Monitor: unexpected transitions, transfer failures, function errors, user confusion, compliance issues.

---

## 8. PATTERNS & ANTI-PATTERNS

### DO ✅
- Use **Rigid Mode** for multi-step flows
- Keep node prompts **focused on single task**
- Use **structured prompts** (Task / Context / Behavior / Examples)
- Include **2-3 examples** in complex nodes
- Name nodes with **action + context** ("Greetings - Nia", not "Node 1")
- Always **connect transfer failure paths**
- Set **dynamic variable defaults** (prevents `{{variable_name}}` appearing in speech)
- **Test voice** before publishing (simulation doesn't catch voice/latency issues)
- Enable **PII redaction** for production (no exceptions)
- Use **Extract Variable nodes** instead of asking model to "remember" info

### DON'T ❌
- Use Flex Mode for complex flows (unpredictable, hard to debug)
- Write mega-prompts in single node (split into multiple focused nodes)
- Forget default/fallback transitions (flow breaks on unexpected user input)
- Leave transfer nodes without failure paths (call hangs abruptly)
- Publish without simulation + voice testing
- Duplicate global guardrails in node prompts (already inherited)
- Hardcode values that could be variables (`"Call us at 415-555-1234"` → `{{support_number}}`)
- Use LLM temperature >0.3 in production (introduces variance)

### Optimization
- Use Claude Haiku for simple greeting/routing nodes, GPT-4.1 for complex reasoning → **30-50% cost reduction**
- Compress prompts: "Be professional" beats "You must always maintain a professional demeanor at all times"
- Consolidate sequential nodes with no branching → reduces latency

---

## 9. TROUBLESHOOTING

| Issue | Solution |
|---|---|
| Agent doesn't transition to next node | Check transition condition. Add broader condition or "default" edge. |
| Agent repeats same response | Node has no outgoing edges, or all conditions fail. Add fallback transition. |
| Agent speaks too fast/slow | Global Settings → Voice Speed. Adjust 0.8-1.2. |
| Agent gets interrupted too easily | Global Settings → Interruption Sensitivity. Lower to 0.7-0.8. |
| Transfer fails every time | Verify phone format (+1XXXXXXXXXX). Check dial timeout (increase to 60s). Enable human detection. |
| Function not executing | Check "Speak During Execution" and "Wait for Result" settings. Verify webhook URL accessible. |
| `{{name}}` shows instead of value | Variable not passed at call time and no default set. Set default in Global Settings or pass in API call. |
| Agent ignores global persona | Node prompt may conflict with global. Ensure node prompts ADD TO, not REPLACE global prompt. |
| Call ends abruptly | Check "End Call on Silence" timeout. Verify max call duration not too short. |
| Latency >2s responses | Use faster model (GPT-4.1 > GPT-4o for speed). Reduce prompt length. Use faster voice model. |

### Debug Workflow
1. Reproduce → run test call or simulation, note which node was active
2. Inspect transcript → Dashboard → Calls → Select call → review transcript + node transition log
3. Identify root cause → transition fail? agent misunderstand? function fail? transfer fail?
4. Make targeted fix → edit specific node or transition, don't rebuild entire flow
5. Retest same scenario + adjacent scenarios

---

## 10. API INTEGRATION (Appendix D)

### Outbound Call Initiation
```
POST https://api.retellai.com/v2/create-phone-call
Headers: { "Authorization": "Bearer YOUR_API_KEY", "Content-Type": "application/json" }

Body: {
  "from_number": "+14155551000",
  "to_number": "+14155552000",
  "agent_id": "agent_abc123",
  "retell_llm_dynamic_variables": {
    "customer_name": "Jane Smith",
    "reason": "Follow-up on service inquiry",
    "appointment_date": "March 20th"
  },
  "metadata": { "campaign_id": "CAMP-001" }
}

Response: { "call_id": "call_xyz789", "agent_id": "agent_abc123", "call_status": "registered" }
```

### Webhook Events
- `call_started` — Call connected
- `call_ended` — Call terminated
- `call_analyzed` — Post-call analysis complete
- `transcript_update` — Real-time transcript chunk

### N8N Webhook Handler Pattern
```
Webhook Trigger → Switch node (routes by event type) → Process event data → Respond 200 OK
```

---

## REFERENCES
- `references/checklists.md` — Full New Agent, Node Creation, Transfer Node, Pre-Publish checklists
- `references/prompt-templates.md` — Persona descriptors, prompt engineering templates, guardrail patterns
- Source: `Downloads/Retell Browser Control.pdf` (v1.0, March 2026, 40 pages)
