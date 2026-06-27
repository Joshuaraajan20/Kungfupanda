---
name: panda-stats
trigger: /panda-stats
description: Show token usage and estimated savings for current session.
---

Read Claude Code session log.
Output:

```
SESSION STATS
─────────────────────
Input tokens:    4,821
Output tokens:     412  ← panda mode active
Estimated normal: 1,640
Tokens saved:    1,228  (74%)
Est. cost saved: $0.006
─────────────────────
Lifetime saved: [from log]
```

If session log unavailable: estimate from message count × avg token delta.
