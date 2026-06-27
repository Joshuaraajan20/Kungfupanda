---
name: panda-commit
trigger: /panda-commit
description: Conventional commit messages. ≤50 char subject. Why over what.
---

Format: type(scope): subject

Types: feat · fix · chore · refactor · style · docs · test · perf

Rules:
- Subject ≤50 chars
- Body only when "why" isn't obvious from subject
- Active voice. Present tense.
- No "I added..." / "This commit..."

Examples:
```
fix(auth): use <= for token expiry check

feat(analytics): inject GA4 into all HTML pages

chore(deps): bump node to 18.x
```

Input: paste diff or describe change.
Output: commit message only. Nothing else.
