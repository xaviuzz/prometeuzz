---
name: static-analysis
description: Static analysis report of a TypeScript and Bun project's code: coverage, LOC, cyclomatic complexity. Use for "análisis estático", "static analysis", "code report", "cobertura", "complejidad ciclomática".
---

A read-only report on one project, with its hot spots named. Nothing in the project changes; refactors are proposed, not run.

1. Locate the folder that holds `src/` and `test/` (for Sorzs, `backend/` or `frontend/`). Done when the folder is named.
2. Run `bun test --coverage` there. Done when the test count, line coverage and function coverage are read.
3. Run `.claude/skills/static-analysis/static-analysis.sh <that folder>`. It prints LOC for `src/` and `test/`, then the files with the highest cyclomatic complexity and FTA score. `fta-cli` runs through `bunx`; a permission denial stops the step and Xavier decides, never work around it. After a refactor, pass the refactored file's name as the second argument so its numbers print outside the worst eight. Done when both sections are printed.
4. Report in Spanish or English as Xavier wrote, one section each for coverage, LOC and complexity. Files under any `ui/` folder (generated shadcn components) are out of the report: the script skips them, and so do you in the coverage table. Name every file with cyclo over 10 or an assessment other than `OK`, and any file under 100% function coverage with the cause you verified (mark the rest "not verified"). Done when each hot spot has its file, its number and what drives it.
5. Offer a numbered list of refactors for the hot spots, in dependency order, and stop there until Xavier approves.

Run the project's tests again after any refactor Xavier approves.
