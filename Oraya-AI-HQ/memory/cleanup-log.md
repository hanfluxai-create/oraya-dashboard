# Memory Cleanup Log

## 2026-04-24 — Automated pass (stale-items-cleanup)

### Boot-path correction
Scheduled task still points at `/Users/.../Claude hq/memory/*.md`. Actual memory files live at `/Users/.../Claude hq/Oraya-AI-HQ/memory/*.md`. Ran against the correct paths. Recommend updating the task file so future runs hit the right boot list without a lookup step.

### pending-actions.md
- Teresa anchor-close: marked [OVERDUE as of Apr 24]. Pending date was Apr 22; no branch pick (a/b/c/none) is reflected in the notes as of Apr 24, and the fallback rule says "no outreach before Apr 28" if nothing lands. Needs a decision log today.
- Inventory sprint, Stripe live-mode, Renaissance pivot, Direct-to-owner pivot, George P2 callback, Day 4 lock: all dated Apr 22 to Apr 25. Not stale, not overdue. Left alone.
- No items older than 14 days. No "Needs Decision" section added.

### active-projects.md
No action. Registry file with no dated task entries. Project status lives in dashboard and per-project `PROJECT.md` files; those are the correct targets for 14-day staleness checks, not this file.

### learnings.md
No action. No new correction pattern has reached 3+ occurrences since the Apr 21 pass. Existing hardened rules (dashboard push, dashboard scope, em/en dashes, Per-node Model SOP, boot sequence) still cover all repeat violations.

### contacts.md
- Chris Mazzio: status block marked [OVERDUE as of Apr 24]. Apr 22 walk-in trigger ("no reply to text + voicemail by 3 PT today") has passed without a documented resolution. Added a note to confirm whether walk-in fired or update status before the Apr 28 recast-dormant deadline.
- Teresa: status block marked [OVERDUE as of Apr 24]. Same Apr 22 anchor-close pending that is flagged in pending-actions.md.
- No other contact has a passed deadline.

### Rule fidelity
No em dashes introduced. Only overdue items touched. Four files, three narrow edits, one new cleanup-log entry.

### Recommendation for next pass
Repeat Apr 21 recommendation: retarget the scheduled task at `TASKS.md` + dashboard Tasks tab + `memory/learnings.md`. Additionally, update the boot-list file paths in the task file itself to `Oraya-AI-HQ/memory/`. If Teresa and Mazzio statuses are not updated manually before the next run, escalate them in the next pass summary.

---

## 2026-04-21 — Automated pass (stale-items-cleanup)

### State of memory
All four target files were rewritten 2026-04-20 during HQ consolidation. None are 14+ days old. Task state has moved to the dashboard (`projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html`, Tasks tab) and `TASKS.md`. Memory files now hold rules and reference content, not dated task items.

### pending-actions.md
No action. File is now a process-notes reference, not a task tracker. Zero items marked done, zero dated entries, zero deadlines. Nothing to move, mark [STALE], or mark [OVERDUE]. Cleanup target has shifted: dashboard is the correct surface for stale-task detection going forward.

### active-projects.md
No action. Registry of 5 projects (Oraya P1, Oraya P2, HanFlux AI, Mercedes Kimi Agent, Retell CTO Copilot). No per-project "Last Updated" dates; status lives in `PROJECT.md` files and the dashboard. All projects were touched on or after Apr 18.

### learnings.md
No action. Repeated-violation patterns (3+ occurrences) already carry hardened "Do NOT" rules:
- Dashboard push (5+ violations) has hard rule with exact command
- Dashboard scope (4 violations Mar 30) has hard rule with test question
- No em/en dashes has hard rule with allowed substitutes
- Per-node Model SOP (Mtg 19) locks model choice with Frankie quote
No new pattern has reached 3+ violations since consolidation.

### contacts.md
No action. No contact has a dated pending action. Long-standing legal risk flagged on Jared / Abdo Melek SAFE docs (unsigned / unnotarized) is tracked in the dashboard Tasks tab, not here.

### Recommendation for next pass
Point the scheduled task at the dashboard and `TASKS.md` instead of `memory/*.md`. The cleanup heuristics (done-in-pending, 14-day stale, passed deadline, 3+ repeats) fit a task board, not reference docs. Suggested new boot list:
1. `TASKS.md`
2. Dashboard Tasks tab (parse HTML data structure)
3. `memory/learnings.md` (for repeat-rule detection only)
