# Oraya Labs Daily Founder Briefing
**Date:** Friday, April 17, 2026
**Generated:** Automated (Sentient Protocol, daily scheduled task)
**Sources:** CLAUDE.md, memory/active-projects.md, memory/pending-actions.md, memory/learnings.md, projects/oraya-labs/PROJECT.md

---

## SHARED SITUATIONAL AWARENESS

### Mercedes Email Deadline
- Original deadline: April 2, 2026 (15 days past).
- Extended deadline: April 4, 2026 (13 days past).
- **Today is April 17, 2026. The Mercedes email is 13 days past the extended deadline with no send confirmation logged in memory.** [STALE]
- Action required: Frankie must confirm whether the email was sent. If not sent, either send today or formally kill Mercedes South Bay as the pilot target and name an alternate. Thirteen days of silence on cold outbound is effectively non-recoverable without a reset.

### EIN Status
- EIN is confirmed in memory (active-projects.md, April 5 update): **93-3462113, Alameda County**.
- The task brief references SS-4 faxed Mar 27 with 4 to 5 business day expected turnaround. That window closed around April 3. The confirmed EIN supersedes the open question.
- Status: Closed. No further EIN action. Next dependency is adding Chitraksh to the C Corp, then opening the US bank account, then Stripe.

### New Items Since Last Briefing (April 6)
- No new meeting transcripts have been ingested since April 5, 2026 (Meeting 16). That is 12 days of untracked meeting activity. If syncs are happening, they are not reaching memory. If syncs are not happening, velocity has dropped. Flag for both founders.
- No new entries logged to pending-actions.md since the April 5 weekly audit. System is drifting.

### Risk Alerts (From PROJECT.md)
1. **Investor SAFE note ($10K, $5K Jared and $5K Abdo Melek):** Drafted but per Frankie 99% sure unsigned, 100% sure not notarized. Live legal exposure that grows with age. Locate the document, confirm status, execute properly or refund. Highest legal risk on the board.
2. **No signed client contracts, no Stripe, no US bank account.** Cannot accept revenue on either P1 or P2.
3. **Oraya E&O insurance quote pending.** Required before pilot launch. Frankie calling.
4. **Chitraksh not yet added to C Corp.** LegalZoom dropped. Frankie sourcing attorney as of March 30. [STALE, 18 days]

---

## FOR CHITRAKSH (CTO)

### Top 3 Technical Priorities Today (Ranked by Urgency)

1. **Run the RPA insurance simulation test.** Committed April 5 as "fast, schedule immediately." Twelve days have passed with no completion logged. This unblocks Quote AI validation (Frankie's 2+ year concept) and is the proof point for the holding company subsidiary thesis. [STALE] Do today, log result in PROJECT.md.
2. **Confirm the 1,700-vehicle inventory system test.** Scheduled for April 5 with no confirmation recorded. Five N8N workflows with 4-hour refresh are built but not validated end-to-end. Until this is proven, the Mercedes pilot cannot claim production readiness. [STALE] Run the test, log the outcome.
3. **Add the phone number formatting code node to the outbound form.** Handles dash, no-dash, and plus prefix variants. Small ticket, prevents silent call routing failures on leads that arrive in mixed formats. Close today.

### Technical Backlog (Queued, Not Blocking)
- **Connect Stripe API key to Frankie's lead gen funnel backend.** Blocked on Frankie providing the key.
- **N8N nurture and reschedule workflow** for "call me at X time" and failed call loops. Gap identified Meeting 14.
- **N8N outbound retry workflow** for failed outbound calls from the 75% initial connect baseline. SLA differentiator.
- **N8N chargeback recovery workflow** (AI SMS, email, voice for lapsed payments).
- **CRM backend for Oraya AI.** Frankie built the UI (pipeline view, lead score, analytics, contact cards). Backend wiring and data model are yours. Potential internal tool plus client-facing product.

### Blockers Needing Frankie's Input
- Mercedes email send status (see Shared section). Cannot plan P1 next steps without it.
- Stripe API key for the lead gen funnel.
- GHL (GoHighLevel) CRM admin access, promised, not confirmed delivered.
- Oraya E&O quote amount and binding ETA (needed for insurance tab on the dashboard).

### Dashboard and Memory Updates Needed Today
- **No dashboard HTML edits required today** unless (a) Mercedes email status changes, (b) RPA test completes, or (c) inventory test completes. If any of those happen, edit the HTML and use the REINFORCED RULES push protocol exactly: `cd ~/Downloads/Claude\ hq && rm -f .git/HEAD.lock && cp projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main`. The push command must appear in the same response as the edit, always, without being asked.
- **Update memory/pending-actions.md with today's audit marker.** Weekly audit was April 5. A second audit is overdue. Add April 17 as the new audit timestamp.
- **Log this briefing as a deliverable** in projects/oraya-labs/deliverables/daily-briefing.md (being saved now).

### Chitraksh Items [STALE, 7+ Days]
- Copy `~/Claude code session 0/` folder into Downloads for N8N skill merge.
- Report on first insurance API data batch results (no batch has been tested yet).
- Clarify status and scope of Investigation Report project (entire project in unknown state).
- N8N paid subscription purchase (trial expired, new account migration pending).
- Confirm dissertation deadline date (hard academic deadline, cannot slip silently).
- Research India-side compliance for joining US C Corp (blocks bank account access).

---

## FOR FRANKIE (CEO)

### Top 3 Business Priorities Today (Ranked by Urgency)

1. **Confirm Mercedes email status.** Sent or not sent. If not sent, send today or formally kill Mercedes South Bay as the pilot target and name an alternate dealership so Chitraksh can retarget the voice agent configuration and Twilio warm transfer number. This is the single most important decision on the board right now. [STALE]
2. **Bind the Oraya E&O insurance quote.** Separate from your personal $2M policy. Pilot cannot launch without this. If you have the quote in hand, forward it to Chitraksh for the dashboard insurance tab.
3. **Resolve the investor SAFE note.** $10K from Jared and Abdo Melek sitting unsigned and unnotarized per your own estimate. Locate the document. If unsigned, either execute properly (sign, notarize, file) or refund the funds. Legal exposure grows with every day it sits.

### Items Waiting on Frankie's Action
- Mercedes email send confirmation (see top priority).
- Stripe API key for the lead gen funnel you built. Pass to Chitraksh to wire backend.
- GHL (GoHighLevel) CRM admin access for Chitraksh. Promised, not delivered.
- Attorney sourcing to add Chitraksh to the C Corp (LegalZoom dropped). Still sourcing as of March 30. [STALE, 18 days]
- 450-lead HTML email campaign: drafted, not sent.
- Dedicated insurance Twilio number: not purchased.
- Sales motion script (ChatGPT-generated) for Oraya automation packages to share.
- Registered agent email response for Oraya Corp renewal filing. [STALE, 28+ days past end-of-week March 20]
- MX and SPF record fix in Vercel DNS for founder@orayalabs.ai. [STALE, 32+ days]

### Financial Items Needing Attention
- **Chargeback payment of approximately $1,000 to $1,100** was due Monday March 30. [STALE, 18 days past due] Confirm whether paid. If paid, update balance from ~$3,100 to current figure. If unpaid, pay today or formally communicate delay to the carrier.
- Remaining chargeback balance: approximately $1,600.
- Marketing retainer plus ad budget: $2,500 pending.
- CRM and Meta Ads setup costs: not itemized.

### Decisions Needed From Frankie Before Chitraksh Can Proceed
1. Go or no-go on Mercedes South Bay as pilot target. If no-go, name the alternate dealership.
2. Stripe API key delivery. Without it, the funnel is UI only and P2 monetization is frozen.
3. GHL admin credentials. Without them, CRM backend work cannot start.
4. Lead resale buyer pipeline identification. Revenue model lists $25 to $50 per lead and $50 to $100 per confirmed appointment, but no buyers are identified in PROJECT.md. P2 revenue cannot be realized without a named buyer list.

---

## META OBSERVATIONS (Process Signals)

- **Memory cadence has slipped.** No ingested meeting transcripts since April 5. No pending-actions audit since April 5. Twelve days of untracked activity. Recommend both founders either resume meeting transcript uploads to the system or explicitly pause the cadence so the AI is not flying blind.
- **Overdue items are clustered.** Mercedes email (13 days), chargeback payment (18 days), attorney sourcing (18 days), warm transfer test (19 days), registered agent renewal (28+ days), MX records (32+ days). This is a systemic follow-through gap, not individual slips. Recommend a 30-minute founder sync today to triage every [STALE] item: close, reassign, or formally kill.
- **P2 is three small gaps from revenue.** 450 leads loaded, Maya live 24/7, funnel UI built. The missing pieces are the Stripe key, a dedicated insurance Twilio number, and a named buyer pipeline. None are technical lifts. All three are Frankie decisions.
- **No new dashboard psych score evidence in 12 days.** Per the April 5 reinforced rule, psych meters must be justified with actual task evidence on every update. With no new meeting evidence, the dashboard scores are frozen by default. This is acceptable only if explicitly acknowledged.

---

## SUMMARY LINE
Mercedes email is 13 days past its extended deadline with no send confirmation. EIN is done. Chitraksh's top three are the RPA test, the inventory test, and the phone formatting code node. Frankie's top three are Mercedes email status, E&O binding, and the SAFE note. Six items are [STALE]. Twelve days of meetings are not in memory. Recommend a triage sync today.
