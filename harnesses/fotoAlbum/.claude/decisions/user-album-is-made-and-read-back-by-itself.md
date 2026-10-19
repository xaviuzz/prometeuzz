# User album is made and read back by itself

`UserAlbum` wraps the model `Album` and an id. `UserAlbum.from(model)` makes a new one and generates the id with `Bun.randomUUIDv7()`, so the id needs no disk to be tested. `UserAlbum.of(data)` reads one back from its stored JSON through the same `Album` validations; the file is the model's description plus the id. Why: one source of validation, and a model's later change or withdrawal cannot touch a user album already made (extends "User album copies its model").

`UserAlbumStore.save` writes with an exclusive flag and fails with `UserAlbumAlreadyExistsError` when the file exists; the operation does not look first. Why: two simultaneous creates of one session must not both pass a prior check, and the rule then lives in one place.

`userAlbum.create` checks in this order: session, model, existing user album. A withdrawn model with an existing user album answers `ALBUM_NOT_FOUND`. Why: Xavier's choice; the session is the caller's identity, and the model is validated before the state of the session.
