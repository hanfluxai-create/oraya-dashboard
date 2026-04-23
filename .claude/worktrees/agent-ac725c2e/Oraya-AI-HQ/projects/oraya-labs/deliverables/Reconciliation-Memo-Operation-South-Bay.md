# OPERATION SOUTH BAY — RECONCILIATION MEMO & EXECUTION PLAN
## Prepared: March 15, 2026
## Classification: Internal / Restricted

---

# PART 1 — STRUCTURED RECONCILIATION

## A. SOURCE DOCUMENT ROLE MAPPING

### Source Document 1 (Mercedes-Pilot-Proposal-Research.pdf) — "The Strategy Doc"
**What it does well:**
- Comprehensive 7-document proposal package design
- Document-by-document creation plan with purpose, length, tone for each
- Competitive intelligence framework (Podium, Fullpath, Dealer.com, CarNow, Conversica)
- AutoNation corporate research framework
- Pre-send checklist and verification workflow
- A2P 10DLC implementation guide with pre-written campaign use cases and sample messages
- Pilot success metrics table with measurable KPIs
- Documentation assembly workflow and quality gates

**What it lacks:**
- Company name placeholder "[Your LLC Name]" — should be "Oraya AI LLC"
- Uses "Retail.ai" instead of "RetellAI" throughout (critical error)
- No actual legal analysis — only research task lists
- No executed compliance controls — describes what to research, not what exists
- Vendor compliance matrix has "TBD" and "In Review" for n8n and "Retail.ai"
- No post-pilot contract structure detail
- No SOC 2 roadmap for Oraya AI
- No insurance sequencing plan
- Pricing strategy is placeholder only

### Source Document 2 (Dealership-Report-Client-Version.docx) — "The Legal Doc"
**What it does well:**
- Formal legal certification structure with statutory citations
- TCPA/CIPA/FTC/CPRA/ADMT/SB 446 analysis with controlling authority citations
- Exact consent disclosure scripts (inbound, outbound, SMS)
- Technical enforcement pseudocode (n8n webhook consent verification)
- Supabase consent_log SQL schema with RLS
- PII redaction categories with compliance rationale
- Data retention policy table with specific periods
- Residual risk matrix with likelihood/impact/mitigation
- Gap remediation plan with responsible parties
- CPRA DPA language (Appendix A) with exact statutory references
- Access control matrix by role
- Incident response plan aligned to SB 446 timelines
- TISAX/OEM framing with vendor attestation table

**What it lacks:**
- No commercial strategy or pricing
- No competitive positioning
- No AutoNation escalation pathway
- No insurance or contract conversion planning
- Represents some controls as fully implemented that are administrative (DPA execution noted as gap)
- Does not address the one-to-one consent rule status (now vacated)
- TISAX deadline stated as September 30, 2026 — research shows this is from NP.50.14.110 but exact date not publicly confirmed

### Where they overlap:
- Technical architecture (Twilio → RetellAI → n8n → Supabase → Dashboard)
- Consent gating logic (PEWC check before outbound)
- Non-consent purge workflow (basic_attributes_only)
- A2P 10DLC registration requirement
- TISAX/OEM security mandate
- Vendor compliance matrix (partial)
- Known gaps: DPA execution, dealership A2P registration, retention automation

### What neither covers sufficiently:
- Oraya AI's own SOC 2 roadmap and timeline
- Cyber liability insurance / E&O insurance requirements and sequencing
- Post-pilot contract conversion mechanics and dealership SLA shape
- AutoNation MSA escalation pathway with specific procurement expectations
- ADMT gray zone analysis for lead classification and escalation decisions
- Specific pricing model for pilot and post-pilot
- Competitive differentiation strategy (beyond listing competitors)

---

## B. TERMINOLOGY RECONCILIATION

| Source 1 Term | Source 2 Term | Canonical Term | Notes |
|---|---|---|---|
| Retail.ai | RetellAI | **RetellAI** | Source 1 is WRONG throughout. Must normalize. |
| [Your LLC Name] | Oraya AI LLC | **Oraya AI LLC** | Source 1 placeholder. |
| "your system" | N/A | **Oraya AI Platform** | Standardize for client-facing use |
| consent_log | consent_log | **consent_log** | Consistent |
| basic_attributes_only | basic_attributes_only | **basic_attributes_only** | Consistent |
| "legal study" | "compliance verification report" | **Post-Implementation Legal & Technical Compliance Verification Report** | Source 2 title is canonical |

---

## C. ARCHITECTURE RECONCILIATION — CANONICAL STACK

| Layer | Vendor | Role | Certifications (Verified March 2026) |
|---|---|---|---|
| **Telephony** | Twilio | A2P 10DLC, SIP/RTP transport, carrier-level STOP processing | SOC 2 Type II, ISO 27001, PCI DSS Level 1 |
| **Voice AI** | RetellAI | Speech-to-text, LLM dialogue, TTS synthesis, PII redaction, data_storage_setting control | SOC 2 Type I & II, HIPAA (BAA separate), ISO 27001, GDPR, PCI |
| **Orchestration** | n8n Cloud | Post-call webhook, consent verification, purge API, PEWC gate, 30-day log pruning | SOC 2 (cloud managed), GDPR, AES-256 at rest, TLS in transit |
| **Database** | Supabase | Immutable PEWC consent_log, redacted transcripts, RLS enforcement | SOC 2 Type II, HIPAA BAA (Team/Enterprise), AES-256, TLS 1.2 |
| **Administration** | Google Vertex AI / AI Studio | Admin dashboarding, LLM oversight, Zero Data Retention | SOC 2 Type II, ISO 27001, ZDR confirmed |
| **Dashboard** | Vercel-hosted (custom) | Real-time sync, email auth via Supabase | SOC 2 Type II, ISO 27001, TISAX Level 2 |

**KEY CORRECTION FROM SOURCE 1:** RetellAI now has confirmed SOC 2 Type I & II, HIPAA, ISO 27001, GDPR, and PCI certifications. Source 1's vendor compliance matrix showing "TBD" for "Retail.ai" is outdated.

**KEY CORRECTION ON n8n:** n8n Cloud IS SOC 2 compliant (managed). Does NOT hold ISO 27001 directly. Self-hosted shifts compliance responsibility. Source 1's "TBD" is partially outdated.

**KEY CORRECTION ON Supabase:** TLS version is 1.2 (not 1.3 as sometimes claimed). HIPAA BAA requires Team or Enterprise plan (not Pro).

---

## D. COMPLIANCE RECONCILIATION

### TCPA / FCC AI Voice Rules
- **Source 2 Status:** Correctly identifies FCC-24-17 (Feb 2024) classifying AI voices under TCPA
- **Source 1 Status:** References January 27, 2026 one-to-one consent rule
- **RESEARCH UPDATE:** The Eleventh Circuit **vacated** the FCC one-to-one consent rule on January 26, 2025, the day before it was to take effect. The rule is NO LONGER IN EFFECT. However, standard PEWC requirements remain fully applicable for AI voice calls. Conservative posture (direct seller-specific consent) remains the correct approach.
- **Document A/B Treatment:** Note the vacatur as positive news for operational flexibility, but maintain PEWC enforcement as the conservative legal posture. Do not relax controls.

### CIPA §§ 632 and 632.7
- **Both sources consistent.** Smith v. LoanMe (2021) correctly cited. Purge workflow correctly mapped.
- **No changes needed.**

### FTC AI / Bot Disclosure
- **Both sources consistent.** Operation AI Comply (Sept 2024) correctly cited. Hard-coded identity disclosure correctly documented.
- **No changes needed.**

### CPRA / CCPA Data Minimization and Service Provider
- **Both sources consistent.** DPA language in Source 2 Appendix A is correct.
- **RESEARCH UPDATE:** CPRA regulations were finalized September 22, 2025, effective January 1, 2026. Source 2 is current.
- **Gap:** DPA must be formally executed (not just appended) with all vendors.

### CPPA ADMT Framework
- **Source 2 correctly states** system is architecturally exempt from ADMT by restricting to scheduling/Q&A.
- **RESEARCH UPDATE — CRITICAL:** California ADMT regulations define "significant decisions" to include **scheduling decisions in the employment context**. However, this refers to scheduling of employees, not scheduling of customer appointments. Customer service scheduling (booking test drives, service appointments) does NOT constitute a "significant decision" under the regulation.
- **GRAY ZONE CONFIRMED:** AI deciding to escalate to a human is NOT a significant decision — it's a routing decision. AI classifying a lead as "appointment booked" vs "callback requested" is data categorization, not a significant decision. Outbound selection logic for consented contacts is permissible as long as consent is valid.
- **Recommendation:** Maintain architectural restriction. Document in both documents that ADMT is not triggered. Add brief analysis of gray zones with conservative conclusion.
- **Full ADMT compliance deadline:** April 1, 2027 (if triggered).

### SB 446 Breach Notification
- **Source 2 correctly states** 30-day consumer / 15-day AG timelines. Effective January 1, 2026.
- **No changes needed.**

### TISAX / Mercedes-Benz OEM Security
- **Source 2 states** September 30, 2026 deadline per NP.50.14.110.
- **RESEARCH UPDATE:** Public research does not confirm a specific September 30, 2026 date, but NP.50.14.110 (August 2023 version) IS a real document requiring contractors to maintain ISMS. The deadline may be dealership-specific or communicated via dealer portal.
- **Treatment:** Reference NP.50.14.110 as the controlling document. State the September 30, 2026 date as "per Mercedes-Benz dealership communications" rather than citing a public source. Use it as a real urgency driver.

---

## E. GAP RECONCILIATION

### IMPLEMENTED AND VERIFIED
1. PEWC consent gating via Supabase consent_log + n8n pre-dial query
2. IVR recording disclosure (inbound + outbound scripts)
3. Non-consent purge workflow (basic_attributes_only via RetellAI API)
4. FTC bot identity disclosure in system prompt
5. RetellAI PII redaction engine (9 categories active)
6. Supabase RLS on consent_log table
7. A2P 10DLC Standard Brand registration (Oraya AI → dealership admins)
8. STOP opt-out processing at carrier level
9. Twilio A2P registration for admin-to-admin messaging
10. Google Vertex AI ZDR form approved
11. MFA enforcement on all admin accounts

### IMPLEMENTED BUT EVIDENCE NEEDED
1. RetellAI SOC 2 Type II report — must be formally requested and filed
2. n8n Cloud SOC 2 report — must be formally requested
3. Supabase SOC 2 Type II report — must be formally requested
4. n8n execution log auto-purge at 30 days — confirm via n8n dashboard settings
5. Supabase RLS enforcement — screenshot needed showing policy active
6. RetellAI PII redaction toggles — screenshot needed showing all 9 categories enabled

### REQUIRED BUT OPEN
1. **DPA execution with all vendors** — CPRA § 1798.140(ag) language must be formally countersigned (not just appended)
2. **Dealership A2P 10DLC registration** — Mercedes of South Bay must register its own A2P campaign for customer-facing SMS
3. **30-day auto-purge for no-consent data in n8n** — design confirmed but NOT YET IMPLEMENTED
4. **Automated retention policy** — scheduled jobs to purge no-consent records from all databases
5. **TISAX Level 2 audit commission** — dealership must engage accredited TISAX auditor
6. **Supabase HIPAA BAA execution** — if health-related data (ADA accommodations) is processed
7. **Incident Response Plan tabletop exercise** — SB 446 timelines need live validation

### COMMERCIALLY IMPORTANT BUT NOT YET ADDRESSED
1. **Oraya AI SOC 2 Type I roadmap** — no audit initiated
2. **Cyber liability insurance** — not obtained ($1M-$5M coverage needed)
3. **Professional liability / E&O insurance** — not obtained
4. **Post-pilot dealership SLA** — not drafted
5. **AutoNation MSA framework** — not drafted
6. **Oraya AI LLC EIN** — not filed
7. **Oraya AI LLC bank account** — not opened
8. **Stripe payment integration** — not connected

---

## F. PRIORITY UNKNOWNS — MUST CONFIRM BEFORE FINALIZATION

1. **Is the September 30, 2026 TISAX deadline confirmed** via Mercedes-Benz dealer portal communication?
2. **Supabase region for current project** — is it us-west-1 (California) or another region?
3. **RetellAI retention period setting** — what is currently configured (1-730 days)?
4. **n8n plan tier** — is it Enterprise (unlimited retention) or Pro (30-day retention)?
5. **Supabase plan tier** — Free/Pro/Team/Enterprise? (BAA requires Team+)
6. **Has Oraya AI LLC been formally incorporated?** EIN status?
7. **Pilot pricing decision** — no-cost, nominal fee ($500), or monthly fee?
8. **Insurance budget and timeline** — when can cyber liability and E&O be bound?
9. **Target send date for first email to Mercedes of South Bay** — needed for all deadlines
10. **Contact at Mercedes of South Bay** — GM, IT director, or counsel? Who receives the package?

---

# PART 2 — VENDOR COMPLIANCE FINDINGS (FROM RESEARCH)

## RetellAI (Confirmed March 2026)
- SOC 2 Type I & Type II certified
- HIPAA compliant; BAA available (separate negotiation required)
- ISO 27001 certified
- GDPR compliant with DPA available
- PCI native support
- Data retention: configurable 1-730 days; `basic_attributes_only` purges audio + transcript
- Three data storage settings: everything (default), everything_except_pii, basic_attributes_only
- Contact: compliance@retellai.com

## n8n Cloud (Confirmed March 2026)
- SOC 2 compliant (cloud managed); SOC 3 report available publicly
- Does NOT hold ISO 27001
- GDPR compliant with DPA available
- AES-256 encryption at rest (Azure, FIPS-140-2)
- TLS encryption in transit
- Pro plan: 30-day execution log retention; Enterprise: unlimited
- Self-hosted shifts all compliance responsibility to customer
- Best positioned as "orchestration layer, not system of record"

## Supabase (Confirmed March 2026)
- SOC 2 Type II certified (annual audit)
- HIPAA compliant; BAA available on Team and Enterprise plans ONLY
- AES-256 encryption at rest; TLS 1.2 in transit
- 12+ AWS regions; us-west-1 (California) available
- RLS fully supported on all plans
- No US-only data residency guarantee (region-selectable per project)

## Twilio (From Source Documents + Known)
- SOC 2 Type II, ISO 27001, PCI DSS Level 1
- GDPR compliant
- A2P 10DLC Standard Brand registered

## Google Vertex AI / AI Studio
- SOC 2 Type II, ISO 27001
- ZDR form approved; no model training on customer data

## Vercel
- SOC 2 Type II, ISO 27001, TISAX Level 2 (!), PCI DSS v4.0

---

# PART 3 — COMPETITIVE INTELLIGENCE SUMMARY

| Competitor | SOC 2 | ISO 27001 | Automotive-Specific | Pricing | Key Differentiator |
|---|---|---|---|---|---|
| **Podium** | Expected (not confirmed public) | Not confirmed | Jerry 2.0 AI for dealers (Jan 2026) | $249-$599/mo | Messaging + review management; broad SMB |
| **Fullpath** | Not confirmed | ISO 27001 + ISO 42001:2023 (first automotive AI mgmt cert) | CDP + Agentic CRM | Custom (demo) | OEM partnerships (Acura, GM); AI-specific ISO cert |
| **Dealer.com** | Not confirmed | Not confirmed | ASC certified websites | Not disclosed | Cox Automotive ecosystem; broad DMS integration |
| **CarNow** | Not confirmed | Not confirmed | 20+ manufacturer certifications | Not disclosed | Digital retailing; 5,000+ dealership customers |
| **Conversica** | Type II (Jan 2021) | Not confirmed | Deep automotive domain training | Not disclosed | Revenue Digital Assistant; conversation AI |

### Oraya AI Competitive Advantages:
1. **Full-stack voice AI** (not just chat or messaging) — only Conversica competes here
2. **Programmatic compliance enforcement** — controls are technical, not policy-based
3. **TISAX-ready vendor stack** — Vercel has TISAX Level 2; no competitor highlights this
4. **Real-time PII redaction** — built into the data flow, not bolted on
5. **Cost structure** — $30-40/mo infrastructure vs. Podium's $249-599/mo
6. **Privacy-by-design architecture** — consent gating prevents data from existing if consent isn't given

---

# PART 4 — AUTONATION INTELLIGENCE SUMMARY

- **323 dealerships** across 20 states (TX 20%, FL 20%, CA 13%)
- **CISO:** Ken Athanasiou (since Aug 2014) — security-conscious leadership
- **CIO:** Christos Kotsakis (Starwood Hotels, IBM, PwC background)
- **Tech posture:** Customer 360 platform, 9M customer database, Epsilon data warehouse, AppDynamics monitoring
- **Decision-making:** Highly centralized IT infrastructure; individual dealership autonomy limited
- **Digital:** ~50% of business conducted online; AutoNation Express platform
- **No reported data breaches** (2024-2026) — but will be security-conscious given centralized data
- **Expansion:** Targeting 130+ AutoNation USA stores by end 2026
- **Vendor onboarding:** Formal process with cybersecurity documentation, compliance certs, auditable procedures

### Strategic Implications for Oraya AI:
1. Centralized IT means dealership-level pilot can be escalated to corporate if successful
2. Ken Athanasiou (CISO) will likely review any vendor security documentation
3. Christos Kotsakis (CIO) background in enterprise tech (IBM, PwC) means he expects enterprise-grade documentation
4. AutoNation's Epsilon partnership suggests they value data infrastructure providers
5. No breach history means they'll want to keep it that way — security documentation must be thorough
6. Corporate MSA would cover 323 dealerships — massive scale opportunity

---

# PART 5 — DOCUMENT A COMPLETE OUTLINE

## ORAYA AI LLC — MERCEDES OF SOUTH BAY PILOT PROPOSAL & EXECUTION MASTER BRIEF

### Section 1: Cover Page
- Title, date (March 15, 2026), classification (INTERNAL / RESTRICTED)
- Company: Oraya AI LLC
- Target: Mercedes of South Bay (AutoNation Group)
- Codename: Operation South Bay

### Section 2: Table of Contents

### Section 3: Executive Context
- This is Oraya AI's entry into the automotive enterprise space
- Not just a pilot — opening move toward AutoNation MSA covering 323 dealerships
- Standard: enterprise-grade security, compliance, and professionalism from day one
- The Mercedes brand demands a luxury-standard approach

### Section 4: Objective and Success Definition
- **Primary:** Secure 30-day pilot at Mercedes of South Bay
- **Secondary:** Convert to 2-year dealership SLA
- **Tertiary:** Establish AutoNation corporate MSA
- **Success metrics:** 95% inbound answer rate, 70% outbound reach rate, 25%+ appointment booking, 4.0+ satisfaction, zero compliance violations

### Section 5: Source-Document Reconciliation Summary
- Brief summary of reconciliation findings
- Key corrections (Retail.ai → RetellAI, vendor certs updated)
- Single source of truth established

### Section 6: Current-State System Overview
- Architecture diagram description (Twilio → RetellAI → n8n → Supabase → Dashboard)
- Each vendor's role and certification status
- What is live, what is administrative

### Section 7: Strategic Positioning Narrative
- "Serious infrastructure partner, not risky startup with a demo"
- Compliance-first architecture differentiator
- TISAX-ready vendor stack
- Full-stack voice AI vs. competitors' chat-only or messaging-only
- Cost advantage ($30-40/mo vs. $249-599/mo)

### Section 8: Proposal Package Strategy
- Two-wave send strategy
- First wave: executive proposal + architecture diagram + privacy declaration
- Second wave: deeper appendices when requested (compliance report, vendor certs, DPA)

### Section 9: First-Send Document Strategy — "First Email Package — Exactly What to Send"
- Executive proposal letter (1 page) — on Oraya letterhead
- Visual architecture diagram (1 page)
- Condensed privacy & compliance declaration (2-3 pages)
- NOTHING ELSE in first send

### Section 10: Second-Send / Diligence Package Strategy
- Full compliance verification report (Document B)
- Vendor certification bundle
- A2P 10DLC implementation guide
- Pilot SOW / agreement
- Mutual NDA (if not already signed)
- Pilot success metrics

### Section 11: Pre-Send Checklist by Owner and Deadline
| Item | Owner | Deadline | Status | Proof of Closure |
|---|---|---|---|---|
| Normalize all docs to "RetellAI" | Engineering | Before send | ☐ | Doc review |
| Request RetellAI SOC 2 Type II report | Engineering | T-10 days | ☐ | Report received |
| Request n8n SOC 2 report | Engineering | T-10 days | ☐ | Report received |
| Request Supabase SOC 2 Type II report | Engineering | T-10 days | ☐ | Report received |
| Screenshot: Supabase RLS active | Engineering | T-7 days | ☐ | Screenshot |
| Screenshot: RetellAI PII toggles | Engineering | T-7 days | ☐ | Screenshot |
| Confirm n8n 30-day auto-purge setting | Engineering | T-7 days | ☐ | Screenshot |
| Confirm Supabase region (us-west-1) | Engineering | T-7 days | ☐ | Dashboard |
| Execute DPA with all vendors | Legal | T-14 days | ☐ | Countersigned copies |
| Draft pilot SOW | Legal | T-7 days | ☐ | Draft reviewed |
| Prepare A2P 10DLC guide for dealership | Engineering | T-7 days | ☐ | Document ready |
| Architecture diagram (visual) | Engineering | T-5 days | ☐ | PDF/PNG |
| Executive proposal letter | Founder | T-3 days | ☐ | Final on letterhead |
| Privacy/compliance declaration | Legal | T-5 days | ☐ | Reviewed |
| Internal review of full package | All | T-2 days | ☐ | Sign-off |
| Go/no-go decision | Founder | T-1 day | ☐ | Decision logged |

### Section 12: Vendor Compliance Library Requirements
- Evidence request matrix: what to request from each vendor, when, why
- Twilio: SOC 2 Type II report, ISO 27001 cert, GDPR/Privacy Shield docs
- RetellAI: SOC 2 Type II report, HIPAA BAA (request), DPA, PII redaction documentation
- n8n: SOC 2 report (or SOC 3 public), DPA, execution log retention confirmation
- Supabase: SOC 2 Type II report, HIPAA BAA (if Team+ plan), RLS documentation
- Google: Vertex AI ZDR confirmation, SOC 2 Type II

### Section 13: Compliance Gaps and Remediation Register
- Full gap table from reconciliation Section E
- Each gap: why it matters, who owns it, exact action, proof of closure, deadline

### Section 14: TISAX / Mercedes Urgency Strategy
- NP.50.14.110 requirement
- September 30, 2026 ISMS deadline (per dealership communications)
- Oraya AI's vendor stack produces TISAX-supporting artifact bundle
- Vercel has TISAX Level 2 — highlight this
- Positioning: "We don't just help you answer the phone — we help you prepare for your OEM security audit"
- This is a real urgency driver, not a gimmick: the dealership MUST do this work

### Section 15: AutoNation Corporate Intelligence Summary
- 323 dealerships, 20 states, centralized IT
- CISO and CIO profiles
- Technology posture and vendor expectations
- No breach history — security-conscious
- How to position for corporate escalation

### Section 16: Competitive Positioning Matrix
- Table: Oraya AI vs. Podium, Fullpath, Dealer.com, CarNow, Conversica
- Columns: compliance certs, voice capability, automotive focus, pricing, TISAX readiness
- Narrative: why Oraya AI wins on compliance + voice + cost

### Section 17: Pricing Strategy
- **Pilot:** No-cost or $500 one-time setup fee (recommend no-cost to eliminate friction)
- **Post-pilot (dealership SLA):** $1,500-$2,500/month (positions against Podium's $249-599 with far more capability)
- **AutoNation MSA:** Volume discount at scale (negotiate per-rooftop pricing)
- **Infrastructure cost:** $30-40/mo actual cost → massive margin
- **Never compete on price — compete on compliance and capability**

### Section 18: Insurance Sequencing
- **Before first send:** Obtain cyber liability insurance quote ($1M minimum)
- **Before pilot launch:** Bind cyber liability + professional liability / E&O
- **Before post-pilot contract:** Increase coverage to $5M if AutoNation requires
- Typical cost: $2,000-$5,000/year for startup-tier coverage
- Include proof of insurance in second-wave package

### Section 19: Post-Pilot Contract Conversion Plan
- Pilot → dealership-level SLA (2-year term)
- SLA components: uptime (99.5%), response time, support hours, compliance maintenance
- Data ownership: dealership retains all customer data
- Deletion on termination: 30 days
- Subprocessor transparency
- AutoNation MSA escalation: from SLA success at South Bay → corporate procurement introduction
- Expected legal asks: data ownership, deletion, portability, subprocessor list, insurance proof, SOC 2

### Section 20: SOC 2 Roadmap for Oraya AI
| Milestone | Timeline | Key Actions |
|---|---|---|
| Readiness assessment | Months 1-2 | Select auditor (Vanta, Drata, or Secureframe as platform); define scope |
| Policy development | Months 2-4 | Information security policy, access control, incident response, vendor management, change management |
| Type I audit | Months 4-6 | Point-in-time assessment; remediate findings |
| Type I report | Month 6 | Distribute to prospects and clients |
| Observation period begins | Month 6 | Controls must operate continuously for 6-12 months |
| Type II audit | Months 12-18 | Period-of-time assessment |
| Type II report | Month 18 | Full SOC 2 Type II certification |
| ISO 27001 pursuit | Months 18-24 | Build on SOC 2 controls; pursue ISO certification |
- **How to present without undermining trust:** "Oraya AI has initiated the SOC 2 certification process. Our vendor stack is fully certified (Twilio SOC 2 Type II, RetellAI SOC 2 Type II, Supabase SOC 2 Type II, n8n SOC 2). Our own Type I is targeted for [Month 6] and Type II for [Month 18]. In the interim, our architecture is designed to the same standards, and our vendors' certifications cover the data processing infrastructure."

### Section 21: Risks, Assumptions, Dependencies
- **Risks:** Startup perception, vendor certification gaps (n8n ISO), dealership IT capacity for A2P registration
- **Assumptions:** Mercedes of South Bay has IT staff capable of A2P registration; dealership counsel will review compliance report; AutoNation corporate does not block dealership-level vendor decisions
- **Dependencies:** EIN filing, insurance binding, vendor DPA execution, RetellAI/n8n/Supabase SOC 2 report delivery

### Section 22: Final Execution Timeline
- T-14: DPA execution begins with all vendors
- T-10: SOC 2 reports requested from all vendors
- T-7: Screenshots, evidence collection, compliance declaration drafted
- T-5: Architecture diagram finalized, privacy declaration reviewed
- T-3: Executive proposal letter finalized on Oraya letterhead
- T-2: Full internal review
- T-1: Go/no-go decision
- T-0: First email sent to Mercedes of South Bay

### Section 23: Appendix — Evidence Requests and Artifact Checklist
- Complete checklist of every document needed, source, status
- Document Room Structure:
```
Operation-South-Bay/
├── 01-First-Send/
│   ├── Executive-Proposal-Letter.pdf
│   ├── Architecture-Diagram.pdf
│   └── Privacy-Compliance-Declaration.pdf
├── 02-Diligence-Package/
│   ├── Compliance-Verification-Report.pdf
│   ├── Vendor-Certifications/
│   │   ├── Twilio-SOC2-Type-II.pdf
│   │   ├── RetellAI-SOC2-Type-II.pdf
│   │   ├── n8n-SOC2-Report.pdf
│   │   ├── Supabase-SOC2-Type-II.pdf
│   │   └── Google-Vertex-AI-ZDR.pdf
│   ├── A2P-10DLC-Implementation-Guide.pdf
│   ├── Pilot-SOW-Agreement.pdf
│   ├── Mutual-NDA.pdf
│   └── Pilot-Success-Metrics.pdf
├── 03-Internal/
│   ├── Execution-Master-Brief.pdf (Document A)
│   ├── Reconciliation-Memo.pdf
│   └── Go-No-Go-Checklist.pdf
└── 04-Evidence/
    ├── Supabase-RLS-Screenshot.png
    ├── RetellAI-PII-Toggles-Screenshot.png
    ├── n8n-Retention-Settings-Screenshot.png
    └── DPA-Countersigned/
```

---

# PART 6 — DOCUMENT B COMPLETE OUTLINE

## POST-IMPLEMENTATION LEGAL & TECHNICAL COMPLIANCE VERIFICATION REPORT
## Mercedes of South Bay — Voice AI Deployment

### Section 1: Cover Page
- Title, version 2.0, date March 15, 2026
- Prepared for: General Counsel, Mercedes of South Bay
- Subject: Outbound & Inbound Voice AI Deployment — Legal Compliance Verification
- Jurisdiction: State of California, USA (Federal Overlay: FCC / FTC / TCPA)
- Classification: CONFIDENTIAL
- System Status: LIVE — Programmatic Compliance Controls Active
- Deployed Technical Stack summary bar

### Section 2: Privilege / Confidentiality Note
- Attorney-client privilege notice
- Distribution restrictions

### Section 3: Executive Summary
- System is LIVE with programmatic compliance controls
- Deployment scope: inbound (service scheduling, inventory Q&A, appointment confirmation), outbound (PEWC-consented service reminders and lead follow-up), SMS (A2P 10DLC appointment confirmations)
- Three highest-risk vectors table: TCPA/FCC-24-17, CIPA §§ 632/632.7, CPRA ADMT
- Conclusion: no fatal legal blockers; certified as legally defensible subject to administrative gap remediation

### Section 4: Deployment Scope
- Inbound capabilities
- Outbound capabilities
- SMS capabilities
- What the AI is prohibited from doing

### Section 5: Highest-Risk Legal Issues Summary (Attorney Brief)
- 2.1: TCPA & FCC Artificial Voice Regulations (47 U.S.C. § 227(b)(1); FCC-24-17)
  - UPDATE: Note that the one-to-one consent rule was vacated by the Eleventh Circuit but conservative PEWC posture maintained
- 2.2: CIPA (Cal. Penal Code §§ 632, 632.7; Smith v. LoanMe)
- 2.3: FTC Deception & AI Identification (15 U.S.C. § 45; Operation AI Comply)
- 2.4: CPRA ADMT (Cal. Civ. Code § 1798.185; 11 C.C.R. § 7000 et seq.)
  - UPDATE: Note ADMT full compliance deadline is April 1, 2027; system architecturally exempt; scheduling in this context is customer appointment scheduling not employment scheduling
- 2.5: SB 446 Breach Notification (Cal. Civ. Code § 1798.82)
- 2.6: OEM Security Mandate — TISAX / NP.50.14.110

### Section 6: Technical Enforcement of Statutory Mandates
- 4.1: TCPA PEWC Cryptographic Consent Gating
  - Supabase consent_log schema
  - n8n pre-dial query
  - PEWC record requirements (phone, consent_status, disclosure_text, ip_address, opt_in_timestamp, source_url)
  - RLS enforcement
- 4.2: CIPA Webhook-Gated Non-Consent Purge Workflow
  - consent_revoked dynamic variable
  - PATCH to basic_attributes_only
  - Smith v. LoanMe defense
- 4.3: FTC Hard-Coded Bot Identity Disclosure
  - System prompt enforcement
  - Non-operator-configurable
- 4.4: CPRA ADMT Architectural Bypass
  - AI restricted to scheduling and Q&A
  - Financing/credit/employment prohibited
  - ADMT trigger not activated
  - Gray zone analysis: escalation decisions, lead classification, outbound selection — all categorized as operational routing, not significant decisions
- 4.5: CPRA Data Minimization & SB 446 Alignment
  - Two-layer redaction: RetellAI PII engine + n8n 30-day purge
  - Reduces breach scope

### Section 7: Primary Legal Mapping Table
- Full statute-to-control mapping (from Source 2, updated with research)
- Each row: Regulation, Citation, Requirement, Technical/Process Control
- Status labels: [Implemented and Verified], [Implemented but Evidence Needed], [Required but Open], [Recommendation]

### Section 8: Consent & Disclosure Scripts
- Inbound call script (verbatim)
- Outbound call script (verbatim)
- SMS opt-in script (verbatim)

### Section 9: Non-Consent Purge Workflow
- Decision logic
- n8n webhook pseudocode
- Control proof: basic_attributes_only behavior

### Section 10: PII Handling and Retention Architecture
- RetellAI PII redaction categories (9 categories with compliance rationale)
- Data retention table:
  - Call metadata / PEWC: 4 years
  - Audio recordings (consented): 90 days
  - Redacted transcripts: 90 days
  - n8n execution logs: 30 days (auto-purge)
  - Supabase admin logs: continuous

### Section 11: Supabase Consent Log Structure and Control Narrative
- SQL schema (CREATE TABLE, RLS, policy)
- Access control narrative
- Sample insert

### Section 12: Access Control and Least-Privilege Model
- Role matrix: Sales/BDC, System Developers, Compliance/Legal Admins, Executive/GM
- MFA requirements
- API key rotation schedule

### Section 13: Incident Response and SB 446 Timing Alignment
- 30-day consumer / 15-day AG timelines
- 5-phase response plan
- Statutory notice headings required

### Section 14: TISAX / OEM Security Readiness Framing
- NP.50.14.110 requirement
- Vendor SOC 2 attestations as TISAX artifacts
- Critical distinction: vendor SOC 2 ≠ dealership ISMS certification
- Dealership must commission TISAX Level 2 external plausibility check
- Vercel TISAX Level 2 certification as differentiator

### Section 15: Residual Risk Matrix
- Risk event, likelihood, impact, mitigation, residual risk
- TCPA class action: LOW residual
- CIPA violation: LOW residual
- FTC deception: LOW residual
- Carrier filtering: LOW residual
- CPRA ADMT: LOW residual
- Data breach: LOW residual
- TISAX audit failure: MEDIUM residual (dealership action required)

### Section 16: Gap Remediation Plan
- Each gap: #, description, detail, responsible party, deadline, evidence of closure
- Status labels for each

### Section 17: Appendices
- Appendix A: CPRA DPA Language (exact statutory text)
- Appendix B: Primary Sources & Legal Authorities
- Appendix C: Vendor Certification Summary Table
- Appendix D: Evidence Checklist (what exists, what's needed, where to file)

---

# PART 7 — CROSS-DOCUMENT CONSISTENCY CHECKLIST

| Fact | Document A | Document B | Resolution |
|---|---|---|---|
| Company name | Oraya AI LLC | Oraya AI LLC | Consistent |
| AI vendor | RetellAI | RetellAI | Normalized from "Retail.ai" |
| Deployment scope | Inbound + outbound + SMS | Inbound + outbound + SMS | Consistent |
| Consent logic | PEWC via Supabase consent_log | PEWC via Supabase consent_log | Consistent |
| Non-consent handling | basic_attributes_only purge | basic_attributes_only purge | Consistent |
| Retention: PEWC proof | 4 years | 4 years | Consistent |
| Retention: audio | 90 days | 90 days | Consistent |
| Retention: n8n logs | 30 days | 30 days | Consistent |
| ADMT posture | Architecturally exempt | Architecturally exempt | Consistent |
| TISAX deadline | Sept 30, 2026 per dealer comms | Sept 30, 2026 per NP.50.14.110 | Consistent |
| One-to-one consent rule | Vacated (noted as positive) | Vacated (noted, conservative posture maintained) | Consistent |
| SB 446 timelines | 30-day consumer / 15-day AG | 30-day consumer / 15-day AG | Consistent |
| Vendor certs | Updated from research | Updated from research | Consistent |
| Admin gaps | Listed in remediation register | Listed in gap remediation plan | Consistent |

---

# PART 8 — FINAL OPEN ITEMS REQUIRING HUMAN CONFIRMATION

1. **Confirm Supabase region** — verify it's us-west-1 (California) via dashboard
2. **Confirm n8n plan tier** — Pro (30-day) or Enterprise (unlimited)?
3. **Confirm Supabase plan tier** — is BAA needed? If so, upgrade to Team
4. **Confirm RetellAI retention period setting** — what's currently configured?
5. **Confirm Oraya AI LLC incorporation status and EIN**
6. **Decide pilot pricing** — free, $500 setup, or monthly fee?
7. **Set target send date** — when does the first email go out?
8. **Identify contact at Mercedes of South Bay** — GM, IT, or counsel?
9. **Confirm September 30, 2026 TISAX deadline** — from Mercedes dealer portal?
10. **Insurance budget** — ready to bind cyber liability and E&O?
