#!/bin/bash
# Oraya Voice HQ launcher.
# First run: prompts for GEMINI_API_KEY, saves to ~/.config/oraya-voice/env.
# Subsequent runs: auto-loads key, kills any stale bridge, starts fresh, opens UI.

set -e
cd "$(dirname "$0")"

CFG_DIR="$HOME/.config/oraya-voice"
CFG_ENV="$CFG_DIR/env"
LOCAL_ENV="$(pwd)/.env"
mkdir -p "$CFG_DIR"

# --- 1. Load GEMINI_API_KEY from local .env, then global config, then prompt ---
if [ -f "$LOCAL_ENV" ]; then
  # shellcheck disable=SC1090
  source "$LOCAL_ENV"
fi
if [ -z "$GEMINI_API_KEY" ] && [ -f "$CFG_ENV" ]; then
  # shellcheck disable=SC1090
  source "$CFG_ENV"
fi

if [ -z "$GEMINI_API_KEY" ]; then
  echo ""
  echo "=== Oraya Voice HQ — first-run setup ==="
  echo "Get a key at: https://aistudio.google.com/apikey"
  echo ""
  printf "Paste GEMINI_API_KEY: "
  read -r GEMINI_API_KEY
  if [ -z "$GEMINI_API_KEY" ]; then
    echo "No key entered. Aborting."
    exit 1
  fi
  echo "export GEMINI_API_KEY='$GEMINI_API_KEY'" > "$CFG_ENV"
  chmod 600 "$CFG_ENV"
  echo "Saved to $CFG_ENV (600). Future runs auto-load."
fi
export GEMINI_API_KEY

# --- 2. Dependencies ---
python3 -c "import websockets, certifi" 2>/dev/null || \
  pip3 install --break-system-packages --quiet websockets certifi

# --- 3. Kill stale bridge on 8787 ---
PORT="${BRIDGE_PORT:-8787}"
STALE_PID="$(lsof -ti tcp:"$PORT" 2>/dev/null || true)"
if [ -n "$STALE_PID" ]; then
  echo "Killing stale bridge PID $STALE_PID on :$PORT"
  kill "$STALE_PID" 2>/dev/null || true
  sleep 1
fi

# --- 4. HQ_ROOT resolution ---
export HQ_ROOT="${HQ_ROOT:-$HOME/Downloads/Claude hq}"
if [ ! -d "$HQ_ROOT" ]; then
  echo "WARNING: HQ_ROOT not found at $HQ_ROOT"
  echo "Set HQ_ROOT=... if your HQ is elsewhere."
fi

# --- 5. Open UI ~1s after bridge comes up ---
UI_URL="file://$(pwd)/index.html"
( sleep 1.5 && open "$UI_URL" ) &

# --- 6. Launch bridge in foreground ---
echo ""
echo "=== Oraya Voice HQ ==="
echo "UI:       $UI_URL"
echo "Bridge:   ws://127.0.0.1:$PORT"
echo "HQ root:  $HQ_ROOT"
echo "Model:    ${GEMINI_MODEL:-models/gemini-3.1-flash-live-preview}"
echo "Ctrl+C to stop."
echo ""

exec python3 bridge.py
