# CLAUDE.md — Maintainer Guide

## Repo Philosophy

kungfupanda enforces precision in AI output. Every rule must earn its place. No bloat.

## File Ownership

| File | Owner | Change frequency |
|------|-------|-----------------|
| `skills/kungfupanda/SKILL.md` | Core team | Low — breaking changes need benchmarks |
| `skills/strike/SKILL.md` | Core team | Medium |
| `commands/*.md` | Contributors OK | High |
| `benchmarks/` | Community | Always open |
| `install.sh` | Core team | Low |

## Architecture

- Skills live in `skills/` — one folder per skill
- Commands live in `commands/` — one file per command
- Agent-specific overrides live in `agents/`
- Install script auto-detects agent paths

## Hook System

`bin/session-hook.js` runs on Claude Code session start.
Writes `.panda-active` flag to session dir.
Agent reads flag → activates `/kungfupanda` from message one.

## Adding an Agent

1. Add detection logic to `install.sh`
2. Add config file to `agents/agentname.md`
3. Update install matrix in `INSTALL.md`
4. Test with `bin/verify-install.sh --agent agentname`

## CI

GitHub Actions runs on every PR:
- Skill syntax validation
- Benchmark regression check (fail if new rule increases avg tokens)
- Install script dry-run on ubuntu-latest + windows-latest

## Release Process

1. Bump version in `package.json`
2. Update `CHANGELOG.md`
3. Tag: `v{major}.{minor}.{patch}`
4. GitHub Actions publishes to npm automatically
