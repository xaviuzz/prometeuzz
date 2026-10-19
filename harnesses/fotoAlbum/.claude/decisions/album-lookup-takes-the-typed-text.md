# Album lookup takes the typed text

`Catalogue.find` takes the text typed by the caller and compares it, ignoring capitals, with each album's reference. A text that is not a well-formed reference simply matches nothing and answers `ALBUM_NOT_FOUND`; `Reference` is validated only when an album is created. `AlbumNotFoundError` is mapped to `ALBUM_NOT_FOUND` in `CallOperation`. Why: consulting needs no validation, and a malformed lookup is just an album that does not exist.
