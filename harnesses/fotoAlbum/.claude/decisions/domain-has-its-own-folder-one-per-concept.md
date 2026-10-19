# Domain has its own folder, one per concept

In the backend, `src/domain/` holds the model, one folder per functional concept as in `.claude/docs/`: `album/`, `userAlbum/`, `photo/` (`Photo`, `PhotoId`, `ThumbnailUrl` and their invalid-value errors) and `session/`. Domain imports nothing from outside itself.

`src/infrastructure/` holds what depends on a technology, and imports from domain: `stores/` (each store with the not-found or already-exists errors it throws, and `Stores.ts`), `imaging/` (`Picture`, which depends on sharp, and the refusal errors it throws) and `transport/`.

`src/call/` stays outside infrastructure: `Call`, `Reply` and `Body` are the RPC contract that operations speak in their signatures, so operations importing from infrastructure would invert the layers. `UploadOutcome` is the reply of the upload and lives in `src/operations/photo/`. `test/` mirrors `src/`.

Why: the entities sat under `stores/` and the photo concept was split across four folders, with `Photo` importing against the direction of the layers. The entity is the stable part and the store the part to replace; what the store throws goes with the store, what the model rejects goes with the model.

Replaces "Stores live together in a stores folder"; settles its open question on where upload goes.
