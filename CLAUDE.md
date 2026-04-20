# CLAUDE HQ — Router
**Owner:** Chitraksh Mayank | **Single HQ:** Oraya-AI-HQ/

---

## Boot

Load `Oraya-AI-HQ/CLAUDE.md`. This root exists only so GitHub Pages serves `index.html`.
HanFlux AI lives at `Oraya-AI-HQ/projects/hanflux-ai/`. Personal-HQ deleted Apr 20, 2026.

---

## Dashboard push (run after every dashboard edit, same response)

```bash
cd ~/Downloads/Claude\ hq && \
rm -f .git/HEAD.lock && \
cp Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && \
git add -A && git commit -m "MESSAGE" && git push -f origin HEAD:main
```

Branch: `main`. The `cp` to root `index.html` is mandatory.

---

## GitHub SSH (one-time, permanent fix)

```bash
cd ~/Downloads/Claude\ hq
git remote set-url origin git@github.com:hanfluxai-create/oraya-dashboard.git
ssh-keygen -t ed25519 -C "chitrakshmayank3@gmail.com" -f ~/.ssh/id_ed25519_oraya -N ""
cat ~/.ssh/id_ed25519_oraya.pub | pbcopy
# paste into https://github.com/settings/keys
ssh -T git@github.com
git push
```

Replaces PAT-in-URL. Root cause of recurring push failures.
