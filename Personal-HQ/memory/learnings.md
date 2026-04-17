# Accumulated Learnings & Corrections
**Last Updated:** March 27, 2026

---

## Corrections Log

| Date | What Claude Got Wrong | What's Actually True |
|---|---|---|
| Mar 14, 2026 | Estimated Retell AI cost at $50-150/mo | Actual: $1.50–$200/mo. Much lower floor. |
| Mar 14, 2026 | Described Greg as "pilot buyer/champion" | Greg was a proposed 10% equity PARTNER who is now OUT entirely |
| Mar 14, 2026 | Treated all transcripts as one project | TWO separate projects: Voice AI (automotive) and Insurance Lead Gen |
| Mar 14, 2026 | Estimated total infra cost at $70-365/mo | Confirmed by founders: $30-40/mo per client |
| Mar 14, 2026 | Called the company "Oraya Labs" exclusively | Used interchangeably as "Oraya Labs" and "Oraya AI" — both correct |
| Mar 15, 2026 | Created .claude-hq/ in temp session directory | Always create in Downloads (mounted folder) — temp dirs are wiped between sessions |
| Mar 16, 2026 | Had 140% commission as current rate | Currently 110% advance. 140% unlocks at $60-100K/mo issued premium volume. |
| Mar 16, 2026 | Showed Frankie with CA + TX + 1 unknown license | Frankie has: CA, TX, Idaho, Nevada. Mortgage protection does NOT need separate license. |
| Mar 16, 2026 | Listed voice AI embedded in email as possible | NOT possible — replaced with consent box in email + landing page with AI voice button. |
| Mar 16, 2026 | Listed website on "Lovable" | Website now on Google HTTP, hosted via Vercel. Domain orayalabs.ai connected. |
| Mar 16, 2026 | Used Any.do for email sender | Email sender should be N8N, not Any.do |
| Mar 16, 2026 | Voice agent model listed as Claude Opus 4.5 | Voice agent runs Claude IQ 4.5. Workflows/dashboard run on Opus 4.5. |
| Mar 16, 2026 | Lead resale without opt-in at $3-10 | Without opt-in = $0 revenue. Not pursuing — too much legal exposure. |
| Mar 27, 2026 | Pushed dashboard to `master` branch | Repo default branch (watched by Vercel) is `main`, NOT `master`. Always push to `main`. Command: `cd ~/Downloads/Claude\ hq && git push origin main` |
| Mar 28, 2026 | CRM was listed as HubSpot | CRM is now GHL (GoHighLevel). HubSpot is deprecated. Frankie giving admin access. |
| Mar 28, 2026 | Agentic 2-way transfer assumed ready | Agentic 2-way transfer requires a separate call transfer AI agent. Not available. Cold transfer after 3 attempts set instead. |
| Mar 28, 2026 | Did not know about $10K investment | $5K from Jared + $5K from Abdo Melek invested. Convertible SAFE note drafted but likely unsigned/unnotarized. LEGAL RISK. |
| Mar 30, 2026 | Put personal projects (Fraudopedia, Dissertation, Retell CTO, Campus, Kimi) on Oraya dashboard | Oraya dashboard is STRICTLY Oraya company content (P1 + P2 only). Never mix personal ventures. |
| Mar 30, 2026 | Listed "Mercedes Kimi Agent" as a project | This project does NOT exist. Remove from all project lists. |
| Mar 30, 2026 | Listed Retell CTO Copilot as a project | Retell CTO Copilot is a SKILL (internal tool), not a project. Lives in skills/, not projects/. |
| Mar 30, 2026 | Listed Fraudopedia, Dissertation, Campus Platform on Oraya dashboard | These are PERSONAL ventures. NEVER appear on the Oraya company dashboard. |
| Mar 28, 2026 | Git push failed with HEAD.lock error | A crashed git process left a lock file. Fix: `rm -f ~/Downloads/Claude\ hq/.git/HEAD.lock` before retrying. Always prepend this to push commands if push fails. |
| Mar 28, 2026 | Failed to provide git push command after dashboard update | MANDATORY: after EVERY dashboard edit, provide the push command IMMEDIATELY in the same response. Never wait to be asked. This is non-negotiable. |

---

## Technical Knowledge (From Production Files)

### Retell Payload — Exact Field Paths (from Copy Outbound Post Call.json)
```javascript
// Standard fields
$json.body.call.direction
$json.body.call.to_number
$json.body.call.call_analysis.user_sentiment
$json.body.call.call_analysis.call_summary
$json.body.call.call_analysis.call_successful

// Custom analysis fields
$json.body.call.call_analysis.custom_analysis_data.Caller_Name
$json.body.call.call_analysis.custom_analysis_data['Caller\'s email id']
$json.body.call.call_analysis.custom_analysis_data['appointment date']
$json.body.call.call_analysis.custom_analysis_data.appointment_booked
$json.body.call.call_analysis.custom_analysis_data.appointment_timestamp
$json.body.call.call_analysis.custom_analysis_data.car_model
$json.body.call.call_analysis.custom_analysis_data.call_back_scheduled
$json.body.call.call_analysis.custom_analysis_data.call_back_reason
$json.body.call.call_analysis.custom_analysis_data.Customer_sentiment
$json.body.call.call_analysis.custom_analysis_data.Query_Type
```

### N8N Credential IDs (Production)
- Supabase: `t68H7KhMcrrNgUPs` ("Supabase account")
- Gmail: `1EASaEHAoK3fG6X1` ("Gmail account")
- Twilio: `PcO0YC16KIquuS6x` ("Twilio account")
- Google Calendar: `2BaP72YO9q5pyBGt` ("Google Calendar account")

### Supabase Tables (Production)
- "Appointment Log" — appointment bookings
- "Call back log" — callback requests

### Voice Agent Architecture
- 10-node optimized design (never suggest 21+ nodes again)
- Interrupt sensitivity: 0.8 | Max call: 300s | Silence timeout: 120s
- PCDE node is always entry IF node for post-call workflows

### HanFlux AI
- SEPARATE from Oraya Labs — never conflate
- India pricing: ₹2,999-19,999/mo | International: $49-399/mo
- Revenue share model: 0% upfront, 15% of results

---

## Dashboard Push Protocol (Established Mar 15, 2026)

- The VM sandbox cannot reach GitHub's network directly — never attempt API calls or git push from within the session
- Always give Chitraksh a ready-to-run bash command to execute in his Mac terminal
- Push workflow: Claude updates the HTML file in deliverables/ → asks "Approve push to GitHub?" → on yes, provide the exact bash command block with a descriptive commit message
- The push command uses `-f` (force push) since the repo has no history chain from temp dirs
- Credentials are stored in `Claude hq/.github-config` — read it to get PAT if needed

## Patterns Observed

- **Chitraksh values visual quality:** Interactive HTML, well-designed dashboards. Dark themes for operational dashboards only. Daily brief = white card-based HTML matching the Mar 30 task emails (white bg, colored left-border blocks, card shadows, clean section labels, accent header strip). Chitraksh said Mar 30: "use the white dashboard thing you created in mails as html." That is now the brief standard.
- **Chitraksh values efficiency:** Gets frustrated when context is lost. Incremental updates, never rebuilds.
- **Chitraksh thinks in systems:** Auto-learning, autonomous behavior, sub-agents, scheduled audits
- **Multi-surface worker:** Cowork, VS Code, browser, mobile — memory must be portable
- **Production-first mindset:** Ship fast, iterate. Don't over-plan.
- **Website pricing NOT FINAL:** Never analyze or reference it
- **Frankie's insurance expertise is core IP:** 140% commission, carrier relationships, CA/TX licensed
- **N8N is the orchestration backbone:** Always suggest N8N-first for automation
- **Retell is the voice layer:** Chitraksh knows it deeply — don't explain basics
- **Law background underutilized:** Leverage for TCPA, compliance, data privacy

---

## REINFORCED RULES (3+ Violations Logged -- Standard Rule Was Insufficient)

**DASHBOARD PUSH PROTOCOL (5+ violations: wrong branch x2, HEAD.lock, missing push command, boot sequence skipped before execution):**
Every single dashboard edit session MUST end with the exact push command in the same response, every time, without exception. Command format: `cd ~/Downloads/Claude\ hq && cp projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && git add index.html projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html && git commit -m "MESSAGE" && git push -f origin HEAD:main`. If git push fails, prepend `rm -f ~/Downloads/Claude\ hq/.git/HEAD.lock &&`. Never push to master. Never forget the cp to index.html.

**ORAYA DASHBOARD = P1 + P2 ONLY (4 violations on Mar 30 alone):**
The Oraya dashboard is a company-facing business dashboard. It contains ONLY P1 (Automotive Voice AI) and P2 (Insurance Lead Gen). Dissertation, Fraudopedia, Campus Platform, HanFlux AI, Retell CTO Copilot, Mercedes Kimi Agent, and any other personal or internal tools are PERMANENTLY EXCLUDED. Before adding any section, tab, or metric to the dashboard, ask: "Is this Oraya company revenue or product?" If no, it does not belong.

| Apr 5, 2026 | Gave git push command using `git push origin master` | WRONG. Repo Vercel branch is `main` not `master`. Also forgot `cp` to index.html. This mistake was ALREADY LOGGED in learnings.md (Mar 27). I failed to read learnings.md BEFORE executing the dashboard update. The entire point of the boot sequence is to prevent known mistakes. I read the file AFTER I already made the error. Correct command: `cd ~/Downloads/Claude\ hq && rm -f .git/HEAD.lock && cp projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main` |
| Apr 5, 2026 | Did not follow boot sequence properly | Read learnings.md and sentient-protocol.md AFTER executing the dashboard update instead of BEFORE. This means I repeated logged mistakes (wrong branch, missing cp, missing lock removal). Boot sequence exists to prevent this. RULE: Read ALL memory files FIRST, THEN execute. No exceptions. |
| Apr 5, 2026 | Did not self-improve from meeting content | Meeting 16 had explicit directives: (1) AI must cross-reference current state vs previous dashboard before updating task completion scores, (2) AI must adapt to founder personalities, (3) Create vision.md, (4) Create dashboard update process so new sessions know HOW to update. I executed updates but did not build the PROCESS to prevent future drift. Building systems > doing tasks. |
| Apr 5, 2026 | Psych meter task completion was frozen for 6+ sessions | Frankie explicitly complained: "update my fucking execution and task completion rate." The AI kept showing 5.0 because each session had no instruction to cross-reference actual work done vs. displayed score. Fix: every dashboard update must read previous dashboard state, compare against WhatsApp/transcript evidence of completed work, then adjust scores with justification. |
| Apr 5, 2026 | Treated ORIA agent prompt as decoration | Chitraksh provided a full autonomous agent operating framework (ORIA) with specific requirements: Gishput command block, memory system, visualization engine, dashboard protocol, instruction sensitivity layer. I partially followed it but missed: visualization engine (no strategic maps or decision trees generated), autonomous improvement protocol (did not proactively restructure anything), and did not create proper memory type files (strategic, operational, psychological, project). Must treat ORIA prompt as binding operational protocol. |
| Apr 4, 2026 | Assumed `setNodes` (React Flow) persists to Retell backend | `setNodes` updates VISUAL state only. Retell has its own state store. Only React `__reactProps.onChange` on textareas triggers autosave. |
| Apr 4, 2026 | Tried drag-and-drop from sidebar to create nodes | Sidebar items have `onClick` not `onDragStart`. Click the sidebar item to create a new node at a default position. |
| Apr 4, 2026 | Assumed JWT token alone works for Retell API | Retell's dashboard JWT requires an org_id that is NOT passed as a simple x-org-id header. Use the dashboard UI or intercept real API calls. |
| Apr 4, 2026 | Assumed canvas DOM coords match screenshot coords consistently | Coords shift as the canvas pans. Re-query `getBoundingClientRect()` just before clicking -- never reuse stale coords from earlier steps. |
| Apr 4, 2026 | Assumed Retell nodes have a `tools` array in base data | Raw node data schema: `{ instruction, name, edges, id, knowledge_base_ids, type, display_position }`. No `tools` at this level. Tools/functions are wired via Components tab in the UI. |

---

## Do NOT Repeat These Mistakes
- Never start Oraya analysis from scratch — always update incrementally
- Never call Greg a current stakeholder — he is OUT
- Never estimate costs without checking PROJECT.md first
- Never treat P1 and P2 as one project — separate business lines
- Never analyze website pricing — it is not final
- Never suggest tools Chitraksh already uses without acknowledging his expertise
- Never confuse HanFlux AI with Oraya Labs
- Never deprioritize the law dissertation — active academic deadline (but it is PERSONAL, never on Oraya dashboard)
- NEVER put personal projects (Dissertation, Fraudopedia, Campus Platform, HanFlux, Retell CTO) on the Oraya company dashboard
- NEVER list "Mercedes Kimi Agent" — this project does not exist
- Retell CTO Copilot is a SKILL, not a project — belongs in skills/ directory only
- Oraya dashboard = P1 (Voice AI / Automotive) + P2 (Insurance Lead Gen) ONLY
- Never create .claude-hq/ in temp/session directories — always use Downloads
- **Retell canvas: never rely on stale DOM coords.** Canvas pans constantly. Always re-run `getBoundingClientRect()` immediately before clicking. A coord gathered 3 steps ago is already wrong.
- **Retell node creation: click sidebar item, do NOT drag.** Dragging fails silently. Clicking the sidebar "Conversation" item creates the node at a default canvas position.
- **Retell node name editing: click the invisible pencil button at (nodeX+76, nodeY+9) in DOM coords, then Cmd+A, type, Enter.** The button is `invisible group-hover:visible` so you can click it without hovering.
- **Retell prompt saving: fire `__reactProps.onChange({ target: { value: ta.value } })` on the textarea, then `onBlur`.** This triggers Retell's autosave. `setNodes` does NOT save.
- **Retell transition editing: hover over transition row to reveal pencil icon, then click it.** Re-query position each time before clicking since canvas may have panned.
- Never guess Retell payload field names — always reference skills/n8n-workflows/SKILL.md
- **Never claim a skill doesn't exist without searching ALL skill folders first** — on Mar 15, 2026, Claude told Chitraksh there was no legal review skill when `skills/legal-review-skill/` existed the whole time. Always `ls` the skills directory before saying "that doesn't exist."
- Never handle legal tasks with general knowledge alone — ALWAYS load `skills/legal-review-skill/SKILL.md` first
- **NEVER use em dashes (—), en dashes (–), or any dash variants in any document produced for Chitraksh.** These signal AI-generated content. Use colons, commas, semicolons, parentheses, or natural phrasing instead. This applies to all documents: PDFs, DOCX, letters, reports, proposals, emails.
- **GitHub push command MUST include `cp` to root `index.html`:** The Vercel deployment at oraya-dashboard.vercel.app serves from repo root. Always copy the dashboard HTML to `index.html` at repo root before pushing. Full command: `cd ~/Downloads/Claude\ hq && cp projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && git add index.html projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html && git commit -m "message" && git push -f origin HEAD:main`
