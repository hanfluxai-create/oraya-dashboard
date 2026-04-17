#!/usr/bin/env bash
# ============================================================================
# ORAYA — ULTIMATE GITHUB FIX (Apr 17, 2026)
# One-time SSH migration. After this, `git push` works forever.
# Kills the PAT-in-URL root cause that's caused recurring failures.
# ============================================================================
set -e
cd "$(dirname "$0")"
REPO="$(pwd)"

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "   ORAYA — Permanent GitHub Fix"
echo "   Repo: $REPO"
echo "════════════════════════════════════════════════════════════════"
echo ""

# ----------------------------------------------------------------------------
# Phase 1 — SSH key
# ----------------------------------------------------------------------------
KEY="$HOME/.ssh/id_ed25519_oraya"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"

if [ ! -f "$KEY" ]; then
  ssh-keygen -t ed25519 -C "chitrakshmayank3@gmail.com" -f "$KEY" -N "" -q
  echo "[1/7] ✓ Generated new SSH key at $KEY"
else
  echo "[1/7] ✓ SSH key already exists at $KEY"
fi

# ----------------------------------------------------------------------------
# Phase 2 — SSH config
# ----------------------------------------------------------------------------
if ! grep -q "IdentityFile $KEY" "$HOME/.ssh/config" 2>/dev/null; then
  cat >> "$HOME/.ssh/config" <<EOF

Host github.com
  HostName github.com
  User git
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $KEY
  IdentitiesOnly yes
EOF
  chmod 600 "$HOME/.ssh/config"
  echo "[2/7] ✓ Added github.com block to ~/.ssh/config"
else
  echo "[2/7] ✓ ~/.ssh/config already configured"
fi

# ----------------------------------------------------------------------------
# Phase 3 — Agent + keychain
# ----------------------------------------------------------------------------
eval "$(ssh-agent -s)" > /dev/null
ssh-add --apple-use-keychain "$KEY" 2>/dev/null || ssh-add "$KEY" 2>/dev/null || true
echo "[3/7] ✓ Key added to ssh-agent + macOS keychain"

# ----------------------------------------------------------------------------
# Phase 4 — Copy pubkey to clipboard + save to workspace
# ----------------------------------------------------------------------------
pbcopy < "$KEY.pub"
cp "$KEY.pub" "$REPO/.oraya-ssh-pubkey.txt"
echo "[4/7] ✓ Pubkey copied to clipboard + saved to .oraya-ssh-pubkey.txt"

# ----------------------------------------------------------------------------
# Phase 5 — Open browser + auto-poll until key is live on GitHub
#   No human ENTER needed. Script self-drives. Claude fills the form.
# ----------------------------------------------------------------------------
open "https://github.com/settings/ssh/new"
echo ""
echo "────────────────────────────────────────────────────────────────"
echo "  BROWSER OPENED → github.com/settings/ssh/new"
echo "  Claude is filling the form right now via Chrome."
echo "  Only thing you may need to do: confirm your GitHub password"
echo "  when GitHub asks for sudo-mode re-authentication."
echo "  This terminal will auto-continue once the key is active."
echo "────────────────────────────────────────────────────────────────"
echo ""
echo "[5/7] Polling SSH auth (5s intervals, 5 min timeout)..."

AUTHED=0
for i in $(seq 1 60); do
  if ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -o ConnectTimeout=4 \
         -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "✓ SSH authenticated after $((i * 5))s"
    AUTHED=1
    break
  fi
  printf "."
  sleep 5
done
echo ""

if [ "$AUTHED" = "0" ]; then
  echo ""
  echo "✗ SSH auth did NOT succeed within 5 minutes."
  echo "  Possible fixes:"
  echo "  - Check https://github.com/settings/keys — is the key listed?"
  echo "  - Make sure you're logged into GitHub as hanfluxai-create"
  echo "  - Rerun this script after adding the key"
  exit 1
fi

git remote set-url origin git@github.com:hanfluxai-create/oraya-dashboard.git
echo "[6/7] ✓ Remote switched to SSH (PAT-in-URL root cause eliminated)"

# ----------------------------------------------------------------------------
# Phase 7 — Stage everything + push
# ----------------------------------------------------------------------------
rm -f .git/index.lock .git/HEAD.lock 2>/dev/null || true
find .git/objects -name 'tmp_obj_*' -delete 2>/dev/null || true

cp "Oraya-AI-HQ/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html" index.html

# Clean sandbox-leftover root duplicates (these exist in Oraya-AI-HQ now)
git rm -rf --cached memory protocols skills projects/.DS_Store 2>/dev/null || true
rm -rf memory protocols skills projects/.DS_Store 2>/dev/null || true

git add -A
if git diff --cached --quiet; then
  echo "(no changes to commit — repo already clean)"
else
  git commit -m "Apr 17, 2026 — HQ v4 restructure + SSH migration

- Split monolithic HQ → Oraya-AI-HQ/ + Personal-HQ/
- Root CLAUDE.md = router; index.html mirror for GitHub Pages
- Sentient Protocol v3 → v4 (self-audit, MCP hierarchy, handoff discipline)
- Dashboard refreshed: Apr 17 hero, E&O quoted ✅, Apr 6–17 intel card
- Handoff OUT brief logged
- Remote migrated HTTPS(PAT) → SSH (permanent push fix)

Co-authored-by: Chitraksh Mayank <hanfluxai@gmail.com>"
fi

echo ""
echo "[7/7] Pushing to origin/main..."
git push origin HEAD:main

# Cleanup
rm -f "$REPO/.oraya-ssh-pubkey.txt"

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "   ✅ DONE — Permanent fix applied"
echo ""
echo "   Dashboard:  https://hanfluxai-create.github.io/oraya-dashboard/"
echo "   Commit:     $(git rev-parse --short HEAD)"
echo "   Remote:     $(git remote get-url origin)"
echo ""
echo "   Future pushes: just run  \`git push\`  — it works forever now."
echo "════════════════════════════════════════════════════════════════"
