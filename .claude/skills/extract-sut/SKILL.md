---
name: extract-sut
description: SUT extraction for an existing test file. Use when its test bodies repeat construction or wiring of the Subject Under Test, or when assertions inspect internals instead of behavior.
---

Move everything that knows *how* the Subject Under Test (SUT) is built, driven and observed into one `SUT` class, so each test reads as behavior only. Structural change only: no test gains, loses or alters an expectation.

## 1. Frame

Read the test file. Name the one subject it tests.

- Two or more subjects: stop. Propose splitting the file first and wait. Extraction resumes per resulting file.
- Tests not green: stop and report. Extraction starts from green.
- Subject is a value object (static factories, no wiring to hide): stop, nothing to extract. Its tests already read as behavior only.

## 2. Plan

List, in order, what moves into `SUT`:

- **Construction**: dependencies, wiring, `new`. Fakes stay where they are, at the end of the file, and `SUT` instantiates them.
- **Actions**: one method per thing the tests do to the subject, named in domain vocabulary (`paste()`, not `executeCommand(deps)`).
- **Queries**: one method per thing the tests look at, so an assertion reads `sut.rhythmOf(note)` and never reaches into internals.

Present the plan and wait for approval. Ask about every ambiguity: unclear names, an assertion with no obvious query, a fake that serves two purposes.

## 3. Extract

One move per step. Run the tests after each step; each ends green. Stop on red and revert that step.

Shape: `class SUT` at the end of the file, created in `beforeEach`. Tests come first.

In Rust: `struct Sut` after the tests, built by a constructor called at the top of each test (no `beforeEach`). The assertion keeps the domain type.

## 4. Done

Done when all hold, checked by reading the file:

- No test body contains `new` of a dependency or a fake.
- Every assertion goes through a `SUT` query.
- Tests are green.

Report which holds and which does not.
