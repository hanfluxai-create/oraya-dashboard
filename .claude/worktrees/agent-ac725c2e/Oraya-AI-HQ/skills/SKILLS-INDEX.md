# Skills Index
**Last Updated:** 2026-04-20 | **Scope:** Oraya HQ (single-HQ, Personal-HQ deleted)

---

## Quick Lookup

| Task | Skill Folder |
|---|---|
| Build/import/debug Retell voice agent | `retell-voice-agent/` |
| Configure flows, nodes, transfers in Retell dashboard | `retell-browser-control/` |
| Design or build any n8n workflow | `n8n-workflows/` ← READ FIRST |
| Deploy voice agent to production | `voice-agent-deployment/` |
| Insurance lead gen (Oraya P2) | `insurance-lead-gen/` |
| Audit Retell flow with CTO analysis | `retell-cto-copilot/` |
| Review, draft, negotiate ANY legal document | `legal-review-skill/` ← ALL legal tasks |
| Build/package/test a Claude .skill file | `skill-maker/` |

---

## Skill Summaries

### n8n-workflows/ (most used)
Production-accurate n8n patterns. Real Retell payload paths, actual credential IDs, Supabase table names from production workflows. 86-workflow library catalog. Read before building any workflow.

### retell-voice-agent/
10-node architecture, 2-step API import (dashboard import fails), TCPA checklist, post-call variable schema, voice config.

### retell-browser-control/
CTO-level Retell platform reference. 10 node types, Flex vs Rigid mode, global prompt architecture, 2-attempt transfer protocol (Cold/Warm/Agentic Warm), dynamic + system variables, testing workflow, production deployment checklist, DO/DON'T patterns, troubleshooting table, Retell API integration. Source: 40-page master training doc.

### voice-agent-deployment/
5-step deploy, 4-phase staged rollout, full test suite (unit/integration/compliance/adversarial), KPI monitoring.

### insurance-lead-gen/
Oraya P2: 4 verticals, 48-node classification workflow, TCPA email-first strategy, $40/lead + 140% commission model.

### retell-cto-copilot/
Gemini 3 Pro master prompt, Google AI Studio setup, 11 required output sections, QA acceptance criteria.

### legal-review-skill/ (ALL legal tasks)
Elite legal document review, drafting, negotiation. Senior partner standard (AZB, Khaitan, SAM; Linklaters, Clifford Chance, Skadden). India + California jurisdictions. 4-layer analysis: structural → clause-by-clause risk → hidden traps → adversarial. Outputs: plain English summary, balance assessment, red lines, negotiables, missing clauses, risk score (0-100). Full drafting mode produces executable docs, not templates. **Trigger on:** any contract, MOU, agreement, term sheet, NDA, lease, license, shareholder agreement, employment contract, or ANY "review this" / "draft this" / "is this safe to sign" request.

**Oraya letterhead:** `projects/oraya-labs/assets/Oraya Letter Head V1.pdf`. Use for all official Oraya letters, notices, formal docs.

### skill-maker/
Full lifecycle: intent capture → interview → SKILL.md draft → test cases → eval → iterate → package as .skill ZIP. Includes references/schema.md and references/advanced-patterns.md.

---

## n8n Workflow Library — Key Files

| Workflow | Nodes | Use |
|---|---|---|
| Copy Outbound Post Call.json | 17 | **Production standard** appointment+callback post-call |
| Inbound Og Post Call.json | ~17 | Inbound variant |
| Call storage retell (2).json | 40-44 | Advanced: transcript analysis, multi-stage reminders |
| Call storage retell (3).json | 40-44 | Latest version |
| Insurance_Lead_Main.json | 48 | Lead classification → 4 verticals |
| Hanflux Legal v3 | 58 | Multi-LLM legal doc generation |
| Supabase_RAG_AI_Agent.json | 21 | RAG pipeline with pgvector |
| DATA_CLEANER.json | 4 | Government data normalization |
| Social_Media_Auto_Poster.json | — | X + LinkedIn + Instagram |
| AAER_Engine*.json | 8 files | SEC enforcement analysis |
