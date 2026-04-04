# Skill: Fraud Detection AI (Fraudopedia)
**Last Updated:** March 15, 2026
**Source:** Verified from Fraudopedia_Agentic_AI__Version_1__Ai_added_.json via N8N_WORKFLOW_EXTRACTION_REPORT.txt

## System
Email fraud scoring via 8 weighted factors (variable points). Trigger: Gmail polling every 1 minute. LLM: GPT-4o-mini via LangChain Agent.

## EXACT SCORING ALGORITHM (From Production Code)

| Factor | Points |
|---|---|
| Temporary email domains (disposable) | +30 |
| Suspicious subject keywords (each match) | +15 |
| Phishing body keywords (each match) | +20 |
| URL shorteners detected | +25 |
| Suspicious TLDs (.tk, .ml, .ga, .cf) | +20 |
| Malicious attachment extensions (.exe, .scr, .bat, .com, .pif) | +40 |
| Header spoofing (From/Reply-To mismatch) | +25 |
| Urgency/pressure phrases (each match) | +15 |

## RISK LEVEL THRESHOLDS (Exact)

| Score Range | Risk Level | Action |
|---|---|---|
| 0 – 39 | LOW | Pass through |
| 40 – 69 | MEDIUM | Flag for review |
| 70 – 99 | HIGH | Alert admin |
| 100+ | CRITICAL | Auto-quarantine |

## Pipeline (10 Nodes)
```
Gmail Trigger (1min)
  → Extract Email Data
  → Fraud Detection Analysis (Code node — runs scoring algorithm)
  → Risk Level Filter (IF node)
  → Auto Quarantine Check (CRITICAL path)
  → Low/Medium Risk Handler
  → AI Agent (GPT-4o-mini via LangChain)
      System: "You are a world class fraud detection software. Analyse the fraud detection analysis and categorise the fraud. If fraud or spam is detected in the incoming mail label it as safe, dangerous etc — be creative."
      Prompt: "={{ $json.fraudAnalysis.fraudScore }} {{ $json.fraudAnalysis.riskLevel }}"
  → Gmail Tool (labels/manages flagged emails)
```

## AI Agent System Message
```
"You are a world class fraud detection software, Analyse the fraud detection analysis and categorise the fraud and send mail fraud or spam is detected in the incoming mail label it as safe, dangerous etc be creative"
```

## RAG Extension (Fraudopedia BOT)
Vector embeddings of fraud case studies → Supabase pgvector → RAG Q&A on fraud patterns

## Adaptations
Securities fraud (AAER) | Insurance claim fraud | Identity fraud | Financial transaction fraud

## Source Files
- `Downloads/Code & Data/Fraudopedia_Agentic_AI__Version_1__Ai_added_.json` — 10 nodes (v1, AI added)
- `Downloads/Code & Data/Fraudopedia_BOT.json` — RAG variant
- `Downloads/N8N_WORKFLOW_EXTRACTION_REPORT.txt` — scoring algorithm extracted 2026-03-15
