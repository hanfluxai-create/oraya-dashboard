# Mercedes Deadline Countdown
**Generated:** April 22, 2026 (Automated Briefing, Run 4)
**Source:** projects/oraya-labs/PROJECT.md + memory/pending-actions.md + memory/learnings.md

---

## !! OVERDUE !! DEADLINE WAS APRIL 2, 2026

> # 20 DAYS OVERDUE vs April 2 primary deadline
> # 18 DAYS OVERDUE vs April 4 extended deadline
> # 5 DAYS OVERDUE vs the April 17 Path A / Path B decision gate
> # 3 DAYS past the April 19 "fix or turn off" hard line
>
> **ESCALATION TIER: BLACK, WEEK 3, DAY 20.** The April 19 meta rule ("do not let this fire a third time in identical state, that is the hard line") was explicitly set, and it just fired a fourth time. The tracker is now actively anti-useful: it proves the team ignores red alarms.

---

## STATUS VS PREVIOUS RUN (April 19 briefing)

Three calendar days, zero Mercedes movement, but the revenue path itself has visibly pivoted:

1. **Apr 21, Tuesday 08:00 PT:** Frankie sent the insurance-agent cold-open email (see `pending-actions.md` and `learnings.md` BUSINESS FACTS). That is now the live revenue workstream, not Mercedes.
2. **Apr 22 to 25:** Inventory sprint locked in (v3 synonym map, cold-transfer guardrail, "3 close alternatives" flow, single-graph production lock). Hardens the stack for Teresa and the Tuesday reply window (Tue+1 to Tue+4).
3. **Teresa anchor-close pending today (Apr 22):** Branch (a), (b), (c), or fallback picks the next 7-day cadence. Full CTO + CEO attention is on this, not Mercedes.

Mercedes South Bay has been dropped by default. No one has written that down. The tracker is still firing. That is the problem to fix today.

---

## CHECKLIST STATUS (as of April 22, 2026)

- [~] **Pilot Offer Letter finalized (PDF on letterhead)** | Owner: BOTH
  `Oraya-AI-Pilot-Offer-Mercedes-South-Bay-Latest.pdf` exists in `deliverables/` (regenerated Apr 22 per mtime, 34KB) and in `mercedes-april2-package/` (Mar 29, 728KB original). Entity moved to C Corp (EIN 93-3462113, Alameda County). No confirmation the latest PDF carries correct C Corp entity line. PENDING signoff.

- [~] **Document B Compliance Report reviewed** | Owner: CHITRAKSH
  v2 exists (`Document-B-Compliance-Verification-Report-v2.docx`, Mar 29). No sign-off line added in 25+ days. BLOCKING in theory. Moot in practice if the send is not happening.

- [ ] **Minutes allocation agreed** | Owner: BOTH
  PENDING. 25+ days open. Primary gate per Frankie SOP ("minutes + package = final offer"). No number on paper.

- [ ] **Pricing package finalized** | Owner: BOTH
  PENDING. Resolves with minutes. No number on paper.

- [x] **AutoNation / Mercedes email draft written** | Owner: BOTH
  Drafted Mar 28. Send decision was always the blocker, never the draft.

- [ ] **Visual architecture diagram** | Owner: CHITRAKSH
  PENDING since Mar 28. 25 days no progress. Apr 19 recommendation stands: drop from v1 scope, list as post-pilot deliverable. Decision still not recorded.

- [x] **Target contact confirmed (Khalid)** | Owner: FRANKIE
  DONE (Mar 28). 10% / $700K personal arrangement stays on a SEPARATE channel (crypto/shell-company memo, still on Chitraksh plate since Apr 5, now 17 days stale).

- [ ] **GM contact confirmed** | Owner: FRANKIE
  PENDING. No GM name or email logged. 10-minute ask, unactioned for 25 days.

- [ ] **Frankie LA/Torrance trip planned** | Owner: FRANKIE
  PENDING. No trip date logged. Frankie's week is Teresa + Tuesday insurance list, not Torrance.

**Tally: 2 of 9 fully done. 7 blockers. Identical to April 19. Identical to April 18. Identical to April 17. Four consecutive runs, zero delta.**

---

## STRATEGIC CALL (CTO-LEVEL)

Four data points compound:

1. Apr 17 Path A / Path B decision gate: passed in silence.
2. Apr 18 send-status ultimatum to Frankie: no recorded answer.
3. Apr 19 "fix or turn off" hard line: not honored.
4. Apr 21 Tuesday insurance send + Apr 22-25 inventory sprint: team has de facto committed to the insurance revenue path, not Mercedes.

The Mercedes South Bay pilot is not the active opportunity anymore. Teresa + the insurance list is. That is a reasonable pivot. What is not reasonable is letting a red alarm fire for a workstream that the company has moved on from. Every automated system in the HQ loses a bit of credibility each time this briefing fires with identical state.

**Recommendation: SUNSET this tracker today.**

Formal steps (Chitraksh, ~10 minutes total):

1. Add a decision-log entry at the top of `projects/oraya-labs/PROJECT.md` under a new "Decision Log" section:
   > "Apr 22, 2026: Mercedes South Bay pilot paused. Replaced on revenue path by insurance agent pipeline (Tuesday cold-open cadence, Teresa anchor-close). Reopen trigger: new dealership champion surfaces OR Teresa path fails AND Q3 revenue gap requires dealership pivot."
2. Update `memory/pending-actions.md`: strike the Mercedes line from the pending list, replace with a one-line "Mercedes paused, see PROJECT.md decision log."
3. Disable the scheduled task `mercedes-deadline-countdown` via the scheduled-tasks MCP. Keep the SKILL.md on disk in case of reopen.
4. Move the four staged artifacts (Pilot Offer Letter, Doc B v2, SOW, SLA) from `deliverables/mercedes-april2-package/` to a new `deliverables/mercedes-april2-package/_paused/` subfolder so they are not lost if the path reopens.
5. Dashboard: add a one-line note to Overview tab, "Mercedes pilot paused Apr 22, see PROJECT.md decision log." Run the mandatory dashboard push command after that edit.

If the decision is instead to resuscitate (send today, minutes + pricing locked in a 2-hour session): that is also acceptable. Silence is not.

---

## CHITRAKSH TODAY

1. **Pick the binary in the next 90 minutes: SUNSET or RESUSCITATE.** Not a third option. The third option (keep running the tracker in identical state) has already cost 5 days.
2. **If SUNSET (recommended):** Execute the 5-step checklist above. Under 30 minutes of work. Do it before the inventory-sprint Day 1 task (v3 synonym map + sync verdict) starts, so your head is clear.
3. **If RESUSCITATE:** Block 2 hours with Frankie, lock minutes + pricing on paper, C Corp sweep on the Offer Letter, Doc B v2 initials + date, drop the architecture diagram, send by EOD. Short opener, no over-explanation. Em dash sweep before send.
4. **Either way:** Khalid personal-arrangement memo (crypto/shell-company one-pager) is now 17 days stale. Orthogonal to the Mercedes send decision. Ship today. One page, one hour.
5. **Sprint focus today:** Day 1 of the Apr 22 to 25 inventory sprint is v3 synonym map deploy + sync verdict. That is the real revenue work. Do not let the Mercedes tracker siphon more than 30 minutes of cycles.

---

## FRANKIE TODAY

1. **Answer one question in writing: SUNSET or RESUSCITATE Mercedes?** One word is enough. Chitraksh is blocked on this answer for the fourth consecutive day.
2. **Teresa anchor-close today.** Branch (a), (b), (c), or fallback. Whichever you pick sets the next 7-day cadence. This is the live revenue decision, not Mercedes.
3. **GM contact from Khalid:** only relevant if you pick RESUSCITATE. If SUNSET, drop it.
4. **Torrance trip:** only relevant if you pick RESUSCITATE. If SUNSET, drop it.
5. **E&O insurance:** Standard $46/mo or Plus $82.42/mo, effective 04/07/26 per active-projects.md. Pick one today, effective date already passed by 15 days. Hard gate on any pilot launch, dealership or insurance.
6. **Chargeback payment:** Mar 30 payment still unconfirmed in the log, 23 days overdue. One-line status today.
7. **Registered agent renewal:** 33 days overdue. Entity-level risk. Respond today.

---

## CRITICAL REMINDERS (UNCHANGED)

- Khalid's personal arrangement (10% / $700K) goes via a SEPARATE channel. Do NOT bundle with any dealership email.
- Warm transfer is NOT fully working. Cold transfer is confirmed working (SIP invite, passes caller ID internationally, cold after 3 attempts).
- Test copy between founders FIRST. External send only after both approve.
- Outbound calling + inventory system are LIVE. The platform is ready. Only decision-making is missing.
- Auto-memory (Apr 18): Strategy Law killed, in-house AI legal active via `skills/legal-review-skill/`, HiQ pivot for sales-node reversed Apr 19 (Claude Haiku on sales nodes). Per-node Model SOP ratified Apr 19/20.
- C Corp retained. EIN 93-3462113. Not LLC. Any Offer Letter or SOW still referencing LLC is stale and blocks the send.

---

## META: THE AUDIT LOOP HAS FAILED FOUR TIMES. CLOSE IT TODAY.

Apr 18 rule: "If it fires tomorrow in identical state, the tracker has stopped serving its purpose."
Apr 19 rule (Run 3): "Do not let this fire a third time in identical state. That is the hard line."
Apr 22 (Run 4): the rule triggered again. It is now three days past the hard line.

A red alarm that nobody answers trains the team to ignore alarms. That cost compounds. Every scheduled task in this HQ pays a small trust tax each time this one fires into a void. At 20 days overdue on a deadline the team has effectively abandoned for a better opportunity (insurance pipeline, Teresa), the correct move is not another briefing. It is the sunset.

**Action required by end of day Apr 22, pick exactly one:**

1. **SUNSET** (recommended): 5-step checklist above. Under 30 minutes. Closes the loop cleanly and preserves reopen optionality.
2. **RESUSCITATE:** 2-hour joint session, send by EOD, archive this tracker, move to Mercedes-reply-watch briefing instead.

Run 5 with identical state is not acceptable. This briefing is the last one that should fire without a written decision in `PROJECT.md`.

---

*Auto-generated by Mercedes Deadline Tracker, run 4 of 4 (target: final run). Per the Apr 19 meta rule, hard line was three days ago. SUNSET path above is the recommended close.*
