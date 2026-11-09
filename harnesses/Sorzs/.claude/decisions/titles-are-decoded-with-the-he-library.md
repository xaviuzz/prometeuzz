# Titles are decoded with the he library

A page title is turned from HTML character references to plain text inside `PageTitle`, before it is trimmed and cut, using the `he` package as a runtime dependency of the backend.

Why: Bun has no decoder, and a hand-made one would cover only a few named references. `he` knows them all, so `&eacute;` and `&amp;` read the same. Titles already registered are not migrated: they are learned once and never refreshed, and Xavier accepted leaving them.
