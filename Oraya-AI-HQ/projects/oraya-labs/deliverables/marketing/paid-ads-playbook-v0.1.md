# Paid Ads Playbook v0.1 — Primary P2 Acquisition Channel

**Owner:** CTO-Claude (spec) · Frankie (campaign launch)
**Status:** v0.1 · drafted Apr 24 2026 · launches with Frankie's next paycheck
**Trigger:** Mtg 23 resolve (Apr 24 PM) — cold-email math does not pencil (0.03 percent opt-in, 1 lead per 306 emails). Paid ads becomes channel one for P2.

---

## Goal

Generate qualified P2 (insurance) and P1 (dealership) leads at a CAC that pencils against $497/mo intro and $1997/mo enterprise tiers. Funnel: ad → landing → Retell qualifier → calendar invite → paid pilot.

---

## Audience seeds (from Apollo + manual)

**P2 / insurance:**
- Independent insurance agencies, 1-10 producers, US (TX/CA/FL/AZ/NV first)
- Job titles: Owner, Producer, Agency Principal
- Lookalike from Tuesday email open list (Apr 21 send)
- Lookalike from George (first inbound P2)

**P1 / dealership:**
- Sales managers, GMs, Used-Car directors
- Brands: Mercedes, BMW, Lexus, Audi (luxury, high CPA tolerance)
- Geo: California, Texas, Florida (Frankie's licensed states for cross-sell loop)
- Lookalike from MBSB Mark Akbar / Mazzio profile

---

## Budget tiers (start small, scale on CAC)

| Tier | Weekly spend | Purpose | Decision gate |
|---|---|---|---|
| Tier 0 | $150/wk | Audience proof: which segment converts | 7-day test → if ≥1 booked call, advance |
| Tier 1 | $500/wk | Funnel optimization: landing + Retell handoff | 14-day test → if CAC ≤ $300, advance |
| Tier 2 | $1500/wk | Scale to revenue | Ongoing: maintain CAC ≤ $400, LTV/CAC ≥ 3 |

**First-paycheck launch:** Tier 0 only. No Tier 1 until we have a verified click → call → calendar invite end-to-end.

---

## Creative spec (production list)

1 hero video (60-90s, Frankie on-camera + Retell call playback over the top, captioned)
3 carousel ads (5 slides each: problem → demo screenshot → result → testimonial → CTA)
5 single-image ads (variant copy testing: speed-of-followup, after-hours capture, never-miss-a-lead, 30-day-free, AI-does-the-qualifying)

All creative routes to **one landing page** at `orayalabs.ai/lead-qualifier-trial` with:
- Hero: 30-second voice-demo button (Retell embed)
- Form: name, business name, phone, business email, monthly lead volume
- Submit → Retell qualifier auto-dials within 60 seconds
- Successful qualifier → calendar invite for 15-min onboarding call

---

## Funnel + tracking

```
Ad (FB/IG/Google)
  ↓ UTM tagged
Landing (Vercel hosted, GA4 + FB Pixel + GHL form)
  ↓ Form submit fires GHL contact create + n8n webhook
n8n outbound qualifier (Retell agent: voice ID cd2fbc5e381df2b880e4533e52)
  ↓ Successful qualification
Google Calendar invite (n8n cred 2BaP72YO9q5pyBGt)
  ↓ Logged
Supabase Appointment Log (cred t68H7KhMcrrNgUPs)
```

Both P1 and P2 acquisition funnel into **GoHighLevel** as the canonical CRM (per Mtg 23 resolve).

---

## Decision gates (kill, hold, scale)

- **Kill** the channel if 14-day Tier 1 test produces 0 booked calls.
- **Hold** at current spend if CAC drifts above $400 for 7 consecutive days.
- **Scale** spend 50 percent week-over-week if LTV/CAC > 3 and CAC trend is flat or declining.

---

## Open questions for Frankie

1. Which platform first: Meta Ads (FB/IG) or Google Search? Recommendation: Meta first (cheaper testing, better creative iteration), Google Search Tier 2 (higher intent, higher CAC).
2. Landing page hosting: keep Vercel current site or stand up isolated `lead.orayalabs.ai`? Recommendation: subdomain so we can iterate freely without touching marketing site.
3. Budget cap absolute: what is the max weekly burn before we pause? Recommendation: $2K/wk hard cap until we are revenue-positive on the channel.

---

## Next iteration (v0.2 trigger)

- After first booked call from a paid ad: capture full attribution chain, update creative based on which copy variant won, re-target the no-shows with a different angle.
- After first paid pilot signup: convert that case into the hero video for v0.2 creative refresh.
