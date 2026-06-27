# Benchmark Results

Real token counts. Three-arm eval: baseline / terse / panda.

| Task | Baseline | Terse | Panda | Saved vs Terse |
|------|----------|-------|-------|---------------|
| Inject GA4 into 6 HTML files | 620 | 310 | 48 | 85% |
| Fix auth middleware bug | 704 | 380 | 121 | 68% |
| Set up Make.com webhook | 890 | 420 | 201 | 52% |
| Refactor callback to async/await | 387 | 210 | 88 | 58% |
| Build Vercel deploy config | 510 | 280 | 134 | 52% |
| Review PR for security issues | 678 | 450 | 398 | 12% |
| Docker multi-stage build | 1042 | 490 | 290 | 41% |
| Debug async race condition | 1200 | 560 | 232 | 59% |
| **Average** | **754** | **388** | **189** | **53%** |
