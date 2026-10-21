# Frontend API refactor (relaxed SOLID review)

Scope: `frontend/src/api/` (`Albums`, `Photos`, `UserAlbums`, `HealthCheck`, `Api`). Pure refactor: no behavior change, no contract change, no functional doc touched (`.claude/docs/` unaffected).

Problem: `list`, `get`, `create` and `upload` each repeat the same call mechanics (call id, session header, `try/catch`, `INTERNAL_ERROR` default, `"x" in body` / `"code" in body` branching). Each class repeats the `#client`/`#session` fields and constructor. Three error-code aliases name one type. A new endpoint is a copy of an 18-line block.

Each step keeps `bun run test`, lint, typecheck, build and `generate:check` green, and is structural only. Existing tests in `test/api/` are the safety net; add a test only for a collaborator that gains its own public behavior. Items are numbered in dependency order, impact beside each.

- [x] 1. One `ApiErrorCode` replaces `PhotoErrorCode`, `AlbumErrorCode`, `UserAlbumErrorCode`; update every importer (src and test). Impact: medium.
- [x] 2. One generic answer type: the error branch `{ status: "error"; code: ApiErrorCode }` is written once; `PhotosAnswer`, `UploadAnswer`, `AlbumsAnswer`, `AlbumAnswer`, `UserAlbumAnswer` keep their ok fields, so consumers do not change. Impact: medium.
- [x] 3. Extract the call mechanics into one collaborator that owns client and session: builds the header, catches failures into `INTERNAL_ERROR`, turns a reply body into the ok or error answer. Each endpoint method passes only its path, its request body and how to read the ok body. Move `Albums` first (list maps, get maps), tests green, then `UserAlbums` (retires `answerOf`), then `Photos`, then `HealthCheck` if it fits without growing. Impact: high.
- [x] 4. `Photos.upload`: extract the `FormData` and `bodySerializer` construction into a private method so `upload` reads like the other endpoints. Impact: low.
- [x] 5. `Api` builds the collaborator once and passes it to each endpoint class, so none of them takes `client` and `session`. Impact: low.

## Out of scope

- Interfaces for the endpoint classes: `Api` is the composition root and tests inject `fetch`, so the seam exists (no speculative DIP).
- Moving `PresentedAlbum` mapping out of the API classes: after step 3 it is the ok-reading argument.
- `ApiContext` hooks.

## Resolved

- Step 3 seam: class `CallSender` with `send(sending, readOk)`; `Call` is taken by the contract. Decision: `decisions/frontend-api-calls-go-through-one-call-sender.md`.
- `HealthCheck` stays outside the collaborator.
- Step 4 landed with step 3 (`Photos.#formOf`), and step 5 changed the endpoint constructors and their tests.

## Diagram

```mermaid
sequenceDiagram
    participant Caller as Component
    participant Endpoint as Albums / Photos / UserAlbums
    participant Call as CallSender
    participant Client as openapi-fetch client

    Caller->>Endpoint: list() / get() / create() / upload()
    Endpoint->>Call: path, request body, ok reader
    Call->>Call: build header (callId, session)
    Call->>Client: POST path
    alt reply has ok body
        Client-->>Call: body
        Call->>Endpoint: ok reader maps body
        Endpoint-->>Caller: { status: ok, ... }
    else reply has code
        Client-->>Call: body with code
        Call-->>Caller: { status: error, code }
    else call throws or body empty
        Call-->>Caller: { status: error, code: INTERNAL_ERROR }
    end
```
