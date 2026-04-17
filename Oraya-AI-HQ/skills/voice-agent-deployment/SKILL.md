# Skill: Voice Agent Deployment (Production)
**Last Updated:** March 15, 2026

## 5-Step Deployment
1. Backup current JSON from Retell
2. Import via API (2-step process — see retell-voice-agent skill)
3. Configure webhook + voice + dynamic variable mappings
4. Run full test suite (unit → integration → compliance → adversarial)
5. Staged rollout: Phase 1 (internal, 1-2d) → Phase 2 (10%, 3-5d) → Phase 3 (50%, 1wk) → Phase 4 (100%)

## 10-Node Verification
Opening: TCPA disclosure, permission-first, 5 routing edges
Schedule: captures day/time/email, confirmation loop, spelling protocol for email
Transfer: correct number (+13103716100 Mercedes), cold transfer, fallback
Opt Out: immediate ack, zero further questions
Voicemail: brief, no sensitive info

## Global Prompt Checklist
- [ ] Identity + AI disclosure
- [ ] Recording notice
- [ ] One question per turn rule
- [ ] Opt-out triggers: "stop", "remove me", "don't call"
- [ ] Human escalation: anger, repeated requests
- [ ] Brand voice: warm, concierge, no pressure

## Test Suite
Unit: each node in isolation
Integration: full appointment booking, callback, wrong number, voicemail
Compliance: opt-out trigger, recording objection, transfer on anger, "already bought"
Adversarial: interruptions, long silence, confused response, angry customer
Regression: all post-call variables populate, N8N webhook works

## KPI Monitoring
Real-time: connect rate, engagement, transfer rate, opt-out (<3%)
Daily: volume, outcomes, sentiment, API health
Weekly: KPI review, 10 random call sample audit
Monthly: TCPA audit, DNC accuracy, performance benchmark

## Architecture Decisions (Mercedes Redesign)
Nodes: 21→10 | End nodes: 6→1 dynamic | Max duration: 598s→300s | Silence: 182s→120s

## Source Files
- Downloads/Kimi_Agent_Mercedes-Level Retell Voice Agent/implementation_guide.md
- Downloads/Kimi_Agent_Mercedes-Level Retell Voice Agent/PROJECT_SUMMARY.txt
