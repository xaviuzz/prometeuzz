# Contributing projects

A project whose `CLAUDE.md` has a `## Contributing` section exists to land changes upstream. The deliverable is a merged contribution.

- The project's own rules (`AGENTS.md`, lint config, review guidelines) win over PrometeuZZ's code-style conventions. Workflow principles stay: test-first, small steps, structural and behavioral changes separate.
- Choose an issue that has: no open or recent PR (`gh pr list --state all --search "<n> in:body,title"`), a diagnosis you can verify in the code, a small fix, and a test seam. Skip issues whose only fix is a docs note, or whose earlier PR went stale, unless Xavier wants them.
- Read the issue comments and linked PRs before proposing it; upstream maintainers' direction beats the reporter's suggested fix.
- Record the choice in the project `CLAUDE.md` under `## Current target`: issue number, files involved, why chosen, and what blocks the first cycle (e.g. no test setup).
- Claim the issue with a comment before opening a PR. Xavier posts it; Claude does not write to GitHub.
