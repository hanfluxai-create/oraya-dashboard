# Teresa · 7-Day Cadence Playbooks · Apr 23

**Owner:** Frankie · triggered the moment branch-lock confirms
**Window:** Apr 23 branch-pick → Apr 30 milestone review
**Fallback:** if no branch picked by noon Apr 23, Teresa moves to lukewarm-deferred (no outreach before Apr 28). See `memory/pending-actions.md`.

---

## Branch (a) · Two warm leads in 7 days

**What Teresa committed:** two insurance leads from her book, sent by Apr 30, pilot runs the qualifier on them.

### Day 0 (pick day)
- Frankie replies: "Bet. Send their name + phone + zip as they come. I'll run the qualifier and loop you on the calendar invite. Case study after."
- Open GHL pipeline stage `T-APR26-R1 · Teresa Pilot Leads`.
- Chitraksh provisions a qualifier outbound-number routed through `Jessica-v4-transfer-hardened` once cold-transfer pass bar hits (see `cold-transfer-guardrail-plan-v1.md`).

### Days 1-4
- Each lead Teresa sends: Frankie fires `trigger-outbound-qualifier` within 30 min of receipt. Chitraksh monitors Supabase `Appointment Log` for the write.
- Success = name + email + phone + appointment_timestamp + query_type captured, calendar invite + text + email land in lead's inbox.
- Failure modes logged in `logs/teresa-qualifier-failures.md` per lead.

### Day 5 (mid-cycle check)
- Frankie mid-week text to Teresa: "Got [N] leads through so far, [M] appointments booked. Keep 'em coming."
- If N = 0 by Day 5, we do not nudge Teresa again until Day 7. Stale ask = partnership risk.

### Day 7 (milestone)
- Frankie + Chitraksh 15-min phone review. Did 2 leads convert to 2 bookings? If yes, Teresa gets case-study asset first, pilot SOW second (branch a → branch c upgrade path).
- If 0 or 1 lead, no pressure. Ask Teresa what broke on her end: list freshness, qualification objection, comp rate, pricing. Log answer to `contacts.md`.

**Success criterion:** 2 leads in, 1+ appointment booked end-to-end, case-study quote logged.

---

## Branch (b) · Agency-owner intro this week

**What Teresa committed:** one warm intro to an agency owner in her network, by Apr 30.

### Day 0 (pick day)
- Frankie replies: "Huge. Which owner? Give me 2 sentences on why they'd say yes and I'll draft the intro ask for you to forward."
- Chitraksh adds `Teresa-referred · Apr 26` tag to `contacts.md` awaiting name.

### Days 1-2
- Teresa names the owner. Frankie drafts a 3-sentence forward-able intro email (below). Sends to Teresa to pass through.
- Intro draft:
  ```
  [Agency owner first name], this is [Teresa]. Meet Frankie at Oraya Labs — he's built an AI appointment-setter that ran on my pipeline last week and booked live appointments on the phone. He's offering a 30-day free pilot, no commitment. Worth 20 minutes of your time.
  ```
- Teresa forwards. Frankie does not cold-email; this must stay Teresa-warm.

### Days 3-5
- If intro lands a meeting: run appt-setter demo on owner's phone live, same format as Teresa's Apr 20 demo.
- If intro lands "not now": Frankie replies 2-sentence "no worries, here when you're ready" + tag `deferred-Q2-2026`. No follow-up for 45 days.

### Day 7 (milestone)
- 10% year-one ARR referral to Teresa logged against `contacts.md` if the agency owner signs any pilot or retainer in the following 90 days. Attribution source: Teresa. Attach written acknowledgment from Frankie so commission is unambiguous.

**Success criterion:** 1 intro made, 1 owner meeting scheduled or clearly "not now", Teresa holds 10% referral rights.

---

## Branch (c) · $1K-a-week retainer · May 1 start

**What Teresa committed:** 4-week retainer, $1K/week, prepaid via Stripe, inventory + qualifier stack on her book, May 1 start.

### Day 0 (pick day)
- Frankie replies: "Done. SOW and Stripe link tomorrow AM. May 1 start, 4 weeks, $4K upfront."
- Chitraksh spins pilot SOW from `deliverables/Oraya-AI-Pilot-Statement-of-Work.pdf` template, swaps entity to Teresa's agency name (pull from contacts.md or ask in the Day 0 reply).

### Day 1
- Frankie sends SOW + Stripe payment link ($4K one-time, 4-week service rider). Payment link lives in Stripe dashboard under Products → Teresa Pilot Retainer.
- Teresa signs SOW (e-signature via DocuSign once v0.3 legal pack lands, Apr 28; if before that, plain-text DocHub is acceptable for speed).

### Day 2-4
- Once SOW + prepay confirm, Chitraksh runs 30-min onboarding call: her lead-list format, CRM (if any), phone-number provisioning, hours-of-operation for the appt-setter.
- Go-live May 1. Chitraksh monitors Supabase writes for the first 48 hours.

### Day 5-7 (onboarding ramp)
- Daily 5-min check-ins (async text) on call-volume + appointment rate.
- End-of-Week-1 milestone: 20+ qualifier calls completed, 3+ booked appointments. If below, diagnose in real time.

**Success criterion:** $4K in Stripe, SOW signed, May 1 live, Week-1 metrics meet floor.

---

## Fallback · No branch picked

- Tag in contacts.md: `Teresa · lukewarm-deferred · do-not-outreach before Apr 28`.
- Frankie does not reach out. CTO-Claude does not schedule a nudge. Silence is the policy.
- Apr 28 or later, first yes-pilot reply from the Tuesday email becomes the new anchor. Teresa stays dormant until she re-initiates.

---

## Anti-patterns (never do these)

- Offering a discount or free extension to rescue a stalled branch. Decay the relationship cleanly; price integrity matters more than one close.
- Pitching Chitraksh as "co-founder who will also do X" during the 7-day window. He is the engineer on this pilot, not a seller. Scope-protection.
- Mixing branches. If she picked (a), do not mid-week try to upsell (c). The branch promoted from (a) → (c) only after the 2-lead milestone hits, not before.
- Running inventory demos on Teresa's book if the inventory stack has not passed the 21-case retest (see `apr23-retest-pack.md`). Reputation gating is higher-priority than speed here.
