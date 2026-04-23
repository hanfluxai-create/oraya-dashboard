# Learnings & Do-Not-Repeat Rules

---

## HARD RULES (violations logged, reinforced)

### Dashboard push (5+ violations)
After EVERY dashboard edit, output this in the SAME response. Never wait to be asked.
```bash
cd ~/Downloads/Claude\ hq && \
rm -f .git/HEAD.lock && \
cp Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && \
git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main
```
Branch = `main`, never `master`. `cp` to root `index.html` is mandatory (Vercel/Pages serve it). If push fails, `rm -f .git/HEAD.lock` first (already in command above).

### Dashboard scope (4 violations on Mar 30 alone)
Oraya dashboard = P1 + P2 only. Never add: HanFlux AI, Dissertation, Fraudopedia, Campus Platform, Retell CTO Copilot, Mercedes Kimi Agent. Before adding any section: "Is this Oraya company revenue or product?" If no, out.

### No em dashes, en dashes, or dash variants
Use colons, commas, semicolons, parentheses, or natural phrasing. Signals AI content. Applies everywhere: PDFs, DOCX, letters, emails, dashboard, memory.

### Boot sequence before execution
Read ALL memory files FIRST, execute SECOND. Reading `learnings.md` after breaking a rule is a failure.

---

## TECHNICAL (confirmed production)

### Retell payload field paths (from Copy Outbound Post Call.json)
```
$json.body.call.direction
$json.body.call.to_number
$json.body.call.call_analysis.user_sentiment
$json.body.call.call_analysis.call_summary
$json.body.call.call_analysis.call_successful
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
Never guess field names. Reference `skills/n8n-workflows/SKILL.md`.

### n8n credential IDs
- Supabase: `t68H7KhMcrrNgUPs`
- Gmail: `1EASaEHAoK3fG6X1`
- Twilio: `PcO0YC16KIquuS6x`
- Google Calendar: `2BaP72YO9q5pyBGt`

### Supabase tables
- `Appointment Log`
- `Call back log`

### Voice agent architecture
10-node optimized. Never 21+. Interrupt sensitivity 0.8, max call 300s, silence timeout 120s. PCDE node = entry IF for post-call.

### Retell canvas automation (Apr 4)
- **React Flow `setNodes` updates visual only.** Retell has its own store. Only `__reactProps.onChange` on textareas triggers autosave.
- **Creating nodes: click sidebar items.** Sidebar has `onClick`, not `onDragStart`. Drag fails silently.
- **Editing node names: click invisible pencil at (nodeX+76, nodeY+9), Cmd+A, type, Enter.** Button is `invisible group-hover:visible`, clickable without hovering.
- **Saving prompts: fire `__reactProps.onChange({ target: { value: ta.value } })` then `onBlur`.**
- **Editing transitions: hover row to reveal pencil, click.**
- **Coords: canvas pans constantly. Re-run `getBoundingClientRect()` immediately before clicking. Stale coords from 3 steps ago are already wrong.**
- **Retell JWT requires org_id, not passable as simple header.** Use dashboard UI or intercept real API calls.
- **Raw node schema: `{ instruction, name, edges, id, knowledge_base_ids, type, display_position }`. No `tools` at this level.** Tools wired via Components tab.

---

## CHITRAKSH PATTERNS

- Visual quality matters: interactive HTML, well-designed dashboards. Dark themes for operational dashboards; white card-based HTML (Mar 30 task email style) for daily briefs. Direct quote: "use the white dashboard thing you created in mails as html."
- Efficiency: incremental updates, never rebuild. Frustration with lost context.
- Systems thinker: auto-learning, sub-agents, scheduled audits.
- Multi-surface: Cowork, VS Code, browser, mobile. Memory must be portable.
- Production-first: ship fast, iterate. Don't over-plan.

---

## BUSINESS FACTS (don't get wrong again)

- **Cost:** Retell $1.50–$200/mo (not $50-150). Infra $30-40/mo per client (not $70-365).
- **Naming:** "Oraya Labs" and "Oraya AI" both correct.
- **Voice agent model:** Claude IQ 4.5. Workflows/dashboard: Opus 4.5.
- **Commission:** 110% advance currently. 140% unlocks at $60-100K/mo issued premium.
- **Frankie licensed:** CA, TX, Idaho, Nevada. Mortgage protection needs no separate license.
- **Website:** Vercel-hosted, Google HTTP. Domain orayalabs.ai.
- **Pricing NOT FINAL on website.** Never analyze or reference website pricing.
- **Email sender:** n8n, not Any.do.
- **Voice in email:** NOT possible embedded. Use consent box + landing page AI voice button.
- **Lead resale without opt-in = $0.** Too much legal exposure. Don't pursue.
- **Investment:** $5K Jared + $5K Abdo Melek = $10K total. Convertible SAFE drafted but likely unsigned/unnotarized. LEGAL RISK.
- **Transfer:** Cold works (SIP invite). Agentic 2-way needs separate agent, not available. Cold transfer after 3 attempts set.
- **HanFlux ≠ Oraya.** Never conflate. HanFlux is personal venture, pricing ₹2,999-19,999 / $49-399 / 15% revshare.

---

## STORAGE + SESSION

- Always create files in `~/Downloads/Claude\ hq/` (mounted). Never temp session dirs — wiped between sessions.
- Sandbox cannot reach GitHub directly. Always give Chitraksh a ready-to-run bash command.
- Git push uses `-f` since repo has no history chain from temp dirs.

---

## LEGAL

- Any legal task: load `skills/legal-review-skill/SKILL.md` before responding. General knowledge is insufficient.
- Never claim a skill doesn't exist without `ls`-ing the skills directory first.
- Dissertation is personal, not Oraya. Never on Oraya dashboard. Personal-HQ was deleted Apr 20, 2026; dissertation work is no longer tracked in this HQ.

---

## META (self-improvement)

- Building systems > doing tasks. When a meeting surfaces a directive for HOW to work, build that process, not just the one-off output.
- Cross-reference previous dashboard state + WhatsApp/transcripts before updating psych meters. Justify score moves with actual task evidence.
- Treat user-provided operating frameworks (e.g., ORIA agent prompt) as binding protocol, not decoration.
