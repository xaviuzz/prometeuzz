# Domain has its own folder, one per concept

In the backend, `src/domain/` holds the model, one folder per functional concept as in `.claude/docs/`. Domain imports nothing from outside itself, except the `CallError` its errors extend. `src/infrastructure/` holds what depends on a technology (`transport/`, and stores or clients when they appear), and imports from domain. What a store throws goes with the store; what the model rejects goes with the model.

`src/call/` stays outside infrastructure: `Call`, `Reply` and `Body` are the RPC contract that operations speak in their signatures, so operations importing from infrastructure would invert the layers. `test/` mirrors `src/`. The skeleton has no domain yet, so the first concept creates `domain/`; version control keeps no empty folder.

Why: in fotoAlbum the entities sat under `stores/` and one concept was split across four folders, with the model importing against the direction of the layers. The entity is the stable part and the store the part to replace.
