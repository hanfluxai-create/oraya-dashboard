# Skill: Retell CTO Copilot
**Last Updated:** March 15, 2026

## What It Is
Gemini 3 Pro master prompt for CTO-level Retell AI flow auditing. Produces source-backed, production-grade recommendations across 11 sections.

## Setup (Google AI Studio)
1. New app → Select Gemini 3 Pro
2. Paste contents of Downloads/Documents/GEMINI_3_PRO_MASTER_PROMPT.md as system prompt
3. Temperature: 0.2-0.5 | Enable file upload + URL retrieval
4. First run: ask for crawl coverage report → upload flow JSON → request "full CTO audit sections A-K"

## 5 Work Modes
A: Documentation Intelligence (crawl all Retell docs first)
B: Flow JSON Structural Analysis
C: CTO Recommendations + Patch Design
D: Simulation & Preview
E: UX Output Contract

## 11 Required Output Sections
A: Executive Summary | B: Crawl Coverage | C: Flow Structure | D: P0/P1/P2 Issues
E: Source-Backed Recommendations | F: Patch Designs (JSON diffs) | G: TCPA Compliance
H: Latency Analysis | I: Reliability Analysis | J: Simulation | K: Machine-Readable JSON

## 5 Non-Negotiable Rules
1. Crawl ALL docs before recommending (no hallucination)
2. Official sources only (docs.retellai.com)
3. No hallucinations — say "not found" if uncertain
4. Production-first — all advice assumes live traffic
5. Decision-grade outputs — CTO acts on these

## Output Storage Pattern
/retell-audit-YYYY-MM-DD/ → input_flow.json, audit_report.md, machine_readable.json, approved_patch.json

## Reject if:
Missing citations | Generic suggestions | No crawl coverage | Overly broad edits

## Source Files
- Downloads/Documents/GEMINI_3_PRO_MASTER_PROMPT.md (300+ lines)
- Downloads/Documents/GOOGLE_AI_STUDIO_SETUP_AND_QA.md
- Downloads/Documents/OFFICIAL_RETELL_DOC_LINKS.md
