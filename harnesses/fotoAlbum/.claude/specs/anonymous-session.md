# Anonymous session

Repos: `frontend/`, `e2e/`. Docs: `docs/session.md`, `docs/album.md`. Decisions and their why: `.claude/decisions.md`, area "Session", plus "Penpot only when asked" in "Design". No Penpot work.

Goal: the app remembers the chosen album between visits through an anonymous session; the header shows its avatar, whose menu starts over. `npm run e2e` proves it.

A step is done when its repo's tests, lint, typecheck and build pass (in `e2e/`, when `npm run e2e` is green); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A step marked "by hand" is marked only after Xavier confirms it. The shadcn components in step 4 are approved by this spec.

## Behavior

- A session starts by itself and is stored in the browser. Visiting the app again finds the same session.
- Clicking a card records its album in the session and opens its making page.
- With a chosen album, any address leads to `/confeccion/<chosen reference>`. With none, `/confeccion/<anything>` leads to `/`.
- The making page has no "Volver al catálogo" link.
- The header shows the avatar on every page. Its menu has "Volver a empezar", which asks confirmation. Confirming gives a new session, a new avatar, and lands on `/`; cancelling changes nothing.
- A stored session that cannot be read, or a browser without storage, gives a working session that is not remembered.

## Steps

- [x] 1. Docs: `docs/session.md`, the choosing paragraph of `docs/album.md`, and the decisions.
- [x] 2. Frontend, session (`frontend/`): `Session` (identity, chosen album, choosing, starting a new one, where it belongs, text to store and restore it), the avatar colour of an identity, and `SessionStore` over the browser storage that never throws. Pure tests, no React.
- [x] 3. Frontend, routing (`frontend/`): `SessionProvider` and its hook; a gate in `App` that sends every address to where the session belongs; `AlbumCard` records the choice; `main.tsx` wires the browser store. Remove "Volver al catálogo".
- [x] 4. Frontend, header (`frontend/`): add shadcn `avatar`, `dropdown-menu` and `alert-dialog`; `SessionMenu` in `layout/` inside `Header`. By hand: Xavier tries it with `e2e`'s `up` script and confirms.
- [x] 5. E2E (`e2e/`): choose an album, reload and stay on its making page; start over and land on the catalogue with every card back. Update `choose-album.spec.ts`, which expects the removed link. Red first, then green with `npm run e2e`.

## Out of scope

Backend and contract, accounts, names, sharing between tabs or devices, anything stored in the session besides the chosen album, Penpot.
