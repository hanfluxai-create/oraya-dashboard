# Pending Actions

Tasks live in two places:

1. **Dashboard** (`projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html`, Tasks tab) — full task register with priority, owner, blockers, due dates.
2. **Root TASKS.md** (`/Users/.../Claude hq/TASKS.md`) — productivity-skill-managed working list, synced from this dashboard.

This file holds only cross-session process notes that don't belong in the dashboard.

## Process notes

- **AI personality adaptation:** Match Frankie warm/casual, Chitraksh systems-direct. Built into `protocols/sentient-protocol.md`.
- **Dashboard cross-reference rule:** Every dashboard update compares current state vs new evidence. Psych scores need task-level justification. Never freeze a score.
- **Vibe Prospecting:** Multiple accounts deliver 100-200 leads each. Track lead source per account; optimize, don't reset.
- **CRM build (longer arc):** Frankie has custom CRM UI (GHL + HubSpot + Salesforce hybrid). Chitraksh wires backend. Pipeline view, lead score, analytics, contact cards. Internal tool + potential client product.
- **Tuesday insurance email (sent Apr 21):** Rule going forward: any Tuesday cold-open to insurance agents sends between 08:00 and 09:00 PT. Prospect-response window averages Tue+1 to Tue+4 (Wed to Sat). Plan inventory or qualifier work to land before Wed EOD of the following week. Logged in `learnings.md` under BUSINESS FACTS.
- **Inventory sprint window (Apr 22 to 25):** Day 1 = v3 synonym map deploy + sync verdict. Day 2 = cold-transfer guardrail + retest. Day 3 = proactive "3 close alternatives" flow. Day 4 = single-graph production lock. Any prospect reply asking inventory routes through the locked stack, never through an unhardened branch.
- **Teresa anchor-close (pending Apr 22):** branch picked determines next 7-day cadence. Branch (a) runs the qualifier on 2 warm leads under `T-APR26-R1`. Branch (b) kicks a 10% year-one ARR referral to contacts.md. Branch (c) signs pilot SOW + Stripe 4-week prepay + May 1 start. Fallback (none): move Teresa from anchor-producer to lukewarm-deferred, no outreach before Apr 28.
- **Gmail MCP limitation:** `send_draft` tool is still absent from the Gmail MCP schema as of Apr 24. Daily briefs are created as drafts only; on-disk HTML at `deliverables/daily-briefs/YYYY-MM-DD.html` is canonical. Chitraksh opens Gmail drafts folder and clicks Send manually. Re-evaluate when the tool reappears.
- **Apr 24 Renaissance pivot (post Mtg 23):** P2 cold-email channel deprioritized as primary (math: 0.03 percent opt-in, 1 lead per 306 emails). Paid ads is now channel one for both P1 and P2; campaigns launch with Frankie's next paycheck on the budget tier ladder ($150 → $500 → $1500/wk). Apollo confirmed live on free tier as enrichment, audit + upgrade-trigger documented at `deliverables/marketing/apollo-audit-apr24.md`. All paid-ads strategy lives in `deliverables/marketing/paid-ads-playbook-v0.1.md`.
- **Direct-to-owner pivot (Apr 24):** if MBSB champion layer (Mark Akbar, Mazzio, Khalid) silent past T+72h on the Apr 24 AM triple-send, Frankie flies SF to LA Apr 25/26, $180 / 1hr, in-person walk-in to Mark Akbar + 2 adjacent dealerships. Cold-walk script + leave-behind at `deliverables/demo-playbook/direct-to-owner-script-v1.md`. Trigger psyched by cousin passing: "remove all the noise, only look for the signal."
- **Stripe live-mode launch (Apr 24):** fresh account on `frankie@orayalabs.ai`, three products to launch by EOD ($497 intro / $997 standard / $1997 enterprise). Spec, webhook plumbing, Supabase `subscriptions` schema at `deliverables/billing/stripe-products-v1.md`. RPA path on Stripe payment pages is BLOCKED by Stripe security; product creation is hands-on-keyboard for Frankie. Webhook + Supabase write is Chitraksh's plumbing today. Never paste live `sk_live` or `whsec_` into the repo: placeholders only.
- **George P2 inbound (Apr 15 → Apr 24 callback):** old insurance client, ~$1K expected, first unprompted P2 reactivation. Follow-up packet (call notes template, email script, quote sheet, GHL tagging) at `deliverables/demo-playbook/george-p2-followup-packet.md`. Treat as highest-priority P2 conversation today after MBSB triple-send replies.
- **Inventory sprint Day 4 of 4 (Apr 25 EOD lock target):** single-graph production lock spec at `deliverables/voice-ai-bugs/single-graph-lock-spec.md`. Merge gates: 21/21 retest pass + 5/5 cold transfers without silent drop + empty-path branch graceful + p50 ≤ 4s p95 ≤ 8s. Tag on merge: `prod-2026-04-25`. Rollback recipe documented.

## Future ideas (do not memorize twice — also in `vision.md`)

Transcript-to-dashboard skill, weekly audit task, meeting summary skill, Retell flow testing skill, project status report generator (reads all PROJECT.md), Google Stitch mobile dashboard, @memeowcats (50K IG) social, Gemini 3.1 Live as 11Labs replacement (Jun-Jul 2026), WhatsApp Business auto-sync, Meta/Google ads for SMBs.
