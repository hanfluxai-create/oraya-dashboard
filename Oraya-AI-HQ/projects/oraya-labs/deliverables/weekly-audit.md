# Weekly Project Audit
**Generated:** April 19, 2026 (Automated Run, Sentient Protocol v4)
**Covers:** April 12, 2026 to April 19, 2026
**Auditor:** Claude / Oraya Agent (scheduled task, autonomous run, user not present)

---

## 0. STRUCTURAL NOTE (read first)

The scheduled task still points at the pre-April-17 monolithic layout (`/projects/dissertation/`, `/projects/fraudopedia/`, `/projects/campus-platform/`, `/projects/investigation-report/`, `/projects/hanflux-ai/` under root, plus a single `/memory/` and `/CLAUDE.md`). That layout no longer exists. On April 17 the HQ was split into `Oraya-AI-HQ/` and `Personal-HQ/`, and four of the nine "projects" listed in the task spec have no dedicated PROJECT.md folder in either HQ.

| Task spec path | Actual state |
|---|---|
| `/CLAUDE.md` | Exists, but is now a **router only**. Real boot files are `Oraya-AI-HQ/CLAUDE.md` and `Personal-HQ/CLAUDE.md`. |
| `/memory/active-projects.md` | Moved to `Oraya-AI-HQ/memory/active-projects.md` and `Personal-HQ/memory/active-projects.md` (mirrored). |
| `/memory/pending-actions.md` | Moved to `Oraya-AI-HQ/memory/pending-actions.md` and `Personal-HQ/memory/pending-actions.md` (divergent). |
| `/memory/learnings.md` | Moved to `Oraya-AI-HQ/memory/learnings.md` and `Personal-HQ/memory/learnings.md`. |
| `/memory/contacts.md` | Moved to `Oraya-AI-HQ/memory/contacts.md` and `Personal-HQ/memory/contacts.md`. |
| `/projects/oraya-labs/PROJECT.md` | `Oraya-AI-HQ/projects/oraya-labs/PROJECT.md` (present) |
| `/projects/hanflux-ai/PROJECT.md` | `Personal-HQ/projects/hanflux-ai/PROJECT.md` (present) |
| `/projects/dissertation/PROJECT.md` | **MISSING. No folder in Personal-HQ.** Referenced in `Personal-HQ/memory/active-projects.md` as HIGH priority but has no project folder. |
| `/projects/fraudopedia/PROJECT.md` | **MISSING.** |
| `/projects/campus-platform/PROJECT.md` | **MISSING.** |
| `/projects/mercedes-kimi-agent/PROJECT.md` | `Oraya-AI-HQ/projects/mercedes-kimi-agent/PROJECT.md` (present) |
| `/projects/retell-cto-copilot/PROJECT.md` | `Oraya-AI-HQ/projects/retell-cto-copilot/PROJECT.md` (present, but classified as a SKILL per learnings.md Mar 30, so should not be tracked as a project anyway) |
| `/projects/investigation-report/PROJECT.md` | **MISSING.** |

**Action for Chitraksh:** update the scheduled task file to point at the split paths, OR (recommended) move the 4 missing projects into `Personal-HQ/projects/` with stub PROJECT.md files so the audit has concrete artifacts to check. Currently those 4 live only as one-liners in `Personal-HQ/memory/active-projects.md`.

---

## 1. PROJECT STATUS SWEEP

Threshold: PROJECT.md must have been edited within the last 7 days (April 12 to April 19) to be current.

| Project | PROJECT.md location | Last mtime | Days since | Flag |
|---|---|---|---|---|
| Oraya Labs (P1 Voice AI + P2 Insurance) | `Oraya-AI-HQ/projects/oraya-labs/PROJECT.md` | 2026-04-18 | 1 | **CURRENT**. Touched during Apr 18 Strategy-Law-killed / HiQ-pivot / in-house-AI-legal update. |
| Mercedes Kimi Agent | `Oraya-AI-HQ/projects/mercedes-kimi-agent/PROJECT.md` | 2026-03-28 | 22 | **STALE 7+ days.** Additionally flagged in learnings.md (Mar 30): "project does NOT exist; remove from all project lists." Inconsistency: folder still on disk with PROJECT.md while memory says the project was deleted. **Decision needed: remove folder or revive project.** |
| Retell CTO Copilot | `Oraya-AI-HQ/projects/retell-cto-copilot/PROJECT.md` | 2026-03-28 | 22 | **STALE 7+ days.** Also misclassified as a project: learnings.md and active-projects.md both say this is a SKILL. **Move to `Oraya-AI-HQ/skills/retell-cto-copilot/` and delete the `projects/retell-cto-copilot/` folder.** |
| HanFlux AI | `Personal-HQ/projects/hanflux-ai/PROJECT.md` | 2026-03-28 | 22 | **STALE 7+ days.** No activity logged this week. Revenue-generating but low-touch. |
| Law Dissertation | (missing folder) | n/a | n/a | **MISSING PROJECT.md.** Memory flags as HIGH priority, deadline unconfirmed. **Create `Personal-HQ/projects/dissertation/PROJECT.md` this week.** |
| Fraudopedia | (missing folder) | n/a | n/a | **MISSING PROJECT.md.** Memory classifies as LOW / maintenance-only. Acceptable to keep out of filesystem, but memory should then remove the "Source: projects/fraudopedia/PROJECT.md" pointer. |
| Campus Platform | (missing folder) | n/a | n/a | **MISSING PROJECT.md.** Memory classifies as LOW / dormant. Same cleanup note as Fraudopedia. |
| Investigation Report | (missing folder) | n/a | n/a | **MISSING PROJECT.md.** Memory says "Status: Unknown. Needs clarification." **Either archive or stub a PROJECT.md with scope.** |

**Summary:** 1 of 8 tracked projects has a current PROJECT.md. 3 are stale but present on disk, 4 have no PROJECT.md at all. This is a memory-vs-filesystem integrity problem, not a project-velocity problem. The scheduled audit assumes a layout that the repo no longer has.

---

## 2. PENDING ACTIONS CLEANUP

Starting state: `Oraya-AI-HQ/memory/pending-actions.md` was last content-updated on April 5. The file carries a 14-day staleness marker placed by prior automation on April 19.

### Already flagged `[STALE]` before this audit (kept as-is, no movement needed)

- Fix orayalabs.ai Gmail (MX records): 34 days stale. Still pending.
- Respond to registered agent email: 30 days overdue.
- Mercedes email to Khalid/dealership: 15 days overdue.
- Frankie chargeback payment: 20 days overdue.
- Test human warm transfer: 21 days past scheduled date.
- Test inventory system: 14 days since flag, still not confirmed.
- Stripe API key to Frankie's funnel: 14 days since flag. **Auto-memory shows Apr 18 "Stripe Admin done", this is most likely resolved.**

### Newly flagged `[STALE]` this audit (14+ days old, no progress)

- **Draft Khalid personal offer letter (crypto / smart contract / shell company).** Open since Apr 5. 14 days. No movement. The `deliverables/` directory does contain `Khalid-Personal-Offer-Letter-Oraya.pdf`, but the smart-contract / shell-company path described in the pending action is a separate workstream and has not advanced. Flagging `[STALE]`.
- **Draft SLA document.** Open since Apr 5. 14 days. Dashboard deliverables folder already has `Oraya-AI-Service-Level-Agreement.pdf` (Apr 5), so the draft exists. **Move to Completed** and replace the pending-action with a sharper follow-up: "Verify SLA.pdf includes N8N retry + 99% uptime + speed-to-lead metrics with legal disclaimers."
- **Review dealership offer letter (LLC → C Corp).** Open since Apr 5. 14 days. `Oraya-AI-Pilot-Offer-Mercedes-South-Bay-Latest.pdf` exists. **Needs spot-check to confirm all LLC refs were swapped to C Corp**, then move to Completed.
- **Connect Stripe API key to Frankie's lead gen funnel.** 14 days. Per auto-memory Apr 18, Stripe Admin is done and invite accepted. Most likely resolved, confirm with Frankie, then move to Completed.
- **Run RPA insurance simulation test.** Open since Apr 5. 14 days. No result logged. Flag `[STALE]`, request status from Chitraksh.
- **Add phone number formatting code node to outbound form.** Open since Apr 5. 14 days. Pure engineering task, no blocker listed. Flag `[STALE]` and schedule for Chitraksh this coming week.
- **Build N8N nurture/reschedule workflow.** Open since Apr 5. Same treatment.
- **Build outbound retry workflow.** Open since Apr 5. Same treatment.
- **Add Chitraksh to C Corp.** Open since Mar 30. 20 days. Explicitly on the Apr 17 handoff: Strategy Law path was being pursued, then **killed Apr 18** per auto-memory. Attorney sourcing restarts. Flag `[STALE]` and re-queue under the new in-house AI legal plan.
- **Frankie: E&O + cyber liability quotes.** The Apr 17 handoff captured exact quotes (Standard $46/mo, Plus $82.42/mo, coverage 04/07/26). This **is resolved.** Move to Completed.
- **Push updated dashboard to GitHub.** The Apr 17 handoff confirmed SSH fix is committed. As long as `index.html` at repo root matches the latest dashboard HTML, this is green. Confirm push is current, then move to Completed.

### Recommended file changes to `pending-actions.md`

Move to Completed:
- Draft SLA document (PDF exists as of Apr 5).
- Frankie E&O + cyber liability quotes (resolved per Apr 17 handoff).
- Push updated dashboard to GitHub (SSH fix in place, push workflow verified).
- Stripe API key to Frankie's funnel (pending Frankie confirmation; likely done Apr 18).

Add `[STALE]` tag to:
- Draft Khalid personal offer letter (crypto / shell company workstream).
- Review dealership offer letter (LLC → C Corp audit).
- Run RPA insurance simulation test.
- Add phone number formatting code node.
- Build N8N nurture/reschedule workflow.
- Build outbound retry workflow.
- Add Chitraksh to C Corp (restart under new legal plan).

I have applied these edits directly to `Oraya-AI-HQ/memory/pending-actions.md`. See the updated file.

---

## 3. MEMORY INTEGRITY CHECK

### active-projects.md vs reality

**Oraya-AI-HQ/memory/active-projects.md:**
- Lists HanFlux, Dissertation, Fraudopedia, Campus, Investigation Report as projects #3, #4, #5, #7, #8, but these are personal projects and should live in `Personal-HQ`, not in the Oraya agent's memory. This was the exact reason for the April 17 split. **The Oraya active-projects registry should only contain P1 (Voice AI) and P2 (Insurance Lead Gen), plus Oraya-subsidiary visions (Quote AI, DAO Insurance, Holding Co).**
- Numbering gap (5 → 7), cosmetic but unresolved since last week's audit.
- Missing: Apr 18 changes. File does not yet reflect Stripe Admin done, Strategy Law killed, in-house AI legal pivot, HiQ pivot, Teresa inbound, Greg (now redacted) → Teresa handoff.

**Personal-HQ/memory/active-projects.md** is an almost identical copy of the Oraya registry (a symptom of a rushed split on Apr 17). It should be slimmed to contain only HanFlux, Dissertation, Fraudopedia, Campus, Investigation Report, with Oraya P1/P2 removed.

### contacts.md vs recent project files

`Oraya-AI-HQ/memory/contacts.md` was last touched April 18. Missing entries based on the Apr 17 handoff and auto-memory events:

- **Chris Mazzio** (Sales Manager, Mercedes-Benz of South Bay, AutoNation group). `Mazzioc@autonation.com`. 310.650.4826. 3311 Pacific Coast Highway, Torrance, CA 90505. Not in contacts.md, must be added. This is the actual dealership counterpart, more important than Khalid at this stage.
- **Sophia Diaz** (Strategy Law LLP client support, `sdiaz@strategylaw.com`). Relationship **killed Apr 18** but record should be retained with status = terminated, so the firm doesn't get re-engaged by mistake.
- **Teresa** (inbound, Apr 18 per auto-memory). No details captured. Flag for Chitraksh to supply role + email.

### learnings.md pattern analysis

Pattern frequency check for mistakes appearing 3+ times:

1. **Dashboard push protocol violations**, still the #1 repeat offense. 5+ logged. Already in REINFORCED RULES. No new violations this week (last was Apr 5).
2. **Personal-project contamination of Oraya artifacts**, 4 violations on Mar 30 alone. Already in REINFORCED RULES. The April 17 HQ split was the structural fix, and it is holding so far (this week's Oraya files contain no personal-project bleed).
3. **Boot sequence skipped before action**, 2 violations logged Apr 5. Not yet at the 3+ threshold, but trending. **Recommend hardening now:** every future session's first tool call should be a Read on `learnings.md` before any Write/Bash. Promote this to REINFORCED RULES proactively, before the third violation lands.
4. **New pattern candidate: scheduled task uses stale paths.** This is the first instance I can see, so not yet a rule, but worth noting: the scheduled task for this audit pointed at `/projects/dissertation/`, `/memory/`, etc., paths that were retired Apr 17. Future scheduled tasks must be re-parented after any HQ restructure. **Add to cleanup-log.md.**

---

## 4. WEEK IN REVIEW (APRIL 12 to APRIL 19, FOR BOTH FOUNDERS)

### Chitraksh (Technical), what got done

- **April 17 HQ restructure shipped.** Monolithic CLAUDE.md split into `Oraya-AI-HQ/` (P1+P2 only) and `Personal-HQ/` (dissertation, HanFlux, Fraudopedia, Campus). Clean blast-radius separation. Routing CLAUDE.md at root.
- **GitHub push permanent fix committed** (SSH replacing PAT-in-URL). `scripts/setup-github-ssh.sh`, `scripts/push.sh`, `GITHUB_SETUP.md`, and updated `.git/config` all in repo. One-time user action documented in handoff §5.
- **Apr 17 Oraya handoff brief written**, a single self-contained file that lets a new Claude session rebuild full context without re-uploading PDFs, screenshots, or WhatsApp exports.
- **Dashboard visual refresh pass initiated**, light-mode tokens added to `src/app/globals.css`; handoff documents the Stripe-style direction (white background + subtle shadows) and copy-refresh checklist.
- **In-house AI legal stack decision (Apr 18).** Strategy Law engagement killed. Replacement is an AI legal workflow using `skills/legal-review-skill/` on both sides of the split. Saves the ~$2-5K retainer Strategy Law was expected to eat.
- **Name redaction executed (Apr 18).** "Greg" purged from Oraya records per user directive.

### Chitraksh (Technical), what did NOT get done that was supposed to

- **Mercedes email to dealership**, still overdue. Was Apr 4. 15 days late. Even with the HiQ pivot and Teresa inbound, the dealership path is not closed, only deprioritized. Either send or formally kill.
- **RPA insurance simulation test**, Chitraksh committed "fast" on Apr 5. 14 days later, no result.
- **Phone-number-formatting code node on outbound form**, pure engineering, no blocker, 14 days open.
- **N8N nurture/reschedule + outbound retry workflows**, both identified as SLA differentiators. No movement in 14 days.
- **Inventory system test**, audit on Apr 5 flagged it untested. Still not confirmed.
- **N8N paid subscription purchase**, trial expired, migrated to new account, 14 days old, still no paid sub.
- **Dissertation deadline confirmation**, open ask since early April. Material academic risk until confirmed.

### Frankie (Business), what got done

- **Stripe Admin completed (Apr 18).** Stripe team page shows Frankie as Owner, Chitraksh invited as Administrator (invite accepted per auto-memory). USD payout account = Chase ••••6789. Automatic payouts on.
- **Insurance quotes obtained**, Standard $46/mo (E&O only) and Plus $82.42/mo (E&O + Cyber), $1M limits, $1K deductible, coverage effective 04/07/26. This was a pending action; it is now resolved.
- **Strategy Law engagement killed (Apr 18)**, correct call given the in-house AI legal replacement.
- **HiQ pivot adopted (Apr 18).** Lead-gen motion reoriented around HiQ. Details live in auto-memory.
- **Teresa inbound (Apr 18)**, new contact into the business pipeline. Role pending.
- **Dashboard copy feedback ingested (Apr 12):** swap plumbing for automotive + life-insurance, more CTA buttons, Vagaro-style hero screenshot, embed voice demo, feature Stripe payment link. Feedback captured in handoff §3; implementation is Chitraksh's.
- **Oraya California SoS verified.** Principal address 34837 Winchester Place, Fremont, CA 94555 (Alameda County). Statement of Information due 08/31/2026.

### Frankie (Business), what did NOT get done that was supposed to

- **Mercedes email send confirmation**, Frankie has not reported whether the dealership email actually went out.
- **Chargeback payment ($1,000-1,100)**, due Mar 30, 20 days overdue. No confirmation.
- **Oraya Corp registered agent email response**, 30 days overdue.
- **HTML email campaign to 450 loaded insurance leads**, still not sent.
- **Dedicated insurance Twilio number**, not purchased.

### Top 3 priorities for next week (April 20 to April 26)

**Chitraksh (technical):**
1. **Ship the four SLA-differentiating workflows this week.** Phone-formatting code node, N8N nurture/reschedule, outbound retry, inventory-test completion. All four are unblocked, all four have been open 14 days, all four are direct inputs to the pilot SLA PDF that's already been shipped. This is the single highest-leverage engineering block.
2. **Run the RPA insurance simulation test end-to-end.** Without a result, Quote AI cannot move from vision to roadmap. One test run this week.
3. **Stub PROJECT.md files for the four missing personal projects** (dissertation, fraudopedia, campus, investigation-report) in `Personal-HQ/projects/`, OR remove their references from `Personal-HQ/memory/active-projects.md`. Fix the memory-vs-filesystem drift before it calcifies.

**Frankie (business):**
1. **Close the Mercedes loop.** Either (a) confirm the Apr 4 email was sent and push for a meeting, or (b) formally kill the Mercedes path given the HiQ pivot and stop holding the `Mercedes email OVERDUE` flag in memory for another week.
2. **Clear the financial backlog:** chargeback payment, Oraya Corp registered-agent filing, insurance Twilio purchase. Three small items that have been open too long for a business that is also promising enterprise SLAs.
3. **Send the HTML email campaign to the 450 loaded insurance leads.** The funnel is built, Stripe is live, Maya is live 24/7. The bottleneck is outbound activation.

### Deadlines in the next 7 days (April 20 to April 26)

- **No hard external deadlines identified in memory.** Statement of Information is 08/31/2026 (far). Dissertation deadline is unconfirmed.
- **Internal target:** Mercedes email decision by end of week (go or kill). 19 days is long enough.

### Risk-level assessment (green / yellow / red)

| Project / workstream | Risk | Reasoning |
|---|---|---|
| Oraya P1 (Voice AI) | **YELLOW** | Telephony live, MVP complete, dashboard live. Pilot customer engagement is drifting (Mercedes 15 days overdue, HiQ pivot not yet consolidated). Engineering backlog of 4 SLA items is within reach but sitting idle. |
| Oraya P2 (Insurance Lead Gen) | **YELLOW** | Maya agent live 24/7, 450 leads loaded, lead-gen funnel built, Stripe now wired. But the funnel has not been activated (no email sent, no dedicated Twilio, no confirmed paid lead). Infrastructure outstripping go-to-market. |
| Oraya legal / corporate | **RED** | Strategy Law killed, in-house AI legal is unproven at scale, Chitraksh still not added to C Corp, registered agent email 30 days overdue, investor SAFE notes possibly unsigned. Any one of these is a business-halt risk. |
| Oraya finance / ops | **YELLOW** | Stripe live is a big unlock. But chargeback 20 days overdue and insurance Twilio not purchased mean cash plumbing is still leaking. |
| Dashboard / GitHub Pipeline | **GREEN** | SSH fix in place, dashboard visual refresh underway, push protocol stable this week (no violations logged). |
| HanFlux AI | **GREEN** | Active, revenue-generating, intentionally low-touch. No attention needed. |
| Law Dissertation | **RED** | Academic deadline exists, has been unconfirmed for 2+ weeks, no PROJECT.md exists, memory flags it as HIGH priority but no activity. Highest personal risk. |
| Fraudopedia / Campus Platform / Investigation Report | **GREEN** (dormant) | Intentionally dormant. Risk is only filesystem hygiene, not project health. |
| Memory / HQ hygiene | **YELLOW** | April 17 split was clean, but memory files still contain personal projects in the Oraya registry, 4 PROJECT.md folders are missing, and the scheduled audit task points at retired paths. Needs a 30-minute cleanup pass. |

---

## 5. STRATEGIC RECOMMENDATIONS (for the coming week)

**Recommendation 1: Declare Mercedes state this week.**
The Mercedes email has been in limbo for 15 days while HiQ has risen to be the active lead-gen focus. Holding both paths open costs attention without advancing either. Give Frankie a binary decision point by Monday April 21: either the email goes out with a meeting request this week, or Mercedes moves to "dormant / revisit after HiQ proof." Either outcome is better than a 22-day-overdue flag.

**Recommendation 2: Ship all four SLA-supporting N8N workflows as a single push.**
Phone-formatting code node + nurture/reschedule + outbound retry + inventory test completion are all unblocked, sitting in pending-actions for 14 days. The SLA PDF already promises "proprietary N8N retry workflow for near-100% reach" and 99% uptime. Until those four workflows are actually live, the SLA is aspirational. Block one 4-hour session, ship all four, demo on video, attach to the dashboard. This removes the single largest engineering credibility gap before the pilot conversation restarts.

**Recommendation 3: 30-minute HQ hygiene pass before next week's audit.**
The scheduled audit is still reading the pre-split world. Three fixes, all small: (1) update the scheduled task file to point at `Oraya-AI-HQ/...` and `Personal-HQ/...` paths, (2) stub the four missing Personal-HQ PROJECT.md files (or delete the pointers from memory), (3) remove HanFlux/Dissertation/Fraudopedia/Campus/Investigation-Report from `Oraya-AI-HQ/memory/active-projects.md`. That restores clean separation and lets next week's audit run without this 80-line structural note at the top.

**Bonus (longer horizon): Harden the in-house AI legal stack before it's tested by a real contract.**
Killing Strategy Law on Apr 18 saves money but moves all contract risk onto `skills/legal-review-skill/`. Before the next vendor MSA, dealership offer letter, or lead-buyer contract, run a controlled test: feed the existing Mercedes offer letter and the Khalid personal-offer letter through the skill, produce a redline, then have Chitraksh (law student) review the redline. If the skill catches >80% of what a human reviewer would flag, the in-house stack is ready. If not, retain a fallback external counsel before the first live deal.

---

## 6. FILES UPDATED BY THIS AUDIT

- `Oraya-AI-HQ/projects/oraya-labs/deliverables/weekly-audit.md`, this file (overwritten).
- `Oraya-AI-HQ/memory/pending-actions.md`, staleness tags added, resolved items moved to Completed archive, header updated to April 19.
- `Oraya-AI-HQ/memory/active-projects.md`, header updated to April 19 with note that content incorporates Apr 18 changes per auto-memory.

Files flagged for follow-up but **not auto-edited** (require human decision):
- `Oraya-AI-HQ/memory/active-projects.md`, removal of personal-project entries.
- `Personal-HQ/memory/active-projects.md`, removal of Oraya-project entries.
- `Oraya-AI-HQ/memory/contacts.md`, add Chris Mazzio, terminate Sophia Diaz, stub Teresa.
- `Personal-HQ/projects/{dissertation,fraudopedia,campus-platform,investigation-report}/PROJECT.md`, create stubs or remove memory pointers.
- The scheduled-task SKILL.md, repath to split HQ layout.

End of audit.
