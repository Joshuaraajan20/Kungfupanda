# Install Guide

## Quick Install (Recommended)

```bash
# macOS / Linux / WSL
curl -fsSL https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.sh | bash

# Windows PowerShell
irm https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.ps1 | iex
```

Detects agents automatically. Safe to re-run.

---

## Manual Install

### Claude Code

```bash
mkdir -p ~/.claude/skills/kungfupanda
mkdir -p ~/.claude/skills/strike
mkdir -p ~/.claude/commands

cp skills/kungfupanda/SKILL.md ~/.claude/skills/kungfupanda/
cp skills/strike/SKILL.md ~/.claude/skills/strike/
cp commands/*.md ~/.claude/commands/
```

Trigger: `/kungfupanda` in any session.

### Cursor / Windsurf

Copy `skills/kungfupanda/SKILL.md` content into your `.cursorrules` or `.windsurfrules` file.

### Cline

Add to Cline custom instructions in VS Code settings.

### Copilot

Add to `.github/copilot-instructions.md` in your repo.

### Any Agent (Manual)

Paste contents of `skills/kungfupanda/SKILL.md` into the agent's system prompt / custom instructions field.

---

## What Gets Installed

| File | Location | What |
|------|----------|------|
| `skills/kungfupanda/SKILL.md` | `~/.claude/skills/kungfupanda/` | Core 5 rules |
| `skills/strike/SKILL.md` | `~/.claude/skills/strike/` | Subagents |
| `commands/kungfupanda.md` | `~/.claude/commands/` | `/kungfupanda` trigger |
| `commands/commit.md` | `~/.claude/commands/` | `/panda-commit` |
| `commands/review.md` | `~/.claude/commands/` | `/panda-review` |
| `commands/stats.md` | `~/.claude/commands/` | `/panda-stats` |
| `commands/compress.md` | `~/.claude/commands/` | `/panda-compress` |

---

## Uninstall

```bash
rm -rf ~/.claude/skills/kungfupanda
rm -rf ~/.claude/skills/strike
rm ~/.claude/commands/kungfupanda.md
rm ~/.claude/commands/panda-*.md
```

---

## Verify Install

In Claude Code, type `/kungfupanda` — agent should respond in precision mode immediately.

Test: ask "explain what a database connection pool is"

Normal response: ~400 tokens of explanation
Panda response: ~80 tokens, same substance
