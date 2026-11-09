# Domain has its own folder, one per concept

In the backend, `src/domain/` holds the model, one folder per functional concept as in `.claude/docs/`. Domain imports no other layer of the project, except `CallError` and the `ErrorCode` type from `call/`, which its errors extend and use to declare their code. A pure library with no I/O may be imported (`he` in `PageTitle`); anything that touches a technology belongs in `infrastructure/`. `src/infrastructure/` holds what depends on a technology (`transport/`, stores, page readers), and imports from domain. What a store throws goes with the store; what the model rejects goes with the model.

`src/call/` stays outside infrastructure: `Call`, `Reply` and `Body` are the RPC contract that operations speak in their signatures, so operations importing from infrastructure would invert the layers. `test/` mirrors `src/`.

Why: in fotoAlbum the entities sat under `stores/` and one concept was split across four folders, with the model importing against the direction of the layers. The entity is the stable part and the store the part to replace.
