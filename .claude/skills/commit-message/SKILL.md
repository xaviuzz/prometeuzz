---
name: commit-message
description: Commit message from the uncommitted delta, one line prefixed by a gitmoji. Use for "commit message", "mensaje de commit", or "what do I commit".
---

Compose one commit message for everything uncommitted. Xavier commits; the skill only prints the message.

## 1. Read the delta

Read-only git: `git status --short`, `git diff HEAD`, and open each untracked file. The delta is all of it, staged or not.

Clean tree: say so and stop.

## 2. Check the shape

Your rule: structural and behavioral changes never share a commit. Sort each hunk as structural (refactor, rename, move, format) or behavioral.

Mixed: warn, say how to split by file or hunk, then compose for the dominant change.

## 3. Compose

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

## 4. Output

Print the message alone.

Done when the message is one line, starts with a table gitmoji, fits 72 characters, and contains no single quote. Report any that fails.

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
