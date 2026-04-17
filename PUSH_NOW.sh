#!/usr/bin/env bash
# =============================================================
# ORAYA DASHBOARD — push helper (Apr 17, 2026 HQ restructure)
# Run this from macOS Terminal on your machine. Not from Cowork.
# =============================================================
set -e

cd "$(dirname "$0")"
REPO_DIR="$(pwd)"
echo "→ Pushing from: $REPO_DIR"

# 1. Clear any stale locks (Cowork sandbox couldn't delete these)
rm -f .git/index.lock .git/HEAD.lock 2>/dev/null || true
find .git/objects -name 'tmp_obj_*' -delete 2>/dev/null || true
echo "✓ Cleared stale git locks"

# 2. Mirror dashboard to repo-root index.html (mandatory for GitHub Pages)
cp "Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html" index.html
echo "✓ Mirrored dashboard → index.html"

# 3. Clean up legacy root duplicates (Cowork sandbox couldn't delete these)
#    All of these have exact copies inside Oraya-AI-HQ/ or Personal-HQ/.
git rm -rf --cached memory protocols skills projects/.DS_Store 2>/dev/null || true
rm -rf memory protocols skills projects/.DS_Store 2>/dev/null || true
echo "✓ Removed legacy root duplicates"

# 4. Stage everything (HQ split + dashboard + handoff brief + protocols)
git add -A
echo "✓ Staged all changes"

# 4. Commit
git commit -m "Apr 17, 2026 — HQ restructure to Sentient v4 + dashboard refresh

- Split monolithic HQ into Oraya-AI-HQ/ + Personal-HQ/ agent workspaces
- Root CLAUDE.md demoted to router
- Sentient Protocol upgraded v3 → v4 (self-audit, MCP hierarchy, handoff discipline)
- Dashboard: hero Apr 5 → Apr 17, meeting 16 → 17, E&O quoted ✅
- New Apr 6–17 Intelligence card (12 items from handoff brief)
- Handoff OUT brief logged in Oraya-AI-HQ/handoffs/

Co-authored-by: Chitraksh Mayank <hanfluxai@gmail.com>" || echo "(nothing to commit — already clean)"

# 5. Push
echo "→ Pushing to origin/main..."
git push -f origin HEAD:main && echo "✓ PUSH COMPLETE" || {
  echo "✗ Push failed. This is almost always the PAT-in-URL problem."
  echo "  Permanent fix (run these, one time):"
  echo "    git remote set-url origin git@github.com:hanfluxai-create/oraya-dashboard.git"
  echo "    bash Oraya-AI-HQ/protocols/setup-github.sh"
  echo "  Then paste the printed SSH key at https://github.com/settings/keys"
  echo "  After that: git push works forever."
  exit 1
}

echo ""
echo "=================================================="
echo "Dashboard live at: https://hanfluxai-create.github.io/oraya-dashboard/"
echo "Commit:            $(git rev-parse --short HEAD)"
echo "=================================================="
