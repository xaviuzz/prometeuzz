# Stores live together in a stores folder

In the backend, each store is the unit of cohesion: `src/stores/photo/` and `src/stores/userAlbum/` hold the store with its entity, ids and not-found or already-exists errors, and `src/stores/Stores.ts` groups the stores. Their tests mirror this in `test/stores/`. Why: the stores are the persistence seam, the part to replace later, and what a store returns and throws belongs with it.

Upload (`Picture`, the refusal errors, `UploadOutcome`) stays in `src/photo/`. Whether upload gets its own folder is open.

`ThumbnailRoute` lives in `src/resources/photo/`, mirroring `src/operations/photo/`: each registry folder holds its contract, its registry and the classes that serve its routes, grouped by concept.
