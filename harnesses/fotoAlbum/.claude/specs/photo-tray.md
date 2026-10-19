# Photo tray

Repos: `backend/`, `frontend/`, `e2e/`. Docs: `docs/photo.md`, `docs/session.md`. Decisions and their why: `.claude/decisions.md`, from "Photo tray slice" to "Photos of a forgotten session are left orphaned". No Penpot work.

Goal: the making page has a photo tray on the left where the person uploads several photos at once; the backend stores them against the session, makes their thumbnails and the tray shows them, also after a reload. `npm run e2e` proves it.

A step is done when its repo's tests, lint, typecheck and build pass (in `e2e/`, when `npm run e2e` is green); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A step marked "by hand" is marked only after Xavier confirms it. The `sharp` dependency in step 3 and the shadcn components the tray needs in step 4 are approved by this spec.

## Behavior

- Every call may carry `sessionId` in its header. `photo.list` and `photo.upload` require it and answer `SESSION_REQUIRED` without it.
- `POST /photo.upload` takes `multipart/form-data` with `callId`, `sessionId` and one or more files. It stores the JPEG, PNG and WebP files up to 25 MB, makes a thumbnail of each (longest side 256 px) and answers the stored photos as `{ id, thumbnailUrl }` in upload order, plus the rejected files with name and code (`UNSUPPORTED_FORMAT`, `TOO_LARGE`, `UNREADABLE_IMAGE`). A rejected file does not stop the others.
- `POST /photo.list` answers the photos of the session, oldest first.
- `GET /photos/<sessionId>/<photoId>/thumbnail` serves the thumbnail, immutable and cacheable.
- Photos are files under `DATA_DIR`, one folder per session.
- The tray takes the left quarter of the making page and the visible height. Thumbnails scroll inside it; "Subir fotos" (lucide `ImagePlus`) stays pinned below and opens a multi-file chooser for JPEG, PNG and WebP.
- While uploading, the button is disabled and shows a `Loader2` spinner; afterwards the new thumbnails go at the end. Rejected files are listed with name and reason until the next upload.
- States: "Cargando…" with `role="status"`, an `Alert` when the list or a whole upload fails, an `Empty` reading "Aún no hay fotos".
- Starting over gives an empty tray; the old photos stay on the backend, unreachable.

## Steps

- [x] 1. Docs: `docs/photo.md`, the photo lines of `docs/session.md`, and the decisions.
- [x] 2. Contract (`backend/`, then `frontend/`): `sessionId` in the call header, `/photo.upload` (multipart), `/photo.list`, the thumbnail GET route, their schemas and the codes `SESSION_REQUIRED`, `UNSUPPORTED_FORMAT`, `TOO_LARGE`, `UNREADABLE_IMAGE`. Copy the file to `frontend/`, run `generate`. The correspondence test covers the new routes and is red until step 3; the step is done when it is the only failing test in `backend/` and `frontend/` is fully green.
- [x] 3. Backend (`backend/`): add `sharp`. Decisions: "Session identity travels in `Call`" to "Request bodies up to 1 GB". Cycles, in this order, one go:
  1. Structural: `CallOperation.execute` receives the `Call`; `Call` reads the optional header `sessionId`. Build stays green.
  2. `SessionId`: required, safe as a folder name; otherwise `SESSION_REQUIRED`.
  3. `PhotoStore` under `DATA_DIR` (default `./data`): add and list, ids from `Bun.randomUUIDv7()`.
  4. `Thumbnailer` with `sharp`: 256 px, JPEG, EXIF rotation applied.
  5. `photo.list`.
  6. `photo.upload` as its own `Operation`, with the rejections and the transport errors.
  7. `ThumbnailRoute` for the GET path, wired in `Server`, with `maxRequestBodySize` at 1 GB.
  8. The correspondence test treats the thumbnail path as served apart from the operations.
  The Dockerfile installs dependencies (see decisions, "The backend image installs its dependencies"); check `sharp` locally.
- [x] 4. Frontend (`frontend/`): the photo client in `Api` (`list()`, `upload(files)`, never throwing) and its hook; the session identity travels in every call; the dev server proxies `photo.*` and `/photos/*` to `API_URL`. `PhotoTray` and its parts in `making/`, the 25 % layout in the making page, the states above. Add the shadcn components the tray needs. Tests fake `fetch`.
- [x] 5. By hand: Xavier tries it with `e2e`'s `up` script (several photos at once, one invalid file, reload, start over) and confirms.
- [x] 6. E2E (`e2e/`): upload two fixture images, see two thumbnails, reload and they remain, start over and the tray is empty. The backend image builds `sharp`; `DATA_DIR` is a temp directory. Red first, then green with `npm run e2e`.

## Out of scope

Deleting, reordering and renaming photos, drag-and-drop, progress per file, serving the original, formats beyond JPEG, PNG and WebP, removing photos of forgotten sessions, composing photos into an album, Penpot.
