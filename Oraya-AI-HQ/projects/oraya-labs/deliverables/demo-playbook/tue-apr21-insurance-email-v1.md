# Tuesday Apr 21 · Insurance-Agent Cold Email · v1

**From:** Frankie Alicea · frankie@oraya.ai (or Frankie's preferred send address)
**Reply-to:** Frankie
**Audience:** Life / health / P&C agents — HiQ-pulled list + Frankie's 3 warm prospects (first-touch tier)
**Sign-off deadline:** Mon Apr 20, 6 PM PT (so deliverability warm-up runs overnight)
**Scope:** Appointment-setter pilot ONLY. Inventory / Mercedes flow not mentioned.

---

## Subject-line options (pick 1 — Frankie's call)

1. **"A voice-qualified lead, on me"** (A/B winner preference)
2. **"30 days of pre-qualified leads, no card"**
3. **"Your next 10 insurance leads, already on the phone"**

---

## Body · v1 (short-form, ~150 words)

```
Hey {{first_name}},

Frankie with Oraya Labs — we build voice agents that pick up the phone for insurance agents and qualify leads before they hit your calendar.

Short version: for the next 30 days we'll run pre-qualified inbound and outbound calls for you, for free. No card, no contract. If the leads are worth anything, you pay us after day 30. If they're not, you keep the data and we disappear.

How it works:
  • Your inbound line or a parallel number forwards to our voice agent.
  • Agent qualifies on the 4 questions that matter for your book (we tune these with you in 15 min).
  • Qualified leads land in your CRM with the transcript + intent score.
  • You call them back while they're still warm.

Exit window: 24 hours, one email. Your data is purged in 72 hours.

If you want the 15-minute walk-through, hit reply with a time.

— Frankie
Oraya Labs · oraya.ai
```

---

## Notes to Frankie

- **Do not add "AI" in subject or opening** — same rule as the website hero. Enterprise feel, not novelty.
- **"Voice agent" > "AI voice agent"** — one less adjective, more serious.
- **Keep the retainer / pricing out of v1.** Tuesday email sells the trial, not the contract.
- **CTA is reply with a time, not book-a-meeting link** — higher reply rate, and you want the human conversation to start in the inbox.

---

## Deliverability checklist (CTO-Claude runs overnight if sign-off by 6 PM PT)

- SPF + DKIM + DMARC verified on send-from domain.
- SendGrid / Resend warm-up subdomain — ramp volume over send window.
- BCC send to an inbox we monitor to confirm landing (not spam / promotions).
- Unsubscribe footer present (CAN-SPAM).
- List scrubbed against Frankie's 3 pinned-warm prospects so they get the pre-warmed version first.

---

## Post-send tracking (Wed Apr 22 AM standup)

- Opens, replies, bounces by tier (Frankie's 3 warm vs HiQ list)
- Any reply = flag to Frankie within 1 hour of receipt
- 2+ replies by 10 AM PT = proceed to §2 qualification-call script
- 0 replies by EOD = reassess subject line, re-send variant B to cold cohort
