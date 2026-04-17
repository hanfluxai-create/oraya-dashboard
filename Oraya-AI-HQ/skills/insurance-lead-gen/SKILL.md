# Skill: Insurance Lead Generation AI (Oraya P2)
**Last Updated:** March 15, 2026

## Business Model
Lead resale: $40/lead (with opt-in) | Commission: 140% first-year = ~$1,920/policy
Lead cost: ~$2-5 | Margin: $35-38/lead | 100 leads → $4,000 resale + $9,600 commissions

## 4 Verticals
1. Mortgage/Property (RealEstate) — Atom Property API → new homeowners → homeowners/mortgage protection
2. Life Insurance (WealthTransfer) — employment+age records → 35-55 yr olds with dependents
3. Medicare/Medical (HealthMedicare) — CMS Medicare API → 65+ / coverage gaps → Medicare supplement
4. Family (CommercialRisk) — family records → adults with aging parents → final expense/care

## Lead Classification Workflow (Insurance_Lead_Main.json — 48 nodes)
Webhook → Stage 1: Keyword routing (mortgage/property, life/wealth, medicare/health, family/loved)
→ Stage 2: LLM fallback (OpenAI classifies ambiguous leads) → Stage 3: Vertical handler
→ Stage 4: Enrichment → Stage 5: Email delivery + embedded web voice AI

## TCPA Compliance Strategy (Critical)
Email outreach ONLY (not cold calling) → user clicks to initiate web voice = not a cold call
Opt-in captured in web session = enables future contact
Required docs: opt-in timestamp, IP, consent language, TCPA disclosure, DNC check timestamp

## Data Pipeline
Gov APIs → N8N polling → normalize → deduplicate → score → Supabase
Tables: raw_leads, qualified_leads, delivered_leads (with opt-in status)
Delivery: email campaign + lead resale API ($40/lead buyers)

## Current Blockers (March 2026)
No API integrations built | No data batch tested | No compliance docs | No email infrastructure
No web-embedded voice AI page | No lead buyers identified

## Next Steps (Priority)
1. Test CMS Medicare API (sample state) 2. Test Atom Property (California)
3. Build classification workflow (use Insurance_Lead_Main.json as template)
4. Compliance doc template 5. Web voice AI landing page (Retell web widget)
6. Find first lead buyer at $40/lead

## Source Files
- Downloads/Code & Data/Insurance_Lead_Main.json (48-node workflow)
- Meeting transcripts in Downloads root
