---
name: skill-maker
description: >
  Use this skill to design, draft, test, and refine Claude skills (.skill files / SKILL.md packages).
  Trigger whenever a user wants to: build a new Claude skill from scratch, convert a workflow or
  prompt into a reusable skill, improve or extend an existing skill, generate test cases for a skill,
  or understand how the Claude skill system works. Also trigger when the user says things like
  "make this a skill", "turn this into a skill", "I want to package this workflow", "write a SKILL.md",
  or "how do I build a custom skill". This skill covers the full lifecycle: intent capture →
  interview → draft → test → iterate → package.
---

# Skill Maker

A structured, professional guide for creating high-quality Claude skills — from first idea to
packaged `.skill` file ready for installation.

---

## What Is a Skill?

A **Claude skill** is a bundled set of instructions that extends Claude's behaviour for a specific
domain or workflow. It consists of:

```
skill-name/
├── SKILL.md          ← required: YAML frontmatter + markdown instructions
├── references/       ← optional: docs loaded on demand
├── scripts/          ← optional: executable helpers
└── assets/           ← optional: templates, fonts, images
```

Skills load progressively:
- **Metadata** (name + description) — always in context; Claude uses this to decide when to trigger the skill
- **SKILL.md body** — loaded on trigger; keep under 500 lines
- **Bundled resources** — loaded only when referenced; can be large

---

## Phase 1 — Capture Intent

### Extract from context first
If the conversation already contains a workflow (tools used, step sequence, corrections made,
input/output examples), extract answers from that history before asking the user anything. Confirm
the extracted answers before moving on.

### Then clarify four things
1. **Capability** — What should this skill enable Claude to do that it cannot do well today?
2. **Trigger contexts** — What phrases or situations should cause Claude to use this skill?
3. **Output format** — What does a good output look like? File? Structured text? Interactive?
4. **Test strategy** — Does the output have objectively verifiable properties (→ write assertions)
   or is quality subjective (→ focus on human review)?

> **Tip:** For objectively verifiable outputs (file transforms, code generation, data extraction,
> fixed workflow steps) — plan for assertions. For subjective outputs (writing style, UI aesthetics,
> strategic advice) — plan for qualitative human review.

---

## Phase 2 — Interview & Research

Before writing a single line of the skill, gather:

| Question | Why it matters |
|---|---|
| Sample input files / prompts | Grounds the skill in real data |
| Edge cases the skill must handle | Prevents brittle instructions |
| Success criteria ("done when…") | Guides assertion writing |
| Dependencies (tools, APIs, libraries) | Surfaces compatibility issues |
| Related skills or prior art | Avoids duplication |

Research in parallel if MCPs or web search are available. Come prepared — reduce burden on the user.

---

## Phase 3 — Write the SKILL.md

### Frontmatter (required)
```yaml
---
name: your-skill-name          # kebab-case identifier
description: >
  One paragraph. Cover WHAT the skill does AND WHEN to use it.
  Be specific about trigger phrases. Err on the side of being "pushy"
  — Claude tends to undertrigger, so make the description forward-leaning.
  E.g.: "Use this skill whenever the user mentions X, Y, or Z, even if
  they don't explicitly ask for it."
compatibility:                 # optional
  tools: [bash_tool, create_file, present_files]
---
```

### Body checklist
- [ ] Start with a one-sentence purpose statement
- [ ] List prerequisites / assumptions upfront
- [ ] Use imperative voice (`Read the file`, not `You should read the file`)
- [ ] Explain *why* rules exist — theory of mind beats heavy-handed `MUST`s
- [ ] Define all output formats explicitly (use exact templates where relevant)
- [ ] Include 1–2 worked examples for non-obvious transformations
- [ ] Keep under 500 lines; if longer, split into `references/` files with clear pointers

### Output format pattern
```markdown
## Output structure
ALWAYS use this exact template:

# [Document Title]
## Executive Summary
## Key Findings
## Recommendations
```

### Example pattern
```markdown
## Example
**Input:** "Summarise the attached contract"
**Output:** A 3-paragraph executive summary followed by a risk table.
```

### Writing style
- Imperative and direct
- Explain *why*, not just *what*
- Generalise beyond narrow examples
- After drafting, read with fresh eyes — cut anything obvious or redundant

---

## Phase 4 — Draft Test Cases

Propose 2–3 realistic test prompts. Share them with the user for approval before running.

Save to `evals/evals.json`:
```json
{
  "skill_name": "your-skill-name",
  "evals": [
    {
      "id": 1,
      "prompt": "Exact user prompt that should trigger the skill",
      "expected_output": "Plain-language description of correct result",
      "files": []
    }
  ]
}
```

> Test prompts should be **substantive** — simple one-liners like "read this file" won't trigger
> skills because Claude handles them directly. Good test prompts require multi-step reasoning or
> domain expertise.

---

## Phase 5 — Run & Evaluate (Claude.ai)

Because Claude.ai doesn't support subagents, follow this adapted sequence:

1. **Read the SKILL.md** you just wrote
2. **Execute each test prompt yourself**, following the skill's instructions exactly
3. **Save outputs** to the filesystem (e.g. `/home/claude/skill-maker-workspace/iteration-1/eval-N/`)
4. **Present outputs** to the user via `present_files` (for files) or inline (for text)
5. **Ask for feedback:** "How does this look? What would you change?"

Skip quantitative benchmarking and baseline comparisons — focus on qualitative human review.

### Assertions (for objectively verifiable skills)
Draft these while outputs are being generated. Good assertions are:
- Objectively verifiable (not "looks good")
- Descriptively named (readable in a benchmark table)
- Specific (e.g., "Output DOCX contains exactly 3 section headings" not "Output is correct")

Add assertions to `evals/evals.json` under the `assertions` field once drafted.

---

## Phase 6 — Iterate

After user review:

1. Note every piece of feedback — categorise as:
   - **Instruction gap** (the skill didn't say to do X)
   - **Priority conflict** (the skill said both X and Y; X won when Y should have)
   - **Edge case** (a situation the skill didn't anticipate)
2. Revise the relevant section(s) of SKILL.md
3. Re-run the affected test cases
4. Repeat until the user is satisfied

> Don't rewrite the whole skill for a single feedback item. Make targeted edits.

---

## Phase 7 — Package & Deliver

Once the skill is approved, package it as a `.skill` file:

```bash
python -m scripts.package_skill /path/to/skill-folder
```

Then present the `.skill` file to the user via `present_files`.

If the packaging script is unavailable (e.g. in Claude.ai without bash access), create a ZIP
manually:
```bash
cd /home/claude
zip -r skill-name.skill skill-name/
cp skill-name.skill /mnt/user-data/outputs/
```

> **Note on updating existing skills:** Preserve the original `name` field and directory name
> exactly. Copy to a writable location before editing. Output the same filename (not `-v2`).

---

## Quick Reference — Skill Quality Checklist

| Check | Pass condition |
|---|---|
| Description triggers correctly | Includes specific trigger phrases; leans forward |
| Instructions are imperative | Uses "Do X", not "You should X" |
| Whys are explained | Rules reference motivation, not just mandate |
| Output format is explicit | Template or example provided for all outputs |
| Skill is under 500 lines | Long sections moved to `references/` |
| Edge cases addressed | At least 2 non-obvious cases handled |
| Test cases are substantive | Multi-step, would benefit from skill guidance |
| Packaging complete | `.skill` file delivered to user |

---

## Reference Files

- `references/schema.md` — JSON schemas for evals.json, grading.json, benchmark.json
- `references/advanced-patterns.md` — Multi-domain skills, conditional loading, MCP integration

Read these files only when the relevant situation arises — don't load them upfront.
