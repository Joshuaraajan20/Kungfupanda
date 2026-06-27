---
name: strike-crew
description: >
  Precision subagents for isolated code tasks. Scout finds code, Builder edits files,
  Reviewer checks diffs. ~60% fewer tokens than vanilla. Main context preserved.
  Trigger: /strike scout|build|review
---

# strike-crew

Three agents. One job each. Delegate to preserve main context.

## When to delegate

| Task | Agent |
|------|-------|
| "where is X defined" / "find the auth check" | scout |
| "edit this file" / "apply this fix" | builder |
| "review this diff" / "check this PR" | reviewer |

---

## scout

**Job:** Locate. Never edit.

Trigger: `/strike scout [what to find]`

Output:
```
FILE: src/auth/middleware.js
LINE: 42
FOUND: token expiry check
CONTEXT:
  40: const decoded = jwt.verify(token, SECRET)
  41: const now = Date.now()
> 42: if (decoded.exp < now) throw new Error('expired')
  43: return decoded
NEXT: builder fix at L42
```

## builder

**Job:** Edit 1-2 files. Diff only. No narration.

Trigger: `/strike build [what to change]`

Output:
```
// src/auth/middleware.js L42
- if (decoded.exp < now)
+ if (decoded.exp <= now)
DONE.
```

## reviewer

**Job:** Review diff. One line per issue. No praise.

Trigger: `/strike review` then paste diff (not full file)

Output:
```
L42: 🔴 bug: token null check missing. Add guard.
L87: 🟡 perf: n+1 query. Batch with Promise.all.
L103: 🟢 nit: rename x → userId.
```

Severity: 🔴 bug · 🟡 warning · 🟢 nit
