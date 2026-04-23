# In-House AI Legal · Template Pack v0.1 Scaffold

**Date:** Apr 18, 2026
**Authored by:** CTO-Claude (in-house AI legal function)
**Review gate:** Chitraksh (law student, non-resident US citizen, CA + federal + India common-law crossover)
**Status:** Scaffold — fills will land in v0.2 once Chitraksh signs off on shape

**Why this exists:** Strategy Law LLP quoted ~$10K for DPA, C-Corp housekeeping, ToS, and E&O scope. Non-economic at pre-revenue. We bootstrap in-house with AI + law-student review. External counsel re-engages only for litigation, M&A, IPO, or adversarial proceedings.

**Modeling reference:** Harvey, Spellbook, CoCounsel. Not their code — their pattern: template + precedent library + law-reviewed diffs.

---

## Pack contents · v0.1

The pack ships ten documents. Six are vendor-facing DPAs. Four are core commercial + liability docs.

### 1. Vendor DPA · Retell (voice platform)

**Controller–Processor with Retell as processor.** Scope: inbound + outbound telephony audio, call transcripts, caller phone numbers, agent prompt content.

Sections to fill:
- Categories of personal data (caller phone, voice recording, transcript content, derived intent flags)
- Purposes of processing (voice qualification, sales handoff routing)
- Sub-processors (Retell's LLM vendors — HiQ for sales-outbound, Gemini/Claude for inbound)
- Retention (TBD — Chitraksh to set: default 90 days recordings, 2 years transcripts)
- Cross-border transfer clause (US processing; if India-routed leads later, SCC addendum)
- Breach notification window (72 hours)

### 2. Vendor DPA · Supabase (database)

**Controller–Processor.** Scope: inventory records, call event logs, lead qualification metadata.

Sections to fill:
- Data residency (US region — confirm)
- Encryption at rest + in transit (document Supabase's defaults)
- Access controls (Oraya service-role key rotation policy)
- Backup + deletion timelines

### 3. Vendor DPA · Twilio (messaging + telephony rail)

**Controller–Processor.** Scope: SMS content, phone numbers, messaging service delivery metadata.

Sections to fill:
- A2P 10DLC brand/campaign registration reference
- Opt-in record retention (7 years is the conservative TCPA floor)
- Do-not-call list integration

### 4. Vendor DPA · Stripe (payment rail)

**Controller–Processor + joint-controller split** (Stripe is a joint controller for fraud screening).

Sections to fill:
- PCI scope (we never touch PAN; Stripe is in scope, we're SAQ-A)
- Tax residency references (EIN 93-3462113, CA C-Corp)
- Payout account protection (CTO + CEO dual-visibility; admin approval for new payout methods)

### 5. Vendor DPA · n8n Cloud (orchestration)

**Controller–Processor.** Scope: webhook payloads containing caller data, inventory data, lead qualification routing metadata.

Sections to fill:
- Instance reference (orayacorporation.app.n8n.cloud — migrated Apr 18)
- Log retention at the n8n layer (14 days default — tighten if needed)
- Credential storage policy (n8n-native encrypted credential vault — no plaintext)

### 6. Vendor DPA · GoHighLevel (CRM for P2)

**Controller–Processor.** Scope: qualified insurance leads, CRM pipeline data, agent-side notes.

Sections to fill:
- Sub-processor list (GHL's email, SMS, automation stack)
- Agent-user access controls (per-agent seat, not shared login)
- Export on termination (full data pull within 30 days of notice)

### 7. Pilot SOW · Universal template

One template, two variants (P1 automotive, P2 insurance).

Sections to fill:
- Parties + EIN
- Pilot scope (specific agents, specific volume, specific horizon)
- Success criteria (exit clauses if not met)
- Pricing — per-call, per-lead, per-retainer (three-option table)
- Term + termination (30-day mutual without cause)
- IP assignment (Oraya retains agent, prompt library, and workflow IP; client owns their data)
- Confidentiality (mutual, 2-year tail)
- Limitation of liability (capped at fees paid in prior 12 months, standard)
- Governing law (California)

### 8. Mutual NDA

For pre-pilot conversations (Teresa, Mazzio, AutoNation-adjacent).

Sections to fill:
- Purpose clause (evaluating a potential commercial relationship)
- Definition of confidential info (broad, with customary carve-outs)
- Term (3 years)
- Return or destroy on request
- No license granted
- Governing law (California)

### 9. Retainer agreement

For $1K/wk P2 retainer structure.

Sections to fill:
- Service description (lead delivery + qualification + handoff)
- Payment terms (weekly in advance, via Stripe)
- Lead quality SLA (define minimum qualified-contact definition)
- Pause + resume clause (agent can pause one week without penalty)
- Termination (30 days notice either side)

### 10. E&O rider language

To attach to P2 contracts — **Oraya is not an insurance producer**. The rider scopes us out of coverage opinions and into tech provider only.

Sections to fill:
- Definition of services (voice qualification + routing only)
- Express exclusion: Oraya does not quote, bind, or recommend insurance
- Agent remains the licensed producer for all coverage decisions
- Indemnity from agent for misuse of leads (e.g., cold calling beyond permissible hours)
- Data hygiene: Oraya maintains TCPA-compliant opt-in records; agent warrants own compliance downstream

---

## Review workflow (standing process)

1. **CTO-Claude drafts** full text from scaffold (v0.2 — triggered when Chitraksh approves the shape).
2. **Chitraksh reviews** as law-student QA — flags anything that would fail a procedural bar check or India common-law overlap issue.
3. **Redlines captured** in the deliverable file, not in email.
4. **v0.3 ships** to the counterparty.
5. **External counsel re-engages only for:** litigation, M&A, IPO, regulatory proceeding, or any demand letter received.

## Precedent library plan

CTO-Claude maintains a `precedent/` folder under `in-house-legal/`:
- Indexed by clause type (liability caps, IP assignment, termination, etc.)
- Sourced from public filings, reputable templates (YC SAFE, Cooley, Orrick open clauses), and our own shipped contracts once signed
- Every clause tagged with jurisdiction notes (CA, federal, India crossover where relevant)

This is the library Chitraksh can query when drafting or reviewing — pattern parallels how Spellbook surfaces clause suggestions, but built on our own ground truth.

## What v0.1 is NOT

- Not employment agreements (no employees yet).
- Not cap-table docs (C-Corp formation is done; next cap-table event is the first priced round).
- Not an IP assignment pack (CTO + CEO are the two original authors; founder IP-assignment exists at formation).
- Not a privacy policy / ToS for the website. Those ship in v0.2 as a separate pack.

## Target ship

- v0.1 scaffold (this doc): **today, Apr 18**
- v0.2 filled text (docs 1–10): **Apr 24**
- v0.3 counterparty-ready: **Apr 28**

CTO-Claude owns drafting. Chitraksh owns review. Frankie does not touch legal — Frankie's bar is commercial, not legal.
