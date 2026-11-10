# The domain says sorz, and the word source names nothing

A sorz is the single web address Sorzs knows, the same for everyone who registers it (`docs/sorz.md`). A user's list holds sorz entries (`docs/sorz-list.md`). The census counts sorzs. The word "source" names none of these, in code, tests, contract, commands, screen texts, docs, specs and decisions. A word that is not about a sorz also avoids it: where the backend address comes from is its origin, and a search result names its sorz.

Why: "source" and "sorz" named the same thing in different places (`domain/source/` held sorzs, `operations/sorzs/` held the census of sources), so the same concept had two names and a reader could not tell whether two names meant two concepts. The product already says Sorzs; the code follows it.

How to apply: a new name for a sorz, its list, its entry or its census says sorz. The language section of the project `CLAUDE.md` holds the vocabulary, and a hook and a CI check warn when `source` comes back. The rename is tracked in `specs/sorz-vocabulary.md`.
