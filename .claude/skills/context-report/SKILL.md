---
name: context-report
description: Reports how full the context was at the end of previous sessions, as a percentage of the 1M limit. Use for "context report", "informe de contexto", "tamaño del contexto de sesiones anteriores".
---

1. Run `python3 -I .claude/skills/context-report/context-report.py [sessions]` from the project root; `sessions` defaults to 15, newest first.
2. Copy the script's full output into your reply, every row, as printed: Xavier does not see tool output. Rows over 10 % come bold with 🔺.
3. Under the table, one report line: the share of sessions over 10 % (the script's last line), then the 🔺 sessions with their percentages.
4. Reply in the language Xavier used.

Done when your reply holds every table row, and every figure comes from the script output.
