# Spec: make the #9230 fix PR-ready

Goal: one behavioral commit touching only `packages/desktop-electron/index.ts`, plus a release note, that maintainers can accept without new tooling.

Starting state: the fix lives in `saveFile.ts` with a vitest harness (`vitest.config.mts`, `test` script, vitest devDependency, `yarn.lock` line, `saveFile.test.ts`). The harness proved the fix test-first (red, then green) and is now removed from the diff, because `desktop-electron` has no unit-test setup and adding one is out of scope for the issue.

## Decisions

- Inline the fix in the `save-file-dialog` handler: `await fs.promises.writeFile(fileLocation.filePath, fileContents)` inside the existing `if (fileLocation)`. It fixes both the dropped `byteOffset`/`byteLength` and the `resolve()` that ran before the write finished.
- Leave the cancelled dialog out. `filePath` is `undefined` on cancel, so `writeFile` now rejects where it used to fail silently. The renderer does not await `saveFile`, so the expected effect is a console error only. Mention it in the PR as a follow-up. Reopen this decision if C2 shows a user-visible error.
- The PR states testing exactly: written test-first against a real temp directory, removed because the package has no unit-test setup, plus a manual export checked with `unzip -t`. The test goes in the PR body as a collapsed block. The PR never claims "fully tested".
- One commit, one branch (created by Xavier), message through `commit-message`.

## Steps

Each step is done when its stated check passes.

### A. Preserve the evidence

- [ ] A1. Copy `packages/desktop-electron/saveFile.test.ts` to `.claude/reference/saveFile.test.ts`. Done when the copy exists and `.claude/` does not appear in the repo diff.

### B. Revert to the minimal diff

- [ ] B1. In `index.ts`, restore the original handler, then replace the Promise body with the inline `await fs.promises.writeFile(...)`. Drop the `saveFile` import and set `SaveFileDialogPayload.fileContents` back to `string | Buffer`. Done when `index.ts` has no reference to `saveFile.ts` or `FileContents`.
- [ ] B2. Delete `saveFile.ts`, `saveFile.test.ts` and `vitest.config.mts`. Revert the `package.json` `test` script and `vitest` devDependency, and the `yarn.lock` line. Done when none of those files or entries remain.
- [ ] B3. Run the type check, `oxlint`, `oxfmt --check` and `yarn test` from the repo root. Done when all are clean and the diff lists only `index.ts`.

### C. Verify the real behavior (Xavier)

- [ ] C1. Rebuild with `yarn workspace desktop-electron watch`, export a budget, run `unzip -t` on the ZIP. Done when it reports no errors on the final diff.
- [ ] C2. Cancel the save dialog once. Done when the observed effect is recorded: console only, or user-visible. User-visible reopens the cancel decision.

### D. Prepare the PR

- [ ] D1. Draft the release note: `category: Bugfix`, `authors: [XaV1Uzz]`, one-line description. Xavier creates `upcoming-release-notes/<PR number>.md` after opening the PR, or runs `yarn generate:release-notes`. Done when the text is approved.
- [ ] D2. Draft the claim comment for #9230: the handler passes `.buffer` and ignores `byteOffset`/`byteLength`, and resolves before the write completes; PR to follow. Xavier posts it before opening the PR. Done when it is posted.
- [ ] D3. Xavier creates the branch (for example `fix-export-buffer-offset`). Propose the commit message through `commit-message`. Done when the single commit exists.
- [ ] D4. Draft the PR body in English with `mattpocock-skills:pr`: cause, fix, testing as worded above with the collapsed test block, and the cancel follow-up. Done when Xavier approves the text.

### E. Record

- [x] E1. Add to the project `CLAUDE.md`: vitest was tried and removed, and why; the cancel guard was left out, and why. Done when both decisions are recorded there.
