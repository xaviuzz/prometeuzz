# Album contract shape

`Album` carries `reference`, `commercialName`, `albumSize` and `pageSize` (each `{ width, height }`, whole millimetres), `pageCount`, `binding` (`hardcover` or `softcover`) and `orientation` (`square`, `portrait` or `landscape`). `album.list` answers `{ albums }`; `album.get` takes `{ reference }` and answers `{ album }` or the error `ALBUM_NOT_FOUND`. Why: sizes are pairs that always travel together, so nesting them keeps each pair one value.
