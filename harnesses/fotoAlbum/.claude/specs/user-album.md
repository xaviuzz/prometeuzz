# User album

Repos: `backend/`, `frontend/`, `e2e/`. Docs: `docs/user-album.md`, `docs/session.md`, `docs/album.md`. Decisions and their why: `.claude/decisions.md`, area "User album", plus "Session identity travels in Call" in "Session". No Penpot work.

Goal: choosing a card creates the user album on the backend; the making page, right of the photo tray, shows its faces one at a time with the binding mark, "n/N", "Anterior" and "Siguiente", also after a reload. `npm run e2e` proves it.

A step is done when its repo's tests, lint, typecheck and build pass (in `e2e/`, when `npm run e2e` is green); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A step marked "by hand" is marked only after Xavier confirms it. The shadcn `hover-card` component in step 5 is approved by this spec.

## Behavior

- `POST /userAlbum.create` takes `callId` and the model `reference`, and requires `sessionId` in the header. It answers the user album: `{ id, reference, commercialName, albumSize, pageSize, pageCount, binding, orientation }`. Errors: `SESSION_REQUIRED`, `ALBUM_NOT_FOUND` (unknown or withdrawn model), `USER_ALBUM_ALREADY_EXISTS`.
- `POST /userAlbum.get` requires `sessionId` and answers the same user album, or `SESSION_REQUIRED` or `USER_ALBUM_NOT_FOUND`.
- The user album is stored as `DATA_DIR/<sessionId>/user-album.json`. Its `id` is `Bun.randomUUIDv7()`. It copies the model's commercial name, measures and binding. Faces are not stored or sent.
- The browser session keeps only its identity. The frontend asks `userAlbum.get` on entering: "Cargando…" with `role="status"`, an `Alert` on failure.
- With a user album every address leads to `/confeccion`; without one, `/confeccion` and `/confeccion/<reference>` lead to `/`.
- Clicking a card calls `userAlbum.create`, disables that card meanwhile and navigates to `/confeccion` on success. On failure an `Alert` appears in the catalogue and nothing navigates.
- Making page: the photo tray at 25 % as now; to its right a header with the commercial name, a `HoverCard` (also on focus) revealing reference, album size, page size, page count, binding and orientation; below, the current face; below it "n/N"; below that "Anterior" (`ChevronLeft`) and "Siguiente" (`ChevronRight`).
- The face keeps the page size's proportion (`aspect-ratio` in its style), is as large as the free space allows and sits centred. A strip about 6 % of its width, with a soft gradient inwards, marks the binding edge; the face carries `data-binding-side="left" | "right"`: left on odd faces, right on even ones.
- Face 1 shows on opening; the position is not remembered. "Anterior" is disabled on face 1 and "Siguiente" on the last face.
- Starting over forgets the identity, so `/confeccion` leads to `/` and a new session can choose again.

## Steps

- [x] 1. Docs: `docs/user-album.md`, `docs/session.md`, and the decisions of area "User album".
- [x] 2. Contract (`backend/`, then `frontend/`): `/userAlbum.create` and `/userAlbum.get`, the `UserAlbum` schema, the codes `USER_ALBUM_ALREADY_EXISTS` and `USER_ALBUM_NOT_FOUND`. Copy the file to `frontend/`, run `generate`, add both routes to the `dev.ts` proxy. The correspondence test is red until step 3; the step is done when it is the only failing test in `backend/` and `frontend/` is fully green.
- [x] 3. Backend (`backend/`). Decisions: "User album operations", "User album lives on disk behind a store", "User album keeps the commercial name". Cycles, in this order, one go:
  1. `UserAlbum`: made from an `Album` with its copied commercial name, measures and binding, and a new id.
  2. `UserAlbumStore` under `DATA_DIR`: save and find by `SessionId`; the JSON survives a new store instance.
  3. `userAlbum.get`, with `SESSION_REQUIRED` and `USER_ALBUM_NOT_FOUND`.
  4. `userAlbum.create`, with `ALBUM_NOT_FOUND` for an unknown or withdrawn model and `USER_ALBUM_ALREADY_EXISTS`.
  Both registered in the `Server`. Check the Dockerfile still builds.
- [x] 4. Frontend, API and session (`frontend/`). Decisions: "The backend keeps the user album", "Session sheds the chosen album in the pages step". A user album client in `Api` (`create(reference)`, `get()`, never throwing, answering `{ status: "ok", userAlbum }` or `{ status: "error", code }`) and its hook `useUserAlbums`; `Session` is untouched. Tests fake `fetch`.
- [x] 5. Frontend, pages (`frontend/`). Decisions: "The making page has one route", "The header shows characteristics on hover", "A user album gate replaces the session gate", "The catalogue card is a button", "Face number and page proportion carry the face rules", "The card does nothing between pages substeps 1 and 2". Add shadcn `hover-card`.
  1. Structural: `UserAlbumGate` replaces `SessionGate` (asks `userAlbum.get` on entering and on a session change; context with `adopt`), the routes (`/confeccion`, redirects) and the loading and error states, without new behavior on screen. `Session` drops the chosen album and keeps only the identity: `choosing`, `path()` and `choose` go, `restore` ignores a stored `chosenReference` and `serialize` writes only the identity. The card has no action until substep 2.
  2. The card, now a `button`, creates the user album and hands it to `adopt`, with its disabled and failure states.
  3. `FaceViewer` with a `FaceNumber` value object and `PresentedAlbum.pageProportion()`: current face, proportion, binding mark, "n/N", "Anterior" and "Siguiente" with their limits.
  4. The header with its `HoverCard` (the commercial name is the trigger, opens on hover and focus), replacing `AlbumCharacteristics`; the making page no longer calls `album.get`.
  Tests render each part inside `ApiProvider` and a memory router.
- [x] 6. By hand: Xavier tries it with `e2e`'s `up` script (each seed's proportions, the binding mark on both sides, the hover, the limits, reload, start over and choose another) and confirms.
- [x] 7. E2E (`e2e/`): adapt `tests/choose-album.spec.ts` to the new flow (click a card, land on `/confeccion` showing the commercial name); add `tests/user-album.spec.ts`: see "1/N", press "Siguiente" and see "2/N", reload and see "1/N" with the same album. Red first, then green with `npm run e2e`.

## Out of scope

Photos on faces, the cover, double-page views, jumping to a face, thumbnails of faces, remembering the face, deleting or editing a user album, removing the user albums of forgotten sessions, Penpot.
