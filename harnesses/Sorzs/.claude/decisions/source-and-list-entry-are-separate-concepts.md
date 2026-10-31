# Source and list entry are separate concepts

`domain/source/` holds the source (a UUID the backend generates, and the address). `domain/source-list/` holds the list and its entries (a source and the user's name). A second registration of the same address reuses the existing source. Name uniqueness lives in the list. Why: the project description says the source is the same for anyone and the name belongs to the user; each has its own rules (`docs/source.md`, `docs/source-list.md`). There is no user table: with one user, the only list is "the list".
