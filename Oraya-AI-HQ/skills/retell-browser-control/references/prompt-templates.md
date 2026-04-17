# Retell AI — Prompt Engineering Reference
**Source:** Retell AI Browser Control Master Doc, Appendix C

---

## Effective Node Prompt Template

```
## Task
[One clear sentence: what this node accomplishes]

## Context
[Information agent needs to know]
- Company: {{company_name}}
- User: {{customer_name}}
- Current situation: [what happened before this node]

## Behavior Rules
1. [Specific instruction]
2. [Specific instruction]
3. [Specific instruction]

## Response Framework
- Keep responses under [X] sentences
- Use [tone descriptor] tone
- Always [required action]
- Never [forbidden action]

## Examples
Example 1:
User: [realistic user input]
Agent: [ideal agent response]

Example 2:
User: [realistic user input]
Agent: [ideal agent response]

## Edge Cases
- If user says [X], respond with [Y]
- If [condition], then [action]
```

---

## Global Prompt Template

```
## Objective
[One sentence: what this agent does and why it exists]

## Core Persona
[Personality traits, speaking style, authority level]

## Identity
- Company: {{company_name}}
- Role: [Agent's role title]
- Name: [Agent name if applicable]

## Guardrails
- Never discuss: [forbidden topics]
- Always verify: [required confirmations]
- Escalation triggers: [when to transfer to human]

## Response Framework
- Keep responses under 3 sentences unless asked for detail
- Use active voice and direct language
- Confirm understanding before proceeding to next step
```

---

## Persona Descriptor Language

| Persona Type | Descriptor Language |
|---|---|
| Professional | Polished, courteous, formal, respectful, articulate |
| Friendly | Warm, approachable, conversational, enthusiastic |
| Authoritative | Confident, direct, knowledgeable, commanding |
| Empathetic | Understanding, patient, supportive, compassionate |
| Sales-Focused | Persuasive, benefit-driven, solution-oriented, closing |

---

## Common Guardrail Patterns

```
## Guardrails
- Never discuss: competitor products, pricing not approved, legal advice
- Always verify: identity before sharing account details
- Escalate immediately if: user threatens legal action, mentions harm
- Stay on topic: do not engage with off-topic questions about politics, religion
- Privacy: never ask for SSN, credit card numbers — redirect to secure portal
```

---

## Prompt Compression Examples

| Verbose | Compressed |
|---|---|
| "You must always maintain a professional demeanor at all times" | "Be professional" |
| "Please make sure to confirm that you have understood what the customer has said before you proceed" | "Confirm understanding before proceeding" |
| "In the event that the customer requests to speak with a human agent, you should transfer them" | "Transfer if human requested" |
