# Windows Install Guide

## Option 1 — PowerShell (Recommended)

```powershell
irm https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.ps1 | iex
```

Needs Node ≥18. Install from [nodejs.org](https://nodejs.org) if missing.

## Option 2 — Git Bash / WSL

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.sh | bash
```

## Option 3 — Manual

1. Download this repo as ZIP
2. Copy `skills/kungfupanda/SKILL.md` → `%USERPROFILE%\.claude\skills\kungfupanda\SKILL.md`
3. Copy `skills/strike/SKILL.md` → `%USERPROFILE%\.claude\skills\strike\SKILL.md`
4. Copy all files from `commands/` → `%USERPROFILE%\.claude\commands\`

## Verify

Open Claude Code. Type `/kungfupanda`. Agent should respond in precision mode.
