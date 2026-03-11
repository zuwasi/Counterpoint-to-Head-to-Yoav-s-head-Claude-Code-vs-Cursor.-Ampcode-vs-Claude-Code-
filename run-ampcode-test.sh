#!/bin/bash
set -e

echo "============================================================"
echo "  COUNTERPOINT TEST: Ampcode - Setup and Launch"
echo "============================================================"
echo ""

JAYDIR="$HOME/jay-ampcode-run"
LOGFILE="/mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/ampcode-start-time.txt"
PROMPTFILE="/mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/AMPCODE-PROMPT-PASTE.txt"

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
echo "[3/5] Setting up Yarn via corepack..."
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

echo ""
echo "============================================================"
echo "  READY FOR AMPCODE"
echo "============================================================"
echo ""
echo "  Jay Framework is ready at: $JAYDIR"
echo ""
echo "  NOW DO THIS:"
echo "  1. Open Ampcode (VS Code or CLI) in: $JAYDIR"
echo "  2. Paste the contents of: $PROMPTFILE"
echo "  3. Press ENTER - that is your T0"
echo "  4. DO NOT intervene unless Ampcode asks a question"
echo ""
echo "  AMPCODE SETUP DONE: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE"
