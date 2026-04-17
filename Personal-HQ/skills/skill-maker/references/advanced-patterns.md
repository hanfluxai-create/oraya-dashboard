# Advanced Skill Patterns

## Multi-Domain Skills

When a skill must handle multiple frameworks or platforms (e.g., AWS vs GCP vs Azure),
organise by variant rather than by step:

```
cloud-deploy/
├── SKILL.md              ← workflow + variant selection logic
└── references/
    ├── aws.md
    ├── gcp.md
    └── azure.md
```

In SKILL.md, instruct Claude to read only the relevant reference file based on the user's context.
This keeps the main skill file lean while supporting unlimited depth.

---

## Conditional Resource Loading

Reference files should be loaded on demand, not upfront. Pattern:

```markdown
## Step 2 — Generate the report
Read `references/report-templates.md` and select the template matching the user's industry.
```

Claude will read the file only when it reaches Step 2 — not before.

---

## MCP Integration

If your skill depends on an MCP server (e.g. Gmail, Notion, Asana), declare it in frontmatter:

```yaml
compatibility:
  mcp_servers:
    - name: gmail
      url: https://gmail.mcp.claude.com/mcp
    - name: google-calendar
      url: https://gcal.mcp.claude.com/mcp
```

In the skill body, instruct Claude how to handle the case where the MCP is not connected:

```markdown
> If Gmail is not connected, ask the user to enable it in Settings → Integrations before proceeding.
```

---

## Scripts Pattern

For deterministic or repetitive tasks (file format conversion, data extraction, aggregation),
bundle a script rather than instructing Claude to write one each time:

```
skill-name/
├── SKILL.md
└── scripts/
    └── convert_xlsx.py
```

In SKILL.md:
```markdown
## Step 3 — Convert the file
Run `scripts/convert_xlsx.py --input <path> --output /mnt/user-data/outputs/result.csv`.
```

Scripts execute without being loaded into context, keeping token usage low.

---

## Skill Triggering — What Works

Claude only consults a skill when the task would genuinely benefit from specialised guidance.
Implications for writing descriptions:

| Likely to trigger | Unlikely to trigger |
|---|---|
| "Convert this DOCX to a compliance-formatted PDF with letterhead" | "Read this file" |
| "Build an n8n workflow to send appointment reminders via Twilio" | "Write some code" |
| "Create a pitch deck for a Series A raise" | "Make slides" |

**Make descriptions specific and forward-leaning.** Vague descriptions undertrigger.

---

## Skill Size Guidelines

| Component | Recommended limit |
|---|---|
| SKILL.md body | < 500 lines |
| Any single reference file | < 300 lines (add TOC if longer) |
| Total bundled assets | No hard limit (scripts run without loading) |
| Description (frontmatter) | 50–150 words |

---

## Iteration Strategy

| Feedback type | Fix location |
|---|---|
| "Claude missed a step" | Add explicit instruction to relevant phase |
| "Output format was wrong" | Tighten the output template section |
| "Claude did X when it should do Y" | Add priority/conflict resolution rule |
| "Doesn't trigger when it should" | Strengthen description trigger phrases |
| "Triggers when it shouldn't" | Narrow description with exclusion examples |
