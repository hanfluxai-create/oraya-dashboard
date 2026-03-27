# Oraya Labs — Full Project Context
**Last Updated:** March 27, 2026
**Source:** 13 meeting transcripts + website audit + production workflow files + WhatsApp chat logs (Mar 16–27)

---

## Company Overview
- **Name:** Oraya Labs / Oraya AI (both used interchangeably)
- **Website:** https://oraya-ai-h485.vercel.app/ (pricing section NOT FINAL — ignore it)
- **Founders:** Frankie (CEO) + Chitraksh Mayank (CTO)
- **Former:** Greg — was offered 10% equity as partner. NOW OUT. Never reference as active.
- **Legal:** S-Corp filed. EIN filing in progress (SS-4 faxed to IRS, 4-5 day turnaround). No bank yet. No Stripe. No contracts signed.
- **Revenue:** Pre-revenue (both projects)
- **Notion Page:** 322915e1-bde1-8134-b8ff-d7809482809c

---

## PROJECT 1: Voice AI for Automotive Dealerships (P1)

### Overview
AI-powered outbound/inbound voice agent for automotive dealerships. First pilot target: Mercedes-Benz South Bay (Torrance, CA).

### Production Stack
- **Voice:** Retell AI + 11Labs (custom voice: cd2fbc5e381df2b880e4533e52)
- **LLM:** gemini-3.0-flash (in Retell) + Claude Opus 4.5 (reasoning)
- **Orchestration:** N8N (self-hosted, $0/mo) — https://hanfluxai2026.app.n8n.cloud
- **Database:** Supabase — tables: "Appointment Log", "Call back log", SMS, Master Call Log
- **Telephony:** Twilio A2P 10DLC (warm transfer +13103716100 for Mercedes)
- **Calendar:** Google Calendar (flashworkflow@gmail.com)
- **Webhook:** /webhook/c8f31eb3-9a96-49d8-b223-433911ed0a99

### Voice Agent Specs
- Nodes: 10 (optimized from 21) | Interrupt sensitivity: 0.8
- Max call: 300s | Silence timeout: 120s
- Post-call variables: Caller_Name, email, appointment_booked, appointment_date, appointment_timestamp, car_model, call_back_scheduled, call_back_reason, Customer_sentiment, recording_consent, Query_Type + call_summary (built-in)

### N8N Workflow (Post-Call)
Entry: PCDE node (call_successful check)
→ Appointment (if appointment_booked==true): Calendar + SMS admin + Supabase "Appointment Log"
→ Callback (if call_back_scheduled==true): Gmail admin + Supabase "Call back log"

### Cost Structure (Confirmed)
Total per client: $30-40/mo | Retell: $1.50-$200/mo | N8N: $0 | Supabase: $0-25 | Twilio: $5-15
Gross margins: 92-96% at website pricing tiers

### Status (Updated March 27, 2026)
- MVP complete and tested in production
- **Human cold transfer: CONFIRMED WORKING** (SIP invite method, passes caller ID internationally)
- Warm transfer: Semi-functional (connects but no advisor briefing)
- Three-way debrief transfer: Tested, glitching — not working yet
- Mercedes dealership report created (Dealership Report Client Version - Mercedes of South Bay.docx)
- **Mercedes email deadline: April 2, 2026** — must finalize offer, mins, package before sending
- Greg pilot fell through — need new champion at dealership
- CRM: Swapped from HubSpot → GHL (GoHighLevel) — Frankie giving admin access
- Dashboard updated with all WhatsApp + meeting intel through Mar 27

---

## PROJECT 2: Insurance Lead Generation AI (P2)

### Overview
AI-powered lead gen using government/public data. Email-first delivery + embedded web voice AI (TCPA compliant — user-initiated).

### 4 Verticals
1. **Mortgage/RealEstate** — Atom Property API → new homeowners → homeowners/protection insurance
2. **Life/WealthTransfer** — Employment + age records → 35-55 yr olds with dependents
3. **Medicare/HealthMedicare** — CMS Medicare API → 65+ / coverage gaps → Medicare supplement
4. **Family/CommercialRisk** — Family records → adults with aging parents → final expense

### Revenue Model
- Lead resale: $40/lead (with documented opt-in)
- Commission: 140% first-year premium = ~$1,920/policy
- Per 100 leads: ~$4,000 (resale) + $9,600 (commissions) = $13,600

### TCPA Strategy
Email outreach only → user clicks to start web voice conversation = user-initiated = not a cold call
All data from public/government sources → no data privacy violations

### N8N Workflow (Insurance_Lead_Main.json — 48 nodes)
Webhook → Keyword routing (RealEstate/WealthTransfer/HealthMedicare/CommercialRisk) → LLM fallback → Vertical handler → Enrichment → Email + embedded web voice

### Frankie's Role (Core IP)
CA + TX licensed agent | Carrier relationships | 140% commission structures
His domain expertise makes P2 viable — irreplaceable

### Status (Updated March 27, 2026)
- Architecture fully designed
- **Insurance voice agent "Maya" — first live test completed Mar 27**
  - Converted from Mercedes agent via multi-AI prompt engineering
  - Best LLM: Claude IQ 4.5 (tested Gemini 3 Flash and GPT 5.2 — both worse)
  - Cold transfer to licensed advisor working
  - Known issue: Prompt leakage on certain LLMs
- Financial progress: 1 chargeback paid, license renewal paid, carrier contracting initiated
  - Remaining: 1 chargeback ($1,600), marketing retainer + ad budget ($2,500), CRM + Meta Ads setup
- CRM: GHL (GoHighLevel) — replacing HubSpot
- No API integrations built yet for lead scraping
- No data batch tested
- Compliance framework document not created
- No email campaign infrastructure
- No lead buyers identified at $40/lead

---

## Shared Unresolved Items
- EIN filing → SS-4 faxed to IRS, 4-5 day turnaround. Then: bank account → add Chitraksh to S-Corp → add to bank with passport
- Business entity: C Corp → partnership/S-Corp transition under discussion. CA (Chartered Accountant) consulted.
- US bank account → needed for receiving payments (India↔US friction)
- Domain connection: orayalabs.ai → Vercel (CONNECTED as of Mar 15)
- Stripe setup → for client billing
- Client contracts template → not drafted
- Greg demo outcome → never happened. Greg is OUT.
- **Mercedes email deadline: April 2, 2026** — offer/mins/package must be finalized first
- Dealership map feature: San Jose area, Google Maps pins with name/address/phone/status (requested by Frankie, not urgent)
- Social media: @memeowcats (50K IG followers) reached out — meeting to schedule
- Google Stitch → plan for iOS/Android client dashboard app with premium features
- Claude Max subscription → $200/mo shared, ~$4,000-4,500 compute value planned

## New: Tech Stack Evolution Discussion (Mar 27)
- Long-term plan: Migrate N8N workflows to Claude Code for full IP ownership
- N8N predicted obsolete by end of 2027 (Claude Code + dev tools replacing visual workflow builders)
- Current N8N stays for voice AI backend (execution logs visibility advantage)
- Future: Claude Code for all new automation, N8N for existing production workflows

## Meeting Transcripts Analyzed (13 total — in Downloads root)
- AI Sales Automation Platform Demo & Business Strategy Call
- AI Voice Agent (Jessica) Live Testing & Optimization
- AI Voice Agent Development Sprint - Twilio Integration & Dashboard Planning
- AI Voice Platform Development & Business Strategy Discussion
- Insurance Lead Gen AI System + N8N Workflow Build & Twilio Setup
- Oraya AI Pilot Development & Mercedes Demo Strategy Session
- Oraya Labs Business Planning (GoDaddy, Website, AutoNation, Insurance)
- Meet - stj-pajo-swu.txt
- Untitled Recording (1).txt
- Untitled Recording.txt
- AI Sales Agent Workflow Testing & Appointment Reminder System Configuration
- Dashboard Review, Voice Agent Testing & Insurance System Build Session (Mar 15)
- **Voice AI Insurance Agent Testing & Claude Code vs N8N Discussion (Mar 27)**

## WhatsApp Chat Intelligence (Mar 16–27, 2026)
- Extracted and logged in dashboard WhatsApp Intelligence Log tab
- Key decisions: CRM swap (HubSpot → GHL), April 2 email deadline, EIN filing, insurance payments progress, Google Stitch, social media lead (@memeowcats), Claude Max subscription
