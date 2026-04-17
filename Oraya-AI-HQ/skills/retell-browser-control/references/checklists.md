# Retell AI — Quick Reference Checklists
**Source:** Retell AI Browser Control Master Doc, Appendix A

---

## New Agent Creation Checklist
- [ ] Agent named clearly
- [ ] Execution mode set (Rigid recommended)
- [ ] Voice selected and tested
- [ ] Language configured
- [ ] Global prompt written (persona, identity, guardrails)
- [ ] LLM model selected
- [ ] Speech settings configured (responsiveness, interruption sensitivity)
- [ ] Call settings configured (max duration, silence timeout)
- [ ] PII redaction enabled (if handling sensitive data)
- [ ] Webhook configured (if integration needed)
- [ ] Default dynamic variables set
- [ ] Start node connected to begin conversation
- [ ] At least one end call node present
- [ ] Flow tested in simulation
- [ ] Voice tested with Test Agent
- [ ] Published to production

---

## Node Creation Checklist
- [ ] Node named with action + context
- [ ] Prompt written with structured sections (Task / Context / Behavior / Examples)
- [ ] Examples provided (2-3 for complex nodes)
- [ ] Model selected (override global if needed)
- [ ] Transitions defined with clear conditions
- [ ] Default/fallback transition included
- [ ] Dynamic variables used where appropriate
- [ ] No duplication of global prompt content
- [ ] Node tested in simulation

---

## Transfer Node Checklist
- [ ] Transfer type selected (cold/warm/agentic)
- [ ] Phone number configured (or dynamic variable)
- [ ] Dial timeout set (30-60 seconds)
- [ ] Human detection enabled
- [ ] Whisper message written (for agentic warm)
- [ ] Three-way message written (for warm/agentic)
- [ ] Caller ID configured
- [ ] Failure path connected
- [ ] Callback offer node ready
- [ ] Transfer tested with real phone call

---

## Pre-Publish Checklist
- [ ] All nodes connected (no orphans)
- [ ] All transfer nodes have failure paths
- [ ] All logic splits have default edges
- [ ] PII redaction enabled (if applicable)
- [ ] 5+ simulation scenarios tested
- [ ] 3+ voice test calls completed
- [ ] Transfer functionality verified
- [ ] Function calls tested (if applicable)
- [ ] Edge cases tested (interruptions, silence, invalid input)
- [ ] Compared draft vs published version
- [ ] Version notes documented
- [ ] Ready to monitor first 20 calls post-publish
