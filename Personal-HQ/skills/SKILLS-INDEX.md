# Skills Index — Master Registry
**Last Updated:** March 15, 2026
**Total Skills:** 13 domains | 86 N8N workflows | Production-accurate specs

---

## Quick Lookup

| Task | Skill Folder |
|---|---|
| Build/import/debug Retell voice agent | `retell-voice-agent/` |
| Configure flows, nodes, transfers in Retell dashboard | `retell-browser-control/` |
| Design or build any N8N workflow | `n8n-workflows/` ← READ THIS FIRST |
| Deploy voice agent to production | `voice-agent-deployment/` |
| Insurance lead gen (Oraya P2) | `insurance-lead-gen/` |
| Audit Retell flow with CTO analysis | `retell-cto-copilot/` |
| HanFlux AI products/pricing/proposals | `hanflux-ai/` |
| Campus Experience Platform | `campus-platform/` |
| Fraud detection / Fraudopedia | `fraud-detection/` |
| Social media, email, content automation | `content-automation/` |
| RAG pipelines, SEC data, gov data | `data-processing/` |
| **Review, draft, or negotiate ANY legal document** | `legal-review-skill/` ← ALWAYS CHECK FOR LEGAL TASKS |
| Build/package/test a Claude .skill file | `skill-maker/` |

---

## Skill Summaries

### n8n-workflows/ ← MOST USED
Production-accurate N8N patterns. Has REAL Retell payload paths, actual credential IDs, Supabase table names from production workflows. 86-workflow library catalog. Always read before building any workflow.

### retell-voice-agent/
10-node architecture, 2-step API import (dashboard import DOESN'T work), TCPA checklist, post-call variable schema, voice config.

### retell-browser-control/ ← NEW (March 2026)
CTO-level Retell platform reference. 10 node types, Flex vs Rigid mode, global prompt architecture, 2-attempt transfer protocol (Cold/Warm/Agentic Warm), dynamic variables, system variables, testing workflow, production deployment checklist, DO/DON'T patterns, troubleshooting table, Retell API integration. Source: 40-page master training doc.

### voice-agent-deployment/
5-step deployment process, 4-phase staged rollout, full test suite (unit/integration/compliance/adversarial), KPI monitoring.

### insurance-lead-gen/
Oraya P2: 4 verticals, 48-node classification workflow, TCPA email-first strategy, $40/lead + 140% commission model.

### retell-cto-copilot/
Gemini 3 Pro master prompt, Google AI Studio setup, 11 required output sections, QA acceptance criteria.

### hanflux-ai/
4 products, India + international pricing, revenue share model (15%), tech stack, industry verticals.

### campus-platform/
3 pricing tiers ($299-$9,999/yr), 11 à la carte modules, full microservices architecture, 1,904-line spec.

### fraud-detection/
8-factor weighted scoring (variable points), verified thresholds: LOW 0-39, MEDIUM 40-69, HIGH 70-99, CRITICAL 100+. Fraudopedia BOT (RAG), AAER/SEC adaptations. GPT-4o-mini via LangChain.

### legal-review-skill/ ← USE FOR ALL LEGAL TASKS
Elite-level legal document review, drafting, scrutiny, and negotiation advisory. Senior partner standard across Indian law (AZB, Khaitan, SAM) and international (Linklaters, Clifford Chance, Skadden). Covers India + California jurisdictions. 4-layer analysis: structural audit → clause-by-clause risk scan → hidden trap detection → adversarial interpretation. Outputs: plain English summary, balance assessment, red lines, negotiable items, missing clauses, risk score (0-100). Full drafting mode produces complete executable documents, not templates. Has jurisdiction-specific reference files for India and California. **Trigger on**: any contract, MOU, agreement, term sheet, NDA, lease, license, shareholder agreement, employment contract, or ANY "review this" / "draft this" / "is this safe to sign" request.

**Oraya Company Letterhead:** `projects/oraya-labs/assets/Oraya Letter Head V1.pdf` — use this whenever drafting an official Oraya Labs letter, notice, or formal document. When user says "letterhead", this file is the reference.

### skill-maker/
Full lifecycle for building Claude skills: intent capture → interview → SKILL.md draft → test cases → eval → iterate → package as .skill ZIP. Includes references/schema.md and references/advanced-patterns.md.

### content-automation/
Social media auto-poster (X/LinkedIn/Instagram), 3 content generator versions, Canva+Gmail integration.

### data-processing/
Supabase RAG setup (pgvector), government DATA CLEANER, AAER 8-workflow SEC suite.

---

## N8N Workflow Library — Key Files (Downloads/Code & Data/)

| Workflow | Nodes | Use For |
|---|---|---|
| Copy Outbound Post Call.json | 17 | **PRODUCTION STANDARD** — appointment+callback post-call handler |
| Inbound Og Post Call.json | ~17 | Inbound call variant |
| Call storage retell (2).json | 40-44 | Advanced: transcript analysis, multi-stage reminders |
| Call storage retell (3).json | 40-44 | Latest version |
| Insurance_Lead_Main.json | 48 | Lead classification → 4 insurance verticals |
| Hanflux Legal v3 | 58 | Multi-LLM legal document generation |
| Supabase_RAG_AI_Agent.json | 21 | RAG pipeline with pgvector |
| DATA_CLEANER.json | 4 | Government data normalization |
| Social_Media_Auto_Poster.json | — | X + LinkedIn + Instagram |
| AAER_Engine*.json | 8 files | SEC enforcement report analysis |
