<img src="docs/assets/panda.svg" width="80" alt="🐼" />

# kungfupanda

**strike once. strike clean.**

[![Stars](https://img.shields.io/github/stars/yourusername/kungfupanda?style=flat&color=black)](https://github.com/yourusername/kungfupanda/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/yourusername/kungfupanda?style=flat)](https://github.com/yourusername/kungfupanda/commits/main)
[![License](https://img.shields.io/github/license/yourusername/kungfupanda?style=flat)](https://github.com/yourusername/kungfupanda/blob/main/LICENSE)

[Before/After](#before--after) • [Install](#install) • [What You Get](#what-you-get) • [Benchmarks](#benchmarks) • [Full install guide](INSTALL.md)

---

A Claude Code skill/plugin (also works with Cursor, Windsurf, Cline, Copilot, and 20+ agents) that enforces **precision over verbosity**. A trained fighter doesn't throw 10 punches when 1 lands. Claude shouldn't use 10 sentences when 1 works.

Cuts **~75% of output tokens**. Kills verify loops. Guards against full-file paste waste. Brain stays sharp. Output gets lean.

## Before / After

🗣️ Normal Claude
> "Sure! I'd be happy to help you with that. Got all 6 files. Injecting the GA4 snippet only — nothing else will be touched. Let me verify the injection logic first. Good. Now I'll write all 6 files with GA4 injected directly..."

🐼 kungfupanda
> *(outputs 6 diffs. done.)*

**Same result. 89% fewer tokens. Zero narration.**

```
┌─────────────────────────────────────┐
│  TOKENS SAVED          ████████ 75% │
│  VERIFY LOOPS KILLED   ████████ 100%│
│  FULL FILE PASTE WASTE ████████   0%│
│  STRIKE PRECISION      ████████ MAX │
└─────────────────────────────────────┘
```

Pick your intensity — `light` (drop filler), `full` (default), `max` (telegraphic). One command switch. Waste go down forever.

## Install

One line. Installs for every agent it finds.

```bash
# macOS / Linux / WSL / Git Bash
curl -fsSL https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.sh | bash

# Windows (PowerShell 5.1+)
irm https://raw.githubusercontent.com/yourusername/kungfupanda/main/install.ps1 | iex
```

~30 seconds. Needs Node ≥18. Safe to re-run.

**Trigger:** `/kungfupanda` or say "panda mode". Stop with "normal mode".

One agent only or manual install → [INSTALL.md](INSTALL.md)

## What You Get

| Skill | What |
|-------|------|
| `/kungfupanda [light\|full\|max]` | Strike mode on. All 5 rules active. Levels stick until session end. |
| `/panda-commit` | Conventional commit messages, ≤50 char subject. Why over what. |
| `/panda-review` | One-line PR comments: `L42: 🔴 bug: null check missing. Add guard.` |
| `/panda-stats` | Real session token usage + estimated savings. |
| `/panda-compress <file>` | Rewrite memory files (CLAUDE.md, notes) into lean format. Cuts ~46% input tokens every session. |
| `strike-crew` | Precision subagents (scout/builder/reviewer). ~60% fewer tokens than vanilla. Main context lasts longer. |

### The 5 Rules (all active under `/kungfupanda`)

**Rule 1 — Precision Output**
Drop filler, hedging, pleasantries. Fragments OK. Short synonyms. Technical terms exact. Code unchanged.

**Rule 2 — No Narration**
Action → output → done. No "I'll now...", no "Let me verify...", no "That's it! Let me know if...". Internal steps invisible.

**Rule 3 — File Guard**
Full file paste detected → stops immediately. Redirects to GitHub URL or 10–20 line snippet. Biggest single source of wasted credits.

**Rule 4 — Diff-Only Output**
Small changes show diff, not full file. Multi-file same change: show pattern once + file list.

**Rule 5 — Tool Fast Paths**
Make.com, Vercel, GitHub — direct config output, no UI walkthrough, no alternatives unless asked.

## Benchmarks

Real token counts from the Claude API. Average **74% output reduction** across 10 tasks.

| Task | Normal | Panda | Saved |
|------|--------|-------|-------|
| Inject snippet into 6 HTML files | 620 | 48 | 92% |
| Fix auth middleware bug | 704 | 121 | 83% |
| Set up webhook in Make.com | 890 | 201 | 77% |
| Refactor callback to async/await | 387 | 88 | 77% |
| Build Vercel deploy config | 510 | 134 | 74% |
| Explain git rebase vs merge | 702 | 292 | 58% |
| Architecture: monolith vs services | 446 | 221 | 50% |
| Review PR for security issues | 678 | 398 | 41% |
| Docker multi-stage build | 1042 | 290 | 72% |
| Debug async race condition | 1200 | 232 | 81% |
| **Average** | **718** | **207** | **71%** |

Raw data and reproduction script: [`benchmarks/`](benchmarks/). Three-arm eval harness lives in [`evals/`](evals/).

**panda-compress receipts** (real memory files):

| File | Original | Compressed | Saved |
|------|----------|------------|-------|
| `claude-md-preferences.md` | 706 | 285 | 59.6% |
| `project-notes.md` | 1145 | 535 | 53.3% |
| `claude-md-project.md` | 1122 | 636 | 43.3% |
| `todo-list.md` | 627 | 388 | 38.1% |
| **Average** | **900** | **461** | **48%** |

> Note: kungfupanda affects output tokens — not reasoning tokens. Precision doesn't make the model dumber. It makes the model quieter. A March 2026 paper found that brevity constraints **improved accuracy by 26 points** on certain benchmarks. Less word. More correct.

## How It Works

1. Install drops skill files into your agent's skill directory.
2. Skill tells agent: no narration, no verify loops, redirect full files, diff only.
3. For Claude Code, a hook writes a session flag — agent strikes lean from message one. No `/kungfupanda` needed per session.
4. Stats command reads session log, counts tokens saved.
5. panda-compress rewrites memory files so every session starts lean. Saves tokens forever, not just one reply.

## strike-crew Subagents

Three precision agents. Delegate to save main context.

```
/strike scout    → locates code in codebase. never edits.
/strike build    → edits 1-2 files. diff only. no explain.
/strike review   → reviews diff. one line per issue.
```

~60% fewer tokens than vanilla subagents. Use when task is isolated and you want main context preserved.

## Why This Exists

Built after burning 75% of a Claude Pro session in 5 minutes on a task that needed 6 find+replace operations. Claude spent the credits narrating what it was about to do, verifying what it just did, then asking if it should continue.

A trained fighter doesn't announce each punch. They strike. They stop. Done.

kungfupanda is that discipline applied to AI output.

## Star This Repo

kungfupanda saved you tokens. Star costs zero. Fair trade. ⭐

## License

MIT — free like bamboo in open forest.
