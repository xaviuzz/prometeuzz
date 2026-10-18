# Choose an album

Repos: `backend/`, `frontend/`, `e2e/`. Docs: `docs/album.md`. Decisions and their why: `.claude/decisions.md`.

Goal: the home page lists the catalogue's albums as cards in a horizontal row; clicking a card opens the making page, which shows that album's commercial name and characteristics. `bun run e2e` proves it.

A step is done when its repo's tests, lint, typecheck and build pass (in `e2e/`, when `npm run e2e` is green); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A step marked "by hand" is marked only after Xavier confirms it. The `react-router` dependency in step 4 is approved by this spec.

## Behavior

- `POST /album.list` answers every album of the catalogue. `POST /album.get` answers the album of a reference, or the error `ALBUM_NOT_FOUND`.
- The catalogue lives in memory and starts with three albums: a square hardcover, a portrait softcover and a landscape softcover. There is no create yet; real storage arrives with it.
- Home (`/`): title "Elige un álbum" and a centered row of cards covering 50 % of the screen width, scrolling sideways when the cards overflow. Each card is one link showing the commercial name, album size, page count and binding.
- Loading shows nothing alarming; a failed call shows an error message; an empty catalogue shows an empty message.
- Making page (`/confeccion/:reference`): the commercial name as heading, then reference, album size, page size, page count, binding and orientation, and a link "Volver al catálogo". An unknown reference shows "Álbum no encontrado". Clicking a card only navigates; nothing is stored.
- The interface is in Spanish; code and contract are in English.

## Steps

- [x] 1. Contract (`backend/`, then `frontend/`): add `/album.list` and `/album.get` to `openapi.yaml` with their call, reply and `Album` schemas (reference, commercial name, album size, page size, page count, binding, orientation), copy the file to `frontend/`, run `generate`. The contract correspondence test is red until step 2.
- [x] 2. Backend (`backend/`): an `Album` with the rules of `docs/album.md` (orientation derived from the size), an in-memory catalogue with the three-album seed, and the operations `album.list` and `album.get` registered. Add `ALBUM_NOT_FOUND` to the contract's error codes.
- [ ] 3. Frontend, API (`frontend/`): an album client in `Api` with `list()` and `get(reference)`, answering the albums or an error, never throwing; `useAlbums()`-style hook beside `useHealthCheck()`. Tests fake `fetch`.
- [ ] 4. Frontend, pages (`frontend/`): add `react-router`; the dev server proxies `album.*` to `API_URL` and serves `index.html` on any path. Home with the card row and its three states; making page with its characteristics and the not-found state. Tests render each page inside `ApiProvider` and a memory router.
- [ ] 5. E2E (`e2e/`): `tests/choose-album.spec.ts` opens `/`, expects the seed's cards, clicks one and expects the making page with that album's commercial name and characteristics. Red first, then green with `npm run e2e`.

## Out of scope

Create, rename and withdraw albums, persistence, concrete albums and anything stored on selection, photos and layout, the open questions on withdrawn albums in `docs/album.md`, a theme toggle.
