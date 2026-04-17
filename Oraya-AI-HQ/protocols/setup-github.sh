#!/bin/bash
# ============================================================
# Oraya Dashboard — One-Time GitHub SSH Setup (Apr 17, 2026)
# Replaces the old PAT-based setup. PAT revoked + migrated to SSH.
# Rerun is safe: script is idempotent.
# ============================================================
set -e

GITHUB_USER="hanfluxai-create"
REPO_NAME="oraya-dashboard"
KEY="$HOME/.ssh/id_ed25519_oraya"

echo "Setting up Oraya Dashboard GitHub access via SSH..."

# Step 1 — SSH key (create if missing)
if [ ! -f "$KEY" ]; then
  mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
  ssh-keygen -t ed25519 -C "chitrakshmayank3@gmail.com" -f "$KEY" -N "" -q
  echo "Generated new SSH key at $KEY"
else
  echo "SSH key already exists at $KEY"
fi

# Step 2 — SSH config (idempotent)
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
fi

# Step 3 — Agent + keychain
eval "$(ssh-agent -s)" > /dev/null
ssh-add --apple-use-keychain "$KEY" 2>/dev/null || ssh-add "$KEY" 2>/dev/null || true

# Step 4 — Copy pubkey to clipboard
pbcopy < "$KEY.pub"
echo ""
echo "Public key copied to clipboard."
echo "If not already added, paste it at: https://github.com/settings/ssh/new"
echo ""

# Step 5 — Verify auth
if ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
  echo "SSH auth verified. You can push with plain 'git push' from now on."
else
  echo "SSH auth NOT yet active. Paste the key on GitHub first, then rerun."
  exit 1
fi

# Step 6 — Ensure remote uses SSH
REPO_DIR="$(dirname "$0")/.."
cd "$REPO_DIR"
if git remote get-url origin 2>/dev/null | grep -q "https://"; then
  git remote set-url origin "git@github.com:$GITHUB_USER/$REPO_NAME.git"
  echo "Remote switched from HTTPS to SSH."
fi

echo ""
echo "Done. Repo: https://github.com/$GITHUB_USER/$REPO_NAME"
