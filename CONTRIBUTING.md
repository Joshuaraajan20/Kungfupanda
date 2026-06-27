# Contributing to kungfupanda

Strike once. Strike clean. Same for PRs.

## What We Want

- New tool fast paths (Supabase, Railway, Netlify, etc.)
- Benchmark data from real sessions
- Agent-specific install improvements
- Bug fixes in skill logic

## What We Don't Want

- Feature bloat
- Verbose documentation
- Rules that contradict the core philosophy

## How to Contribute

1. Fork → branch → PR
2. Branch name: `feat/tool-name` or `fix/what-broke`
3. PR description: what + why. One paragraph max.
4. Include before/after token count if adding a new rule

## Adding a New Tool Fast Path

Add to `skills/kungfupanda/SKILL.md` under Rule 5:

```markdown
**YourTool:**
- [specific behaviour 1]
- [specific behaviour 2]
```

Keep each rule under 3 lines.

## Benchmark Contributions

Run the eval harness in `evals/` against your agent, add results to `benchmarks/results.md`.

Format:
```
| Task | Normal | Panda | Saved | Agent | Date |
```

## Code of Conduct

Be direct. No filler. Respect other contributors' time.
