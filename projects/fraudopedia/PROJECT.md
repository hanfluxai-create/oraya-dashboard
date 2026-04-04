# Fraudopedia - Project Context
**Last Updated:** March 28, 2026
**Owner:** Chitraksh Mayank
**Status:** Built (Workflow Exists)

---

## Overview
AI fraud detection system with multi-factor scoring and RAG extension.

## Scoring System
- 8-factor weighted scoring (variable points)
- Scale: 0 to 140
- Thresholds: LOW 0-39 | MEDIUM 40-69 | HIGH 70-99 | CRITICAL 100+

## Components
1. **Fraudopedia Agentic AI** : Main detection workflow (v1 + v2)
2. **Fraudopedia BOT** : RAG-based investigation assistant
3. **AAER/SEC Adaptations** : Securities enforcement report analysis

## Tech
- GPT-4o-mini via LangChain
- N8N workflows for orchestration

## Key Files
- Downloads/Code & Data/Fraudopedia_Agentic_AI.json (v1+v2)
- Downloads/Code & Data/Fraudopedia_BOT.json

## Skill Reference
skills/fraud-detection/SKILL.md
