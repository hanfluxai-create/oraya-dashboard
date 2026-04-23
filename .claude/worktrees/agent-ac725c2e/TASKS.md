# Tasks
**Owner:** Chitraksh Mayank (CTO, Oraya) | **Last synced:** 2026-04-18 from `Oraya-AI-HQ/memory/pending-actions.md`

---

## Active

### P0 — Ship blockers (Oraya pilot + revenue)
- [ ] **Confirm Mercedes email send status** — to Khalid / dealership, extended deadline was Apr 4 (now 14 days overdue). If not sent, send today. For Frankie to execute on company email; CTO to draft.
- [ ] **Oraya E&O insurance — bind policy** — Standard $46/mo vs Plus $82.42/mo quote in hand. Must bind before pilot launch. Owner: Frankie.
- [ ] **Stripe API key → lead-gen funnel** — Frankie built UI, needs key plug-in. Blocks P2 insurance revenue. CTO owns integration.
- [ ] **Push updated dashboard to GitHub** — committed locally, not deployed to Vercel. See CLAUDE.md §Dashboard root mirror for the one-shot push command.

### P1 — Voice AI infrastructure (P1 product)
- [ ] **Test inventory system** — 1,700 vehicles, 5 N8N workflows. Audit ran Apr 5, no completion logged. CTO verify.
- [ ] **Phone-number formatting code node** — outbound form; handles dash / no-dash / plus. N8N.
- [ ] **N8N nurture + reschedule workflow** — auto-reschedule when prospect says "call me at X"; failed calls loop back to Retell agent. Identified in Meeting 14.
- [ ] **N8N outbound retry workflow** — route failed outbound (from 75% initial connect) back through Retell. SLA differentiator.
- [ ] **Test human warm transfer** — cold works; warm connects but no advisor briefing. Was scheduled Mar 29 — status unknown.
- [ ] **Fix orayalabs.ai Gmail MX records** — add MX + SPF in Vercel DNS. `founder@orayalabs.ai` needed. STALE 14+ days — decide keep or kill.

### P1 — Contracts + legal
- [ ] **Draft Khalid personal offer letter** — crypto / smart-contract compensation via shell co. (Chitraksh researching). NOT to go via official Mercedes email.
- [ ] **Draft SLA document** — 75% outbound connection baseline, retry workflow for near-100% reach, 99% uptime, speed-to-lead metrics, case-study numbers with legal disclaimers. CTO autonomous.
- [ ] **Review dealership offer letter** — change all LLC → C Corp. Verify terms match Meeting 14.
- [ ] **Add Chitraksh to Oraya C Corp** — LegalZoom dropped. Frankie sourcing new attorney. Status blocker.

### P1 — Insurance (P2 product)
- [ ] **Run RPA insurance simulation test** — CTO confirmed fast; schedule immediately.
- [ ] **Send HTML email campaign to 450 loaded leads** — Maya agent live, emails not going out.
- [ ] **Purchase dedicated insurance Twilio number** — separates P2 telephony from P1.
- [ ] **Resolve ~$1,600 chargeback balance** — Frankie owns payment.

### P2 — Growth + tooling
- [ ] **Use Google AI Pro (Veo) daily** — 2-video/day limit. Frankie drafting prompt. Don't waste the allocation.
- [ ] **Build demo video (45s–2min)** — for selling automation packages to solopreneurs/SMBs.
- [ ] **Define pricing tiers** — solopreneur / SMB / enterprise. Required before Meta/Google ad spend.
- [ ] **Build chargeback-recovery workflow** — AI-triggered SMS/email/voice for lapsed payments.
- [ ] **Build Google Reviews / Trustpilot automation** — sentiment check, auto-send review link for 4★+.
- [ ] **GoHighLevel CRM setup** — Frankie granting admin access. Replaces HubSpot.
- [ ] **Find and share sales-motion script** — Frankie's ChatGPT-generated call script.
- [ ] **Respond to registered-agent email** — Oraya Corp renewal filing. OVERDUE since Mar 20. Decide keep or let lapse.

---

## Waiting On

- [ ] **Chitraksh → copy `~/Claude code session 0/` into Downloads** (for N8N skill merge)
- [ ] **Chitraksh → report on first insurance API data batch results**
- [ ] **Chitraksh → N8N paid subscription purchase** (trial expired, migrated)
- [ ] **Chitraksh → research India-side compliance** for joining US C Corp
- [ ] **Frankie → E&O binding decision** (Standard $46 vs Plus $82.42)
- [ ] **Frankie → confirm chargeback payment** (was $1,000–1,100 due Mar 30)
- [ ] **Attorney sourcing** (to add Chitraksh to C Corp, LegalZoom dropped)
- [ ] **Teresa inbound** — per 2026-04-18 memory note; context TBD

---

## Someday

- Build transcript-to-dashboard custom skill
- Scheduled weekly audit task
- Automated meeting-summary skill
- Sub-agent architecture design
- Retell flow testing/debugging skill
- Project-status report generator (reads all PROJECT.md files)
- VS Code Claude Code symlink for all active projects
- Migrate N8N workflows to Claude Code (N8N predicted obsolete by end of 2027)
- Google Stitch: iOS/Android client dashboard
- @memeowcats (50K IG) social meeting
- Gemini 3.1 Live speech-to-speech on Claude Code (11Labs replacement Jun–Jul 2026)
- WhatsApp Business auto-sync to Claude HQ
- Meta/Google ads for Oraya automation packages
- Quote AI standalone product (Frankie's 2-year concept)
- DAO Insurance on Solana/Ethereum
- Oraya Holding Co. structure (Voice AI, Insurance, Quote AI, DAO)
- IPO strategy (2–3% dilution per growth window at peak MoM multiple)
- In-house LLM development (long-term moat)

---

## Done
- [x] ~~Meeting 16 transcript ingested~~ (2026-04-05)
- [x] ~~Outbound + Inbound telephony LIVE~~ (2026-04-03)
- [x] ~~Admin SMS + customer SMS working~~ (2026-04-03)
- [x] ~~Voice speed fix: Retell 1.0 → 6.6~~ (2026-04-03)
- [x] ~~Inventory system: 1,700 vehicles, 5 N8N workflows, 4hr refresh~~ (2026-04-02)
- [x] ~~EIN confirmed: 93-3462113, Alameda County~~ (2026-03-29)
- [x] ~~C Corp retained, LLC conversion rejected~~ (2026-03-28)
- [x] ~~Khalid offer terms agreed: 10% / $700K~~ (2026-03-28)
- [x] ~~Stripe Admin invite accepted~~ (2026-04-18)
- [x] ~~Strategy Law killed; in-house AI legal adopted~~ (2026-04-18)
- [x] ~~HiQ pivot decided~~ (2026-04-18)
