#!/bin/bash
# ============================================================
# Oraya Dashboard — One-Time GitHub Setup Script
# Run this ONCE on your Mac terminal to create the repo + push
# ============================================================

PAT="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"
GITHUB_USER="hanfluxai-create"
REPO_NAME="oraya-dashboard"
DASHBOARD_FILE="$(dirname "$0")/projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html"

echo "🚀 Setting up Oraya Dashboard on GitHub..."

# Step 1: Create private repo
echo "📦 Creating private repo..."
RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $PAT" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\",\"private\":true,\"description\":\"Oraya Labs Project Intelligence Dashboard\"}")

echo "$RESPONSE" | grep -q '"full_name"' && echo "✅ Repo created!" || echo "⚠️  Repo may already exist, continuing..."

# Step 2: Set up local git repo
TMPDIR=$(mktemp -d)
cp "$DASHBOARD_FILE" "$TMPDIR/index.html"

cd "$TMPDIR"
git init
git config user.email "hanfluxai@gmail.com"
git config user.name "Chitraksh Mayank"
git add index.html
git commit -m "Initial deploy: Oraya Project Intelligence Dashboard"

# Step 3: Push to GitHub
git remote add origin "https://$GITHUB_USER:$PAT@github.com/$GITHUB_USER/$REPO_NAME.git"
git branch -M main
git push -u origin main

echo ""
echo "✅ Done! Your repo is live at:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "🔗 Next: Connect to Vercel at https://vercel.com/new"
echo "   → Import from GitHub → select '$REPO_NAME' → Deploy"
echo ""
echo "📁 Repo path stored for future Claude auto-pushes."

# Save config for Claude future use
CONFIG_FILE="$(dirname "$0")/.github-config"
echo "GITHUB_USER=$GITHUB_USER" > "$CONFIG_FILE"
echo "REPO_NAME=$REPO_NAME" >> "$CONFIG_FILE"
echo "PAT=$PAT" >> "$CONFIG_FILE"
echo "REMOTE=https://github.com/$GITHUB_USER/$REPO_NAME" >> "$CONFIG_FILE"

echo "🔐 Config saved to Claude hq/.github-config"
