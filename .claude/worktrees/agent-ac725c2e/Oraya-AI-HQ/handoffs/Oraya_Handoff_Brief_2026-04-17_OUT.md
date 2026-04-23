# Oraya Handoff Brief — OUT — 2026-04-17
**From:** Oraya Agent (this session)
**To:** Next Oraya Agent session
**Principal:** Chitraksh Mayank (CTO) · **Co-founder:** Frankie Alicea (CEO)
**Protocol:** Sentient v4.0

---

## 1. TL;DR — What Changed This Session

1. **Monolithic `Claude hq/` HQ was split** into two sibling agent workspaces:
   - `Oraya-AI-HQ/` — this agent. Dedicated to Oraya Corporation only.
   - `Personal-HQ/` — separate agent for dissertation, HanFlux, fraudopedia, campus platform.
   - Root `CLAUDE.md` demoted to a router that points each session at the right HQ.
   - Shared skills (`legal-review-skill`, `skill-maker`) + identity (`chitraksh-profile.md`) copied into both HQs so neither agent has to cross-load.
2. **Sentient Protocol upgraded v3 → v4.** New clauses: §2 proactive self-audit, §9 scheduled tasks for BOTH founders, §14 MCP tool-selection hierarchy, §15 handoff discipline.
3. **Inbound handoff brief ingested** (`handoffs/Oraya_Handoff_Brief_2026-04-17.md`, 2407 lines) — WhatsApp chat through Apr 17, Apr 11 retail inventory test call transcript, canonical facts, sanity checks.
4. **Dashboard updated** (surgical edits, not a rewrite — per `memory/learnings.md`):
   - Hero: Apr 5 → Apr 17 · status line refreshed · meetings 16 → 17 · weeks 12 → 14 · test calls 400+ → 500+
   - New meta line: "Sentient Protocol v4 · HQ split into Oraya-AI-HQ + Personal-HQ · Handoff brief logged in handoffs/"
   - KPI card "Oraya E&O Quote — Frankie Calling ⚠️" flipped to "E&O Quoted · $46 Std / $82.42 Plus · Coverage 04/07/26 ✅"
   - NEW Apr 6–17 Intelligence banner with 12 items (test call pass · E&O quote · Stripe team · Mazzio follow-up · Strategy Law · Frankie feedback · $0.37 Stripe signal · pricing · insurance model · SSH fix · HQ restructure · scheduled-briefing rule).
5. **GitHub push permanent fix** documented in root `CLAUDE.md`, `Oraya-AI-HQ/CLAUDE.md`, and `protocols/sentient-protocol.md` §10 — switch `origin` to SSH and paste one key on github.com/settings/keys. Kills the PAT-in-URL root cause forever.

---

## 2. What Is In Each New HQ

### `Oraya-AI-HQ/`
```
├── CLAUDE.md                   ← Oraya agent boot file (13-step boot, dashboard rules, MCP arsenal, critical facts)
├── memory/                     ← chitraksh, frankie, active-projects, vision, learnings, pending-actions, contacts, cleanup-log
├── projects/                   ← oraya-labs (P1+P2), mercedes-kimi-agent, retell-cto-copilot
│   └── oraya-labs/deliverables/oraya-project-intelligence-dashboard.html
├── skills/                     ← retell-voice-agent, retell-browser-control, retell-cto-copilot, n8n-workflows,
│                                 insurance-lead-gen, voice-agent-deployment, legal-review-skill, skill-maker
├── protocols/                  ← sentient-protocol.md (v4), setup-instructions.md, setup-github.sh
└── handoffs/                   ← Oraya_Handoff_Brief_2026-04-17.md + this OUT file
```

### `Personal-HQ/`
```
├── CLAUDE.md                   ← Personal agent boot file (scope boundary redirect, legal-first reflex)
├── memory/                     ← (parallel structure; personal-side only)
├── projects/                   ← dissertation, hanflux-ai, fraudopedia, campus-platform, investigation-report
├── skills/                     ← legal-review-skill, hanflux-ai, fraud-detection, campus-platform,
│                                 content-automation, data-processing, skill-maker
└── protocols/                  ← sentient-protocol.md, setup-instructions.md
```

### Root `CLAUDE.md` (now a router)
Explains: "This is not the boot file. Pick an HQ and load its CLAUDE.md." Keeps the git repo (`hanfluxai-create/oraya-dashboard`) intact — GitHub Pages still serves `index.html` from repo root.

---

## 3. Canonical Facts (Unchanged / Re-confirmed)

- **Oraya Corporation** — California C-Corp · EIN 93-3462113 · Principal 34837 Winchester Place, Fremont, CA 94555 · SOI due 08/31/2026.
- **Stack** — Retell AI ($0.10/min, avg 3m30s ≈ $0.35/call, Voice ID `cd2fbc5e381df2b880e4533e52`) · n8n `https://hanfluxai2026.app.n8n.cloud` (86 workflows) · Supabase · Twilio A2P 10DLC · GoHighLevel CRM · Stripe.
- **Pilot** — Mercedes-Benz of South Bay (AutoNation) · sales mgr Chris Mazzio `Mazzioc@autonation.com`.
- **Pricing** — Voice AI baseline $997 → escalating to $3K–$5K/location/mo → long-term $7K–$11K. Insurance: $25–$50/lead OR $1,000/wk retainer.
- **E&O** — Quoted 04/07/26. Standard $46/mo (Prof Liability) vs Plus $82.42/mo (E&O + Cyber). $1K deductible · $1M limits.
- **Stripe** — Owner Frankie (`manifestdestiny247@gmail.com`, Chase ••••6789 USD payout, auto-payouts ON). Admin invite pending for `chitrakshmayank3@gmail.com`. $0.37 first signal on Apr 15.

---

## 4. Pending / Open Loops (For Next Session)

| # | Item | Owner | Blocker |
|---|---|---|---|
| 1 | Accept Stripe Admin invite on `chitrakshmayank3@gmail.com` | Chitraksh | Email action |
| 2 | Execute SSH permanent fix — run `protocols/setup-github.sh`, paste key at github.com/settings/keys | Chitraksh | One-time manual paste |
| 3 | Full Stripe-style white-background/light-mode dashboard redesign | Oraya Agent | Deferred — too large for this session. Consider as a v2 of the dashboard, preserve dark mode as toggle. |
| 4 | Apply Apr 12 Frankie website feedback — swap plumbing → automotive + life insurance, more CTAs, Vagaro-style hero screenshot, embed voice demo, feature Stripe payment link | Oraya Agent + Frankie | Coordinate with Next.js `oraya-ai` repo |
| 5 | Mercedes follow-up with Chris Mazzio | Frankie | Timing |
| 6 | Schedule recurring briefings to BOTH founders (Chitraksh + Frankie) | Oraya Agent | Use `scheduled-tasks` MCP |
| 7 | Clean up leftover `_legal-review-skill-original`, `_skill-maker-original`, stray `.DS_Store` (sandbox `rm` was permission-denied; retry next session) | Oraya Agent | Non-blocking |

---

## 5. Dashboard Mirror + Push — Mandatory Command

Dashboard file = `Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html`.
GitHub Pages serves `index.html` at repo root. After ANY dashboard edit:

```bash
cd ~/Downloads/Claude\ hq && \
rm -f .git/HEAD.lock && \
cp Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && \
git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main
```

Branch always `main`. The `cp` to root `index.html` is NOT optional.

---

## 6. Rules Reinforced From Prior Learnings

- Dashboard GROWS — never rewritten from scratch.
- Psych meter changes require justification (demonstrated tasks listed).
- Corrections logged to `memory/learnings.md` immediately.
- Scheduled briefings go to BOTH founders, not just one.
- No em dashes in final user-facing copy; dark theme preserved until explicit redesign ask.

---

## 7. North Star

Ship Mercedes pilot → land 20 subs at $499/mo → $9,980 MRR → Frankie quits day job → insurance arm scales → Quote AI launches → DAO insurance. Every session moves one rung up.

---

*Session closed cleanly. Next agent: read `CLAUDE.md`, follow the 13-step boot sequence, check this OUT brief first for what changed.*
