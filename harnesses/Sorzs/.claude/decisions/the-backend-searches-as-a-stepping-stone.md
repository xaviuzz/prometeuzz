# The backend searches as a stepping stone

The first search runs in the backend: one search per sorz, merged into one reply. The destination stays what `CLAUDE.md` says, a module the backend serves and the frontend runs. Why: the contract, the box, the results area and the merging rule can be built and tried end to end before the module exists, and each sorz's search sits behind an interface the domain owns, so real searches replace the stand-in without touching the operation. What happens to the backend operation when the module arrives is open; see `docs/search.md`.
