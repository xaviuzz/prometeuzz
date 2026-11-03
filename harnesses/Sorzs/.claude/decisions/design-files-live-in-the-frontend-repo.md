# Design files live in the frontend repo

`PRODUCT.md`, `DESIGN.md` and `.impeccable/` sit at the root of `Sorzs-frontend`, and the frontend commits them. Why: Impeccable resolves its context from the git root of the repo it starts in, and the umbrella is not a repo, so files there are never found. Copies in the umbrella would drift; symlinks break on another checkout. The backoffice and every screen share one visual system, so one `DESIGN.md` serves the whole app.
