# Backend refactor (SOLID and simplicity review)

One item at a time: explain it, agree the solution, then change. Each item keeps tests, lint, typecheck and build green and records its decision in `.claude/decisions/`. Items are numbered in the order they run.

- [x] 1. Errors carry their contract code (`CallError`).
- [x] 2. Drop `validate`; operations check the body inside `execute`.
- [ ] 3. `PhotoId` value object (format, generation); one owner for the thumbnail URL, now built in `Photo` and parsed in `ThumbnailRoute`; stop using `SessionId.pathIn` to build URLs.
- [ ] 4. Stores and routes: `PhotoStore.thumbnailOf` returns `undefined` where `UserAlbumStore.find` throws; `PhotoStore.list` swallows every error, not only `ENOENT`; `add` could take the `Picture`. `ThumbnailRoute` matches once and builds one 404; decide whether routes join the registry so `Server` loses its `if`.
- [ ] 5. `PhotoUpload` does too much and fills `photos` by side effect: introduce an object that collects accepted and rejected files; move the size limit and the refusal code to where they belong.
- [ ] 6. Split transport from handlers (JSON and multipart adapters share one failure path). Reverses `operations-serve-http-requests` and `upload-is-its-own-operation`; grill before building.
- [ ] 7. Domain, when the rule of three is met: `AlbumData` and `AlbumDescription` overlap, `binding` as a type, `Call` casts, `Bun.randomUUIDv7` inside the domain.
