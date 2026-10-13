---
name: commit-message
description: Commit message from the uncommitted delta, one line prefixed by a gitmoji. Use for "commit message", "mensaje de commit", or "what do I commit".
---

Compose one commit message per repository with uncommitted changes. Xavier commits; the skill only prints the messages.

## 1. Find the repositories

Work from absolute paths with `git -C`, whatever the shell directory is.

- Without an argument, the repositories are PrometeuZZ (`/home/xaviuzz/sandbox/PrometeuZZ`) and every project directly inside `Sandbox/` except `TMP/`. A directory counts only when `git -C <dir> rev-parse --show-toplevel` prints that same directory.
- With an argument, the only repository is `Sandbox/<argument>`.

## 2. Read each delta

Per repository, read-only git: `git -C <repo> status --short`, `git -C <repo> diff HEAD`, and open each untracked file. The delta is all of it, staged or not.

Clean repository: skip it. All clean: say so and stop.

## 3. Check the shape

Per repository, your rule: structural and behavioral changes never share a commit. Sort each hunk as structural (refactor, rename, move, format) or behavioral.

Mixed: warn, say how to split by file or hunk, then compose for the dominant change.

## 4. Compose

One message per changed repository.

`<gitmoji> <summary>`

- Gitmoji: the Unicode character from the table below, chosen by the dominant change.
- Summary: imperative, English, at most 72 characters in total, lowercase start, no trailing period. Names the change in domain vocabulary, never the files.
- Reword until the summary holds no single quote.

| Gitmoji | Change |
|---|---|
| ✨ | new behavior |
| 🐛 | bug fix |
| ♻️ | refactor, structural only |
| ✅ | tests |
| 📝 | docs |
| 🔥 | remove code or files |
| 🎨 | formatting, tidying |
| ⚡️ | performance |
| 🔧 | config |
| 📦 | dependencies |
| 🏗️ | architecture or layout |
| 🚚 | move or rename |
| 🧪 | experiment |
| 🎉 | initial commit |
| 🤖 | agent docs and skills (`CLAUDE.md`, `.claude/`) |

## 5. Output

Print each repository's name, then its message alone on the next line. A single changed repository prints the message alone, with no name.

Done when every changed repository has a message that is one line, starts with a table gitmoji, fits 72 characters, and contains no single quote. Report any that fails.

## Examples

| Delta | Message |
|---|---|
| New `RhythmMeter` class with its test | ✨ add rhythm meter for sentence length |
| Null check missing in `parseNote`, test added | 🐛 handle empty note in parser |
| Tests extract a `SUT` class, no expectation changed | ♻️ extract SUT from rhythm tests |
| `README.md` install section rewritten | 📝 clarify install steps |
| `src/util/` folder moved to `src/core/` | 🚚 move util into core |
| Edited `CLAUDE.md` plus a new skill | 🤖 add commit-message skill |
| Refactor of `Parser` plus a new `Tokenizer` feature | ✨ add tokenizer to parser (plus a warning outside the message: split the refactor into its own commit) |
