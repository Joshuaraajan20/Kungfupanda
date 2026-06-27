---
name: panda-compress
trigger: /panda-compress <filepath>
description: Rewrite memory files into lean format. Cuts ~46% input tokens every session.
---

Rewrite target file (CLAUDE.md, project notes, todo lists) into compressed format.

Rules:
- Drop: filler words, verbose phrasing, redundant context
- Keep: all technical substance, code blocks, URLs, file paths, exact commands
- Preserve: structure, headings, lists — just compress the prose
- Backup: save original as FILE.original.md before overwriting

Output: compressed file + savings summary:
```
Compressed: CLAUDE.md
Original:   1,122 tokens
Compressed:   636 tokens
Saved:        486 tokens (43%)
Backup:     CLAUDE.md.original
```
