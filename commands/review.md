---
name: panda-review
trigger: /panda-review
description: One-line PR review comments. Location, problem, fix. No noise.
---

Format: L{line}: {severity} {type}: {problem}. {fix}.

Severity: 🔴 bug · 🟡 warning · 🟢 nit

Rules:
- One line per issue, no exceptions
- No praise, no summary, no "overall LGTM"
- Inline fix when under 1 line
- Input: diff only — not full file

Output:
```
L12: 🔴 bug: user can be null. Add null check before .id access.
L34: 🟡 perf: forEach inside map = O(n²). Use Set lookup.
L67: 🟢 nit: data → userData is clearer.
```
