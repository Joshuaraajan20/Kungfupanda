# kungfupanda Windows Installer
# Run: irm https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.ps1 | iex

$REPO_RAW = "https://raw.githubusercontent.com/yourusername/kungfupanda/main"
$VERSION = "1.0.0"
$CLAUDE_DIR = "$env:USERPROFILE\.claude"

Write-Host ""
Write-Host "🐼 kungfupanda v$VERSION"
Write-Host "   strike once. strike clean."
Write-Host ""

# Create dirs
New-Item -ItemType Directory -Force -Path "$CLAUDE_DIR\skills\kungfupanda" | Out-Null
New-Item -ItemType Directory -Force -Path "$CLAUDE_DIR\skills\strike" | Out-Null
New-Item -ItemType Directory -Force -Path "$CLAUDE_DIR\commands" | Out-Null

# Download skills
Write-Host "-> Installing skills..."
Invoke-WebRequest "$REPO_RAW/skills/kungfupanda/SKILL.md" -OutFile "$CLAUDE_DIR\skills\kungfupanda\SKILL.md"
Invoke-WebRequest "$REPO_RAW/skills/strike/SKILL.md" -OutFile "$CLAUDE_DIR\skills\strike\SKILL.md"

# Download commands
Write-Host "-> Installing commands..."
Invoke-WebRequest "$REPO_RAW/commands/kungfupanda.md" -OutFile "$CLAUDE_DIR\commands\kungfupanda.md"
Invoke-WebRequest "$REPO_RAW/commands/commit.md" -OutFile "$CLAUDE_DIR\commands\panda-commit.md"
Invoke-WebRequest "$REPO_RAW/commands/review.md" -OutFile "$CLAUDE_DIR\commands\panda-review.md"
Invoke-WebRequest "$REPO_RAW/commands/stats.md" -OutFile "$CLAUDE_DIR\commands\panda-stats.md"
Invoke-WebRequest "$REPO_RAW/commands/compress.md" -OutFile "$CLAUDE_DIR\commands\panda-compress.md"

Write-Host ""
Write-Host "✅ Done. Trigger: /kungfupanda"
