# George (P2 Inbound) Follow-Up Packet · Apr 24 2026

**Status:** ~$1K expected deal · first unprompted P2 signal
**Source:** old insurance client · emailed Frankie Apr 15 · Frankie called back Apr 24 from 510-520-4265 · voicemail left
**Owner:** Frankie (close) · CTO-Claude (packet)

---

## Today's plays (Frankie)

1. **Midday callback from a different line** (try cell vs office line, or vice versa). 1 ring + voicemail. Subject: "Following up on your Apr 15 email."
2. **Email follow-up** referencing the voicemail (template below). Include calendar link for a 15-min slot in the next 48 hours.
3. **GHL contact create** with tag `p2-inbound-george-apr15` so we can track downstream attribution against the rest of the P2 funnel.

---

## Call notes template (fill in real-time)

```
George · old client · Apr 15 inbound · Apr 24 first callback

REASON FOR REACHING OUT:
- (additional coverage / renewal / referral / ?)

CURRENT POLICY STATUS:
- Carrier:
- Policy type:
- Renewal date:
- Premium $/mo:

WHAT HE WANTS:
- (more coverage / different carrier / different product / quote shop / ?)

LIFE EVENTS SINCE LAST CONTACT:
- (marriage, kids, home purchase, business launch, health change)

DECISION TIMELINE:
- (this week / this month / quarter / no urgency)

DECISION CRITERIA:
- (price / coverage / both / agent relationship / ?)

NEXT STEP:
- (quote sheet by Apr 25 / 15-min review call / signed app / ?)

EXPECTED COMMISSION:
- ~$ ___ (target $1K, capture actual)
```

---

## Email follow-up template

> Subject: Following up on your Apr 15 message
>
> Hi George,
>
> Just left you a voicemail. Saw your note from the 15th and wanted to make sure I get back to you properly.
>
> Whatever you are looking at (additional coverage, renewal, or something new), I can pull a quote and walk you through options inside 48 hours. Easiest is a 15-minute call. Here is my calendar:
>
> [calendar link]
>
> If you would rather just email me what you are thinking, that works too.
>
> Frankie
> Oraya Labs · 510-520-4265

---

## Quote sheet (one-pager Frankie sends after the discovery call)

**Page header:** George · prepared by Frankie Alicea · prepared [date]

**Section 1 · Current policy snapshot** (2-3 lines, what George has today)

**Section 2 · Recommended option** (carrier, coverage, premium, rationale in 1 paragraph)

**Section 3 · Alternative options** (1-2 lower-premium or higher-coverage variants for comparison)

**Section 4 · Next step** (one-line ask: e-sign app via DocuSign, payment via Stripe link if applicable, effective-date target)

Keep it 1 page, 14-point font, no jargon. He is an old client, not a stranger; tone is "here is what I would do for myself."

---

## GHL contact tagging

```
contact: George [last name]
tags:
  - p2-inbound
  - p2-inbound-george-apr15
  - old-client-reactivation
  - apr-2026-cohort
custom fields:
  - source: inbound_email_apr15
  - first_callback_date: 2026-04-24
  - first_callback_outcome: voicemail
  - estimated_commission_usd: 1000
  - status: discovery_pending
```

---

## Why this matters disproportionately

This is the **first unprompted P2 inbound** since the Apr 21 Tuesday email send. Cold-email math says the email channel produces ~1 lead per 306 emails; an unprompted reactivation from an old client is worth at least 10x in expected value because the trust loop is already closed. **Treat George as the highest-priority P2 conversation today after the MBSB triple-send replies.**

If George closes, we capture two assets:
1. The first paid Stripe transaction on the new live account (validates the entire billing stack)
2. A reactivation case study we can use in Apollo + paid-ads creative ("our founder closed a 6-month-dormant client in one phone call after the AI agent missed it for him")
