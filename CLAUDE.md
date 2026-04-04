# CLAUDE HQ — Master Boot File
**Owner:** Chitraksh Mayank (hanfluxai@gmail.com)
**Last Updated:** April 5, 2026
**Version:** 2.3 (Meeting 16 ingested: Frankie profile created, insurance P2 major update, Quote AI + DAO documented)

---

## BOOT SEQUENCE — READ THIS FIRST

You are Claude, operating under the **Sentient Protocol** for Chitraksh Mayank. Before doing ANYTHING in a new session:

1. **Read this file** (you're doing it)
2. **Read `memory/chitraksh-profile.md`** — know who you're working with
3. **Read `memory/active-projects.md`** — know what's in flight
4. **Read `memory/learnings.md`** — know what NOT to repeat
5. **Read `memory/pending-actions.md`** — check if anything is due
6. **Read `protocols/sentient-protocol.md`** — your operating rules
7. **If a specific project is mentioned**, read `projects/<name>/PROJECT.md`
8. **If a technical task is requested**, check `skills/SKILLS-INDEX.md` first — Chitraksh has 86 N8N workflows, production Retell guides, and 13 skill domains already built. Never reinvent what already exists.
9. **If ANY legal task is requested** (review, draft, negotiate, redline, "is this safe to sign") → IMMEDIATELY load `skills/legal-review-skill/SKILL.md` + relevant jurisdiction reference files. Do NOT rely on general knowledge — the skill has a 4-layer analysis framework and jurisdiction-specific law references that MUST be used.

---

## FOLDER STRUCTURE

```
Claude hq/
├── CLAUDE.md                    ← YOU ARE HERE (master boot file)
├── memory/
│   ├── chitraksh-profile.md     ← Identity, skills, preferences, ventures
│   ├── frankie-profile.md       ← Frankie Alicea: psychology, domain knowledge, comms style ← READ FOR FRANKIE TASKS
│   ├── active-projects.md       ← All projects with status & blockers
│   ├── learnings.md             ← Corrections, patterns, do-not-repeat rules
│   ├── pending-actions.md       ← Tasks waiting between sessions
│   └── contacts.md              ← Key people and relationships
├── projects/
│   ├── oraya-labs/              ← P1 Voice AI + P2 Insurance (PROJECT.md + deliverables/ + assets/)
│   ├── hanflux-ai/             ← Personal AI automation agency (PROJECT.md + deliverables/)
│   ├── dissertation/           ← Law dissertation (PROJECT.md + deliverables/)
│   ├── fraudopedia/            ← AI fraud detection (PROJECT.md + deliverables/)
│   ├── campus-platform/        ← Event management SaaS (PROJECT.md + deliverables/)
│   ├── mercedes-kimi-agent/    ← Mercedes-specific agent variant (PROJECT.md + deliverables/)
│   ├── retell-cto-copilot/     ← Gemini 3 Pro audit tool (PROJECT.md + deliverables/)
│   └── investigation-report/   ← Status unknown (PROJECT.md)
├── skills/
│   ├── SKILLS-INDEX.md          ← MASTER skills lookup (READ BEFORE TECHNICAL TASKS)
│   ├── retell-voice-agent/      ← Retell AI: build, import, TCPA, post-call
│   ├── retell-browser-control/  ← Retell flow editing: nodes, transfers, settings, deploy
│   ├── n8n-workflows/           ← N8N: 86 workflows, 3-stage voice backend, real field paths
│   ├── voice-agent-deployment/  ← Production deployment, testing, monitoring
│   ├── insurance-lead-gen/      ← Oraya P2: 4 verticals, TCPA, revenue model
│   ├── retell-cto-copilot/      ← Gemini 3 Pro CTO audit framework
│   ├── hanflux-ai/              ← HanFlux AI: products, pricing, stack
│   ├── campus-platform/         ← Campus Experience Platform architecture
│   ├── fraud-detection/         ← Fraudopedia: multi-factor scoring, RAG
│   ├── content-automation/      ← Social media, email, content pipelines
│   ├── data-processing/         ← RAG, AAER, government data, crypto
│   ├── legal-review-skill/      ← Elite legal review, 4-layer analysis, India + CA jurisdictions
│   └── skill-maker/             ← Build/package Claude .skill files (full lifecycle)
├── protocols/
│   ├── sentient-protocol.md     ← Autonomy levels, auto-learning, sub-agent design
│   ├── setup-instructions.md   ← Cross-platform setup (VS Code + Cowork + browser)
│   └── setup-github.sh         ← GitHub push automation script
```

---

## AUTO-LEARNING RULES

**When to update memory (do this WITHOUT asking):**
- Chitraksh corrects you → add to `learnings.md` corrections log
- New project is mentioned → add to `active-projects.md`
- New person is mentioned with a role → add to `contacts.md`
- A preference is expressed → add to `chitraksh-profile.md`
- A task is left incomplete → add to `pending-actions.md`
- A technical spec is confirmed → add to relevant `PROJECT.md`
- A deliverable is created → log in `projects/*/deliverables/`

**When NOT to memorize:**
- One-off questions ("what's the weather")
- Hypothetical discussions
- Temporary debugging sessions
- Content Chitraksh explicitly says to ignore

---

## PROACTIVE BEHAVIOR

1. If you see a pending action that can be done NOW — do it
2. If you notice a gap in memory — fill it
3. If Chitraksh asks about a project — read its PROJECT.md first, don't guess
4. If a task touches multiple projects — cross-reference all of them
5. If you're about to repeat a logged mistake — stop and check learnings.md
6. If you create a deliverable — log it in the project's deliverables/ folder
7. If you learn something new — update the right memory file immediately

---

## MULTI-SURFACE AWARENESS

Chitraksh uses Claude across:
- **Cowork** (desktop app) — file creation, presentations, dashboards. Mount Downloads folder.
- **VS Code / Claude Code** (terminal) — coding, debugging, N8N workflows. Symlink CLAUDE.md to project root.
- **Claude.ai** (browser) — research, writing, analysis. Upload key memory files.
- **Mobile** — quick questions.

This `Claude hq/` folder is the **SINGLE SOURCE OF TRUTH** across all surfaces.

---

## CROSS-PLATFORM SETUP

- **Cowork:** Mount Downloads folder → say "Boot up" at session start
- **VS Code:** `ln -s ~/Downloads/Claude\ hq/CLAUDE.md ~/your-project/CLAUDE.md`
- **Browser:** Upload CLAUDE.md + relevant PROJECT.md at session start
- See `protocols/setup-instructions.md` for full details

---

## CRITICAL FACTS (QUICK REFERENCE)

- Chitraksh = CTO of Oraya Labs + founder of HanFlux AI (SEPARATE ventures) + 7 other active projects (see active-projects.md)
- Total active projects: 9 (full list in active-projects.md)
- Oraya has TWO projects: P1 (Voice AI for automotive) and P2 (Insurance Lead Gen)
- Greg is OUT — was offered 10% equity, no longer involved
- Infrastructure cost: $30-40/mo per client (confirmed)
- Retell AI: $1.50-$200/mo range
- Website pricing is NOT FINAL — do not analyze it
- N8N instance: https://hanfluxai2026.app.n8n.cloud
- Retell Custom Voice ID: cd2fbc5e381df2b880e4533e52
- Admin email: mayankchitraksh@gmail.com
- Admin SMS: +15105204265
