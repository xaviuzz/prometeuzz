# Decisions

Each decision and its why. Replace a bullet when the code changes it; do not stack a correction beside it.

- Fix #9230 inline in the `save-file-dialog` handler with `await fs.promises.writeFile(filePath, fileContents)`.
- A throwaway vitest harness (extraction to `saveFile.ts`, real temp dir) proved the fix test-first, then left the PR: the package has no unit-test setup and adding one is out of scope. The copy goes to `.claude/reference/`.
- The cancelled dialog (`filePath` undefined) stays out to keep the PR on the issue; the PR mentions it as a follow-up.
- Plan: `.claude/specs/9230-pr-ready.md`.
