#!/usr/bin/env bash
set -e

REPO_RAW="https://raw.githubusercontent.com/yourusername/kungfupanda/main"
VERSION="1.0.0"

GREEN='\033[0;32m'
GREY='\033[0;37m'
NC='\033[0m'

echo ""
echo "🐼 kungfupanda v${VERSION}"
echo "   strike once. strike clean."
echo ""

# Detect OS
OS="linux"
[[ "$OSTYPE" == "darwin"* ]] && OS="mac"

# Agent detection
AGENTS_FOUND=()

detect_claude_code() {
  local dir="$HOME/.claude"
  if [[ -d "$dir" ]]; then
    CLAUDE_DIR="$dir"
    AGENTS_FOUND+=("claude-code")
  fi
}

detect_cursor() {
  local dir="$HOME/.cursor"
  [[ -d "$dir" ]] && AGENTS_FOUND+=("cursor")
}

detect_windsurf() {
  local dir="$HOME/.windsurf"
  [[ -d "$dir" ]] && AGENTS_FOUND+=("windsurf")
}

detect_claude_code
detect_cursor
detect_windsurf

if [[ ${#AGENTS_FOUND[@]} -eq 0 ]]; then
  echo "No agents detected. Installing for Claude Code (default)..."
  AGENTS_FOUND+=("claude-code")
  CLAUDE_DIR="$HOME/.claude"
fi

echo "Agents found: ${AGENTS_FOUND[*]}"
echo ""

install_claude_code() {
  echo -e "${GREY}→ Installing for Claude Code...${NC}"
  mkdir -p "$CLAUDE_DIR/skills/kungfupanda"
  mkdir -p "$CLAUDE_DIR/skills/strike"
  mkdir -p "$CLAUDE_DIR/commands"

  curl -fsSL "$REPO_RAW/skills/kungfupanda/SKILL.md" -o "$CLAUDE_DIR/skills/kungfupanda/SKILL.md"
  curl -fsSL "$REPO_RAW/skills/strike/SKILL.md" -o "$CLAUDE_DIR/skills/strike/SKILL.md"
  curl -fsSL "$REPO_RAW/commands/kungfupanda.md" -o "$CLAUDE_DIR/commands/kungfupanda.md"
  curl -fsSL "$REPO_RAW/commands/commit.md" -o "$CLAUDE_DIR/commands/panda-commit.md"
  curl -fsSL "$REPO_RAW/commands/review.md" -o "$CLAUDE_DIR/commands/panda-review.md"
  curl -fsSL "$REPO_RAW/commands/stats.md" -o "$CLAUDE_DIR/commands/panda-stats.md"
  curl -fsSL "$REPO_RAW/commands/compress.md" -o "$CLAUDE_DIR/commands/panda-compress.md"

  echo -e "${GREEN}✓ Claude Code done${NC}"
}

for agent in "${AGENTS_FOUND[@]}"; do
  case $agent in
    claude-code) install_claude_code ;;
  esac
done

echo ""
echo -e "${GREEN}✅ kungfupanda installed${NC}"
echo ""
echo "Trigger:  /kungfupanda"
echo "Stop:     normal mode"
echo ""
echo "Commands:"
echo "  /kungfupanda              → all 5 rules on"
echo "  /kungfupanda light|max    → adjust intensity"
echo "  /panda-commit       → lean commit messages"
echo "  /panda-review       → one-line PR comments"
echo "  /panda-stats        → token usage"
echo "  /panda-compress     → compress memory files"
echo "  /strike scout|build|review  → subagents"
echo ""

# Auto-activate hook — fires /kungfupanda from message 1
HOOK_DIR="$CLAUDE_DIR/hooks"
mkdir -p "$HOOK_DIR"
cat > "$HOOK_DIR/kungfupanda-init.sh" << 'HOOK'
#!/usr/bin/env bash
# kungfupanda session hook — auto-activates on session start
echo "kungfupanda" > /tmp/.kungfupanda-active
HOOK
chmod +x "$HOOK_DIR/kungfupanda-init.sh"

# Write session flag check into CLAUDE.md if it exists
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  if ! grep -q "kungfupanda" "$CLAUDE_MD"; then
    echo "" >> "$CLAUDE_MD"
    echo "<!-- kungfupanda-begin -->" >> "$CLAUDE_MD"
    echo "kungfupanda strike mode active. All 5 rules on from message 1. No trigger needed." >> "$CLAUDE_MD"
    echo "<!-- kungfupanda-end -->" >> "$CLAUDE_MD"
    echo -e "${GREEN}✓ Auto-activate injected into CLAUDE.md${NC}"
  fi
fi
