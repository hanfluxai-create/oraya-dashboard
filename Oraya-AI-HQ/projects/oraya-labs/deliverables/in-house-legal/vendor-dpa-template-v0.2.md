# Vendor DPA Template · v0.2 · Apr 22, 2026

**Authored by:** CTO-Claude (in-house AI legal function)
**Review gate:** Chitraksh (law-student QA, CA + federal US + India common-law crossover)
**Purpose:** single reusable DPA shell Oraya sends to six critical vendors (Retell, n8n, Twilio, Supabase, GoHighLevel, Stripe). Variable fields listed per vendor in §12.
**Supersedes:** v0.1 scaffold (Apr 18). v0.2 is the fillable text.

**Standing rule:** Oraya is the Controller. Vendor is the Processor (except Stripe, which is also a Joint Controller for fraud screening as noted in §12-F).

---

## Data Processing Addendum

This Data Processing Addendum ("DPA") is entered into between **Oraya AI Inc., a Delaware C-Corporation with principal office at [ORAYA_ADDRESS] ("Controller")** and **[VENDOR_LEGAL_NAME], a [VENDOR_ENTITY_TYPE] with principal office at [VENDOR_ADDRESS] ("Processor")**, effective as of [EFFECTIVE_DATE] (the "Effective Date"), and forms part of the underlying services agreement between the parties dated [UNDERLYING_AGREEMENT_DATE] (the "Principal Agreement").

Where this DPA conflicts with the Principal Agreement, this DPA controls with respect to the subject matter of personal data processing.

### 1. Definitions

1.1. "Personal Data" has the meaning given in the California Consumer Privacy Act of 2018 as amended by the California Privacy Rights Act of 2020 (Cal. Civ. Code § 1798.140(v)(1)), and includes any equivalent concept under other applicable data protection law.

1.2. "Processing" means any operation performed on Personal Data, including collection, recording, organization, structuring, storage, adaptation, retrieval, consultation, use, disclosure, transmission, dissemination, restriction, erasure, or destruction.

1.3. "Applicable Data Protection Law" means all laws and regulations applicable to the Processing of Personal Data under this DPA, including without limitation the CCPA as amended by CPRA, the California SB 446 data breach notification statute (Cal. Civ. Code § 1798.82), and if applicable to the vendor's Processing: GDPR, the UK DPA 2018, and the Indian Digital Personal Data Protection Act 2023.

1.4. "Service Provider" and "Contractor" have the meanings given in Cal. Civ. Code § 1798.140(ag) and (j) respectively. Processor acknowledges its role as a Service Provider or Contractor under the CPRA with respect to all Personal Data processed under this DPA.

1.5. "Sub-processor" means any third party engaged by Processor to Process Personal Data on behalf of Controller.

1.6. "Security Incident" means any actual or reasonably suspected unauthorized access to, disclosure of, or loss of Personal Data, or any other breach of the security obligations in §6.

### 2. Subject matter, duration, nature, and purpose

2.1. **Subject matter:** The Processing of Personal Data as necessary for Processor to provide the services described in the Principal Agreement.

2.2. **Duration:** For the term of the Principal Agreement plus any post-termination period required to return or destroy Personal Data under §9.

2.3. **Nature and purpose of processing:** [NATURE_OF_PROCESSING] — see §12 for vendor-specific detail.

2.4. **Types of Personal Data processed:** [DATA_CATEGORIES] — see §12.

2.5. **Categories of data subjects:** prospective customers of Controller's end-customers, end-customers of Controller, Controller's personnel, and any individual whose information is routed through the services.

### 3. Controller obligations

3.1. Controller is responsible for the lawfulness of the collection of Personal Data it transmits to Processor, including obtaining all consents required by Applicable Data Protection Law (including without limitation TCPA-compliant telephony consent where the services involve outbound voice or SMS).

3.2. Controller shall provide Processor with Processing instructions via the Principal Agreement, the documentation, the configured API calls, and any written instructions Controller issues from time to time.

### 4. Processor obligations

4.1. Processor shall Process Personal Data only on documented instructions from Controller and only for the purposes stated in §2, except where Processor is required to Process by law, in which case Processor shall (unless legally prohibited) notify Controller before Processing.

4.2. Processor shall not:
  (a) Sell Personal Data as defined by Cal. Civ. Code § 1798.140(ad);
  (b) Share Personal Data for cross-context behavioral advertising as defined by Cal. Civ. Code § 1798.140(ah);
  (c) Retain, use, or disclose Personal Data outside the direct business relationship with Controller;
  (d) Combine Personal Data received from Controller with Personal Data from any other source, except as permitted by Cal. Civ. Code § 1798.140(ag)(1)(D).

4.3. Processor certifies that it understands the restrictions in §4.2 and will comply with them.

4.4. Processor shall ensure that personnel authorized to Process Personal Data are bound by confidentiality obligations or are under appropriate statutory obligations of confidentiality.

### 5. Sub-processors

5.1. Processor may engage Sub-processors to Process Personal Data, subject to: (a) Processor providing Controller with the list of current Sub-processors at [SUB_PROCESSOR_LIST_URL] and updating that list at least [SUB_PROCESSOR_NOTICE_DAYS] days before any material change; (b) Processor imposing contractual obligations on the Sub-processor that are no less protective than those in this DPA.

5.2. Controller may object to the addition of a new Sub-processor in writing within [SUB_PROCESSOR_OBJECTION_WINDOW] days of notice. If the parties cannot agree, Controller may terminate the Principal Agreement with respect to the affected services without penalty.

5.3. Processor remains liable to Controller for the acts and omissions of its Sub-processors.

### 6. Security measures

6.1. Processor shall implement and maintain appropriate technical and organizational measures to protect Personal Data against Security Incidents, at a minimum including:
  (a) Encryption in transit using TLS 1.2 or higher;
  (b) Encryption at rest for all stored Personal Data;
  (c) Access control with least-privilege principles and logged administrative access;
  (d) Multi-factor authentication for Processor personnel who can access Personal Data;
  (e) Security monitoring, intrusion detection, and regular vulnerability scanning;
  (f) A written information security program, reviewed at least annually.

6.2. Processor shall maintain the certifications or attestations listed in [SECURITY_CERTIFICATIONS] and shall provide Controller with a summary of any SOC 2 Type II report on reasonable request, at no cost, once per calendar year.

### 7. Security Incident notification

7.1. Processor shall notify Controller of any Security Incident without undue delay, and in any event within **seventy-two (72) hours** of becoming aware of the Security Incident, consistent with Cal. Civ. Code § 1798.82 and SB 446 (2025) cyber incident notification requirements.

7.2. The notification shall include, to the extent known: (a) the nature of the incident, (b) categories and approximate volume of Personal Data affected, (c) likely consequences, (d) measures taken or proposed to address the incident, and (e) a single point of contact for Controller follow-up.

7.3. Processor shall reasonably cooperate with Controller's investigation of any Security Incident and with Controller's compliance with its own incident notification obligations to affected individuals and regulators.

### 8. Data subject rights and regulator requests

8.1. Processor shall, taking into account the nature of the Processing, assist Controller by appropriate technical and organizational measures, insofar as possible, in fulfilling Controller's obligations to respond to data subject requests (right to know, right to delete, right to correct, right to portability, right to opt-out of sale or sharing).

8.2. Processor shall not respond directly to a data subject request regarding Controller's Personal Data. Processor shall forward the request to Controller within [DSR_FORWARD_DAYS] business days.

8.3. Processor shall notify Controller promptly if it receives a binding legal demand from a public authority to disclose Personal Data, unless prohibited by law from doing so.

### 9. Return or destruction

9.1. Upon termination of the Principal Agreement, and at Controller's election made within thirty (30) days of termination, Processor shall return or destroy all Personal Data, except to the extent retention is required by law.

9.2. Processor shall certify in writing that it has complied with this §9 within [RETURN_OR_DESTROY_DAYS] days of Controller's election.

### 10. Audit

10.1. Controller may, no more than once per calendar year (unless a Security Incident has occurred, in which case an additional audit is permitted), and on at least thirty (30) days written notice, audit Processor's compliance with this DPA. The audit may be conducted by Controller or a mutually acceptable independent auditor bound by confidentiality.

10.2. Controller shall bear its own audit costs unless the audit uncovers material non-compliance, in which case Processor bears the reasonable audit costs.

### 11. Cross-border transfers

11.1. Where Processor Processes Personal Data outside the United States, Processor shall ensure that the transfer is lawful under Applicable Data Protection Law, including by executing the applicable Standard Contractual Clauses, UK Addendum, or equivalent mechanism with Controller. Processor's default data residency is [DATA_RESIDENCY].

11.2. If Controller's Processing scales to include EU/UK data subjects, the parties shall execute the SCC addendum attached as Annex II.

### 12. Vendor-specific annex (variable fields)

The following table lists the per-vendor fills for the variable fields in §§1 through 11.

#### 12-A · Retell (voice platform)

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | Retell AI Inc. |
| VENDOR_ENTITY_TYPE | Delaware corporation |
| NATURE_OF_PROCESSING | Inbound and outbound telephony audio, real-time transcription, agent prompt execution, call analytics |
| DATA_CATEGORIES | Caller phone number, voice recording, transcript content, derived intent flags, call metadata |
| SUB_PROCESSOR_LIST_URL | retellai.com/sub-processors |
| SUB_PROCESSOR_NOTICE_DAYS | 14 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 10 |
| SECURITY_CERTIFICATIONS | SOC 2 Type II in progress; HIPAA BAA available on request |
| DSR_FORWARD_DAYS | 3 |
| RETURN_OR_DESTROY_DAYS | 30 |
| DATA_RESIDENCY | United States |
| Retention (recordings) | 90 days |
| Retention (transcripts) | 2 years |
| Special clauses | HiQ, Gemini, Claude listed as Sub-processors for LLM inference; per-node model allocation per Oraya's SOP is Controller configuration |

#### 12-B · Supabase (database)

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | Supabase Inc. |
| VENDOR_ENTITY_TYPE | Delaware corporation |
| NATURE_OF_PROCESSING | Storage and retrieval of inventory records, call event logs, lead qualification metadata, appointment records |
| DATA_CATEGORIES | Caller phone numbers, names, email addresses, appointment timestamps, inventory match logs |
| SUB_PROCESSOR_LIST_URL | supabase.com/legal/subprocessors |
| SUB_PROCESSOR_NOTICE_DAYS | 30 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 14 |
| SECURITY_CERTIFICATIONS | SOC 2 Type II, HIPAA BAA available on Enterprise |
| DSR_FORWARD_DAYS | 5 |
| RETURN_OR_DESTROY_DAYS | 30 |
| DATA_RESIDENCY | US East (us-east-1) primary |
| Backup retention | 7 days (point-in-time recovery) |
| Access control | Service-role key rotation quarterly; row-level security on `vehicles` and `appointment_log` tables |

#### 12-C · Twilio (messaging and telephony rail)

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | Twilio Inc. |
| VENDOR_ENTITY_TYPE | Delaware corporation |
| NATURE_OF_PROCESSING | SMS delivery, phone number provisioning, messaging service routing, delivery metadata |
| DATA_CATEGORIES | Caller phone numbers, message content, delivery receipts, A2P 10DLC registration metadata |
| SUB_PROCESSOR_LIST_URL | twilio.com/legal/sub-processors |
| SUB_PROCESSOR_NOTICE_DAYS | 30 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 10 |
| SECURITY_CERTIFICATIONS | SOC 2 Type II, ISO 27001, ISO 27018 |
| DSR_FORWARD_DAYS | 5 |
| RETURN_OR_DESTROY_DAYS | 30 |
| DATA_RESIDENCY | United States |
| Special clauses | A2P 10DLC brand and campaign registration retained on Twilio. Opt-in records retained 7 years per TCPA conservative floor. Do-not-call list integration active per §227(c) |

#### 12-D · n8n Cloud (orchestration)

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | n8n GmbH |
| VENDOR_ENTITY_TYPE | German limited liability company |
| NATURE_OF_PROCESSING | Workflow orchestration, webhook routing, credential storage, execution logging |
| DATA_CATEGORIES | Webhook payloads containing caller data, inventory data, lead qualification routing metadata, API credentials |
| SUB_PROCESSOR_LIST_URL | n8n.io/legal/sub-processors |
| SUB_PROCESSOR_NOTICE_DAYS | 30 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 14 |
| SECURITY_CERTIFICATIONS | ISO 27001, SOC 2 Type II in progress |
| DSR_FORWARD_DAYS | 5 |
| RETURN_OR_DESTROY_DAYS | 30 |
| DATA_RESIDENCY | EU (Frankfurt); data residency to be confirmed for `orayacorporation.app.n8n.cloud` instance |
| Special clauses | Execution log retention defaulted to 14 days; to be tightened to 7 days per Oraya operational policy. Credentials stored in n8n-native encrypted vault with no plaintext access. SCC addendum required given EU-hosted instance Processing US-origin data |

#### 12-E · GoHighLevel (CRM for P2 insurance lead gen)

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | HighLevel Inc. |
| VENDOR_ENTITY_TYPE | Texas corporation |
| NATURE_OF_PROCESSING | CRM contact storage, pipeline management, lead routing, agent-side notes, SMS + email sequence delivery |
| DATA_CATEGORIES | Qualified insurance leads (name, phone, email, zip, coverage preferences), CRM pipeline stage data, agent notes |
| SUB_PROCESSOR_LIST_URL | gohighlevel.com/sub-processors |
| SUB_PROCESSOR_NOTICE_DAYS | 30 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 10 |
| SECURITY_CERTIFICATIONS | SOC 2 Type II |
| DSR_FORWARD_DAYS | 5 |
| RETURN_OR_DESTROY_DAYS | 30 |
| DATA_RESIDENCY | United States |
| Special clauses | Per-agent seat licensing required (no shared logins). Export on termination: full data pull within 30 days of notice. HIPAA BAA NOT required (no PHI processed). Insurance-specific compliance remains the agent's obligation, not GHL's or Oraya's |

#### 12-F · Stripe (payment rail) · JOINT CONTROLLER for fraud screening

| Field | Value |
|---|---|
| VENDOR_LEGAL_NAME | Stripe Inc. |
| VENDOR_ENTITY_TYPE | Delaware corporation |
| NATURE_OF_PROCESSING | Payment authorization, settlement, fraud screening, payout routing, tax compliance |
| DATA_CATEGORIES | Payment method identifiers (tokenized), payout bank metadata, tax residency data (Oraya EIN 93-3462113), counterparty identifiers |
| SUB_PROCESSOR_LIST_URL | stripe.com/legal/sub-processors |
| SUB_PROCESSOR_NOTICE_DAYS | 30 |
| SUB_PROCESSOR_OBJECTION_WINDOW | 10 |
| SECURITY_CERTIFICATIONS | PCI DSS Level 1, SOC 1 Type II, SOC 2 Type II, ISO 27001 |
| DSR_FORWARD_DAYS | 5 |
| RETURN_OR_DESTROY_DAYS | 30 (excluding records Stripe is required to retain by law, e.g., tax and AML records) |
| DATA_RESIDENCY | United States |
| Special clauses | PCI scope: Oraya is SAQ-A; Stripe is in scope. Stripe acts as Joint Controller for fraud screening (Radar), as independent Controller for its own regulatory reporting (KYC, AML, tax). Payout-method changes require dual-approval (CTO + CEO) per Oraya internal control. Chase ••••6789 is the current payout account of record |

### 13. Governing law and jurisdiction

This DPA is governed by the laws of the State of California, without regard to its conflict-of-laws rules. The state and federal courts located in San Francisco County, California, have exclusive jurisdiction over any dispute arising from this DPA.

### 14. Liability

Each party's liability under this DPA is subject to the limitation of liability clause in the Principal Agreement. Notwithstanding the foregoing, the parties agree that:
  (a) nothing in this DPA limits a party's liability for gross negligence, willful misconduct, or fraud;
  (b) statutory indemnities and direct regulatory fines imposed on one party due to the other party's breach of this DPA are not subject to the liability cap.

### 15. Entire DPA

This DPA, together with the Principal Agreement and any schedules, constitutes the entire agreement between the parties with respect to the Processing of Personal Data and supersedes all prior agreements on the subject.

---

## Execution block

**Oraya AI Inc.**

By: __________________________
Name: Chitraksh Mayank
Title: Chief Technology Officer
Date: _________________________

By: __________________________
Name: Frank Moran
Title: Chief Executive Officer
Date: _________________________

**[VENDOR_LEGAL_NAME]**

By: __________________________
Name: _________________________
Title: _________________________
Date: _________________________

---

## Annex I · Data processing particulars

(Filled per vendor from §12.)

## Annex II · Standard Contractual Clauses (SCC) addendum

Attached when vendor Processes Personal Data outside the United States, applicable most immediately to 12-D (n8n, EU-hosted). Module Two (Controller to Processor) is the baseline; Module Three (Processor to Sub-processor) attaches if Processor engages non-EU Sub-processors.

---

## Review notes for Chitraksh

1. **CPRA § 1798.140(ag)(1)(D):** confirm the "combine data" carve-out language in §4.2(d) matches the statute; I used the statutory citation but please spot-check the phrasing against the latest regulatory guidance from CPPA.
2. **SB 446 (2025):** the 72-hour window in §7.1 aligns with SB 446's enhanced cyber incident notification standard. If any vendor pushes back to 96 hours or "without undue delay" only, flag it as a YELLOW deviation.
3. **Joint Controller language for Stripe (§12-F):** Stripe's public DPA already carries joint-controller language for fraud screening. Our addition is belt and suspenders; if Stripe insists on its own DPA, accept theirs and drop ours for that vendor only.
4. **n8n EU data residency (§12-D):** this is the most important SCC trigger. Confirm with the n8n Cloud admin console whether `orayacorporation.app.n8n.cloud` is EU or US hosted before signing. If US, we can drop Annex II entirely for n8n.
5. **Insurance-specific exclusions (§12-E):** the E&O rider language lives in a separate doc (template pack §10). GHL DPA does not carry insurance-producer scope language; verify before sending.
6. **India DPDP 2023 (§1.3):** added as a defined-law pointer because our founder is a non-resident Indian citizen and any routing of India-origin leads triggers DPDP 2023. None of the current six vendors route India-origin data; keep the pointer but no operational change today.

## What v0.3 adds

- Redlined version per each vendor's incoming DPA (Retell already accepted our SOC 2 + 72-hour clauses on the Apr 10 call; Twilio's push-back on audit frequency expected).
- Execution-ready PDFs generated from this markdown using the `pdf` skill.
- Signature routing via DocuSign or PandaDoc (decide after v0.3 finalises).

Target ship: v0.3 counterparty-ready by Apr 28, which is the day we need Retell signed before expanding Mercedes pilots.
