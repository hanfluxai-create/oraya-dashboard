# CLAUDE HQ — Router (v4)
**Owner:** Chitraksh Mayank (hanfluxai@gmail.com)
**Last Restructured:** April 17, 2026
**Status:** Split into two dedicated agents — this root is now a router only.

---

## THIS IS NOT THE BOOT FILE

You are sitting at the repo root. **Pick an HQ and load its CLAUDE.md.** The root exists only so the git repo (`hanfluxai-create/oraya-dashboard`) can serve `index.html` via GitHub Pages.

### If this session is about Oraya
Load `Oraya-AI-HQ/CLAUDE.md`. That HQ contains:
- Oraya P1 (Voice AI) + P2 (Insurance Lead Gen)
- Mercedes pilot + Frankie's co-founder context
- Retell, n8n, insurance, voice-agent skills
- Sentient Protocol v4 + dashboard update rules
- `handoffs/` with the latest dated brief

### If this session is about personal work
Load `Personal-HQ/CLAUDE.md`. That HQ contains:
- Law dissertation (active, has deadline)
- HanFlux AI (personal automation agency)
- Fraudopedia, Campus Platform, Investigation Report
- Legal-review, fraud-detection, content-automation skills

### If the request mixes both
Default to `Oraya-AI-HQ`. Never bleed personal context into Oraya deliverables — they get git-pushed publicly.

---

## Why the split (Apr 17, 2026)

The old monolithic HQ tried to be both. Consequences: Oraya dashboard commits leaked dissertation notes, Frankie-facing briefings had unrelated project noise, personal legal work got entangled with Oraya voice-agent context. Single HQ = single blast radius.

The split:
- `Oraya-AI-HQ/` — self-contained Oraya workspace. Can be copied into any other Claude session verbatim and work standalone.
- `Personal-HQ/` — dissertation, HanFlux, fraudopedia, campus. Separate agent, separate memory.
- Shared skills (`legal-review-skill`, `skill-maker`) exist in both so either agent can act without cross-loading.
- Shared identity (`chitraksh-profile.md`) mirrored in both memories.

---

## Dashboard root mirror

`index.html` at the repo root is the GitHub-Pages-served copy of `Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html`. After any dashboard edit:

```bash
cd ~/Downloads/Claude\ hq && \
rm -f .git/HEAD.lock && \
cp Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && \
git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main
```

Branch is always `main`. The `cp` to root `index.html` is mandatory. Full protocol in `Oraya-AI-HQ/protocols/sentient-protocol.md` §10.

---

## GitHub push — permanent fix (recurring-failure cure)

Root cause of recurring push failures: PAT embedded in remote URL. Permanent fix = SSH.

One-time setup:
```bash
cd ~/Downloads/Claude\ hq
git remote set-url origin git@github.com:hanfluxai-create/oraya-dashboard.git
ssh-keygen -t ed25519 -C "chitrakshmayank3@gmail.com" -f ~/.ssh/id_ed25519_oraya -N ""
cat ~/.ssh/id_ed25519_oraya.pub | pbcopy
# paste the key into https://github.com/settings/keys → "New SSH key"
ssh -T git@github.com                 # verify it says "Hi hanfluxai-create!"
git push                              # works forever after this
```

See `Oraya-AI-HQ/handoffs/Oraya_Handoff_Brief_2026-04-17.md` §5 for the rationale.
