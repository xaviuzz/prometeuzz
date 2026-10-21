# React contexts share one folder

`SessionContext` and `UserAlbumContext` live in `src/contexts/`, tested in `test/contexts/`. Each used to sit alone in a folder named after its concept (`session/`, `userAlbum/`). Why: two single-file folders were noise, and the rule of three says a concept folder waits until it has more than its context. `ApiContext` stays in `src/api/`: it changes together with `Api.ts`.
