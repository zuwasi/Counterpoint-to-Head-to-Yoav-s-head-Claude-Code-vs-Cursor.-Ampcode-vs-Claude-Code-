#!/bin/bash
set -e

echo "============================================================"
echo "  COUNTERPOINT TEST: Claude Code - Setup and Launch"
echo "============================================================"
echo ""

JAYDIR="$HOME/jay-claude-run"
LOGFILE="/mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/claude-start-time.txt"
PROMPTFILE="/mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/CLAUDE-PROMPT-PASTE.txt"

# Record start time
echo "TEST START TIME: $(date '+%Y-%m-%d %H:%M:%S')"
echo "TEST START TIME: $(date '+%Y-%m-%d %H:%M:%S')" > "$LOGFILE"

# Step 1: Clone Jay Framework
echo ""
echo "[1/5] Cloning Jay Framework..."
if [ -f "$JAYDIR/package.json" ]; then
    echo "     $JAYDIR already set up, skipping clone."
else
    rm -rf "$JAYDIR" 2>/dev/null || true
    git clone https://github.com/jay-framework/jay.git "$JAYDIR"
fi

cd "$JAYDIR"
echo "[2/5] Working directory: $(pwd)"

# Step 2: Enable corepack and setup yarn
echo ""
echo "[3/5] Setting up Yarn 3 via corepack..."
corepack enable 2>/dev/null || true
corepack prepare yarn@3.6.4 --activate 2>/dev/null || true

# Step 3: Install
echo ""
echo "[4/5] Installing dependencies..."
yarn install

# Step 4: Build
echo ""
echo "[5/5] Building project..."
yarn build

echo ""
echo "============================================================"
echo "  SETUP COMPLETE at $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================================"
echo "SETUP COMPLETE: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE"

# Show the prompt
echo ""
echo "============================================================"
echo "  READY TO LAUNCH CLAUDE CODE"
echo "============================================================"
echo ""
echo "  The prompt file is at: $PROMPTFILE"
echo ""
echo "  INSTRUCTIONS:"
echo "  1. Claude Code will open below"
echo "  2. Paste the contents of the prompt file"
echo "     (it will be shown to you, select and copy it)"
echo "  3. Press ENTER"
echo "  4. DO NOT intervene unless Claude asks a question"
echo ""
echo "  === PROMPT TO PASTE (copy everything between the lines) ==="
echo "  ============================================================"
cat "$PROMPTFILE"
echo ""
echo "  ============================================================"
echo "  === END OF PROMPT ==="
echo ""
echo "  Press ENTER to launch Claude Code..."
read -r

echo "CLAUDE LAUNCHED: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE"
claude
