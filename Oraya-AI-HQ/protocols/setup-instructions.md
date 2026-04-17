# Cross-Platform Setup
**Last Updated:** March 15, 2026

---

## The Problem
Claude has no built-in persistent memory. Each session starts fresh. `.claude-hq/` in Downloads solves this — but only if Claude can see it at session start.

## Location: ~/Downloads/.claude-hq/

---

## VS Code (Claude Code) — MOST IMPORTANT

Claude Code auto-reads `CLAUDE.md` from the root of the folder you open.

### Option A: Symlink (Recommended)
```bash
# Run once per project:
ln -s ~/Downloads/.claude-hq/CLAUDE.md ~/path/to/your/project/CLAUDE.md
```
Then `claude` in that project folder auto-loads full context.

### Option B: Open Downloads Directly
```bash
cd ~/Downloads && claude
```

### Option C: Environment Variable (Check if Supported)
```bash
# Add to ~/.zshrc or ~/.bashrc:
export CLAUDE_MD_PATH="$HOME/Downloads/.claude-hq/CLAUDE.md"
```

---

## Cowork (Desktop App)

1. Select Downloads folder when starting session
2. At session start say: **"Boot up"** or **"Read .claude-hq/CLAUDE.md"**
3. Claude reads all memory files and reports pending items

---

## Claude.ai (Browser)

Upload at session start:
- `.claude-hq/CLAUDE.md`
- `memory/chitraksh-profile.md`
- Relevant `projects/*/PROJECT.md`

Or use Projects feature: paste CLAUDE.md as persistent instructions.

---

## Mobile
Quick questions: no setup needed
Project work: start with "I'm working on [project], check my memory files"

---

## Quick Start Cheat Sheet

| Surface | First Message |
|---|---|
| Cowork | "Boot up" |
| VS Code | Automatic (if symlinked) |
| Browser | Upload CLAUDE.md + PROJECT.md |
| Mobile | "I'm working on [project]" |

---

## Self-Learning: What You Never Have to Do

| What Happens | Claude Does | You Do |
|---|---|---|
| You correct Claude | Logs to learnings.md | Nothing |
| New project mentioned | Adds to active-projects.md | Nothing |
| New person with role | Adds to contacts.md | Nothing |
| Preference expressed | Updates profile | Nothing |
| Task incomplete | Logs to pending-actions.md | Nothing |
| Spec confirmed | Updates PROJECT.md | Nothing |

The system compounds. Session 1: 5 corrections → 5 rules. Session 5: 0 of those mistakes repeated.

---

## If .claude-hq Gets Lost Again
Say "Rebuild .claude-hq from memory" — Claude rebuilds everything from session context.
