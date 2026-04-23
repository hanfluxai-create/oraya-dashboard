# Memory Cleanup Log

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
