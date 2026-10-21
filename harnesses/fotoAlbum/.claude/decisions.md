# fotoAlbum decisions

One file per decision in `decisions/`, listed here by area. Read only the files of the area you work in. Record a new decision as its own file with the title as its heading, and add its line under its area here; a file with no line, or a line with no file, is a defect. Split an area past 15 decisions.

## Umbrella and workflow

- [Umbrella of two repos](decisions/umbrella-of-two-repos.md)
- [Short clone names](decisions/short-clone-names.md)
- [Each repo carries its own CLAUDE.md](decisions/each-repo-carries-its-own-claude-md.md)
- [Pipelines and deploy deferred](decisions/pipelines-and-deploy-deferred.md)
- [Vertical slices, health check first](decisions/vertical-slices-health-check-first.md)

## Contract

- [Backend owns the contract](decisions/backend-owns-the-contract.md)
- [RPC API, not REST](decisions/rpc-api-not-rest.md)
- [Call and Reply: header and body](decisions/call-and-reply-header-and-body.md)
- [Errors live in the message](decisions/errors-live-in-the-message.md)
- [Contract conformance by correspondence test](decisions/contract-conformance-by-correspondence-test.md)
- [Empty callId counts as missing](decisions/empty-callid-counts-as-missing.md)
- [Call and Reply, not Request and Response](decisions/call-and-reply-not-request-and-response.md)

## Backend

- [Backend tooling: Bun native plus Biome](decisions/backend-tooling-bun-native-plus-biome.md)
- [Operations are objects behind a registry](decisions/operations-are-objects-behind-a-registry.md)
- [Call parse failure is an exception](decisions/call-parse-failure-is-an-exception.md)
- [Unknown operation is a Null Object that serves 404](decisions/unknown-operation-is-a-null-object-that-serves-404.md)
- [Operations serve HTTP requests](decisions/operations-serve-http-requests.md)
- [Backend CI gate](decisions/backend-ci-gate.md)
- [Body is an object; Call answers for itself](decisions/body-is-an-object-call-answers-for-itself.md)
- [The backend image installs its dependencies](decisions/the-backend-image-installs-its-dependencies.md)
- [Errors carry their contract code](decisions/errors-carry-their-contract-code.md)
- [Operations validate inside execute](decisions/operations-validate-inside-execute.md)
- [Transport is separate from operations](decisions/transport-is-separate-from-operations.md)
- [Routes are a map handed to Bun.serve](decisions/routes-are-a-map-handed-to-bun-serve.md)
- [Domain has its own folder, one per concept](decisions/domain-has-its-own-folder-one-per-concept.md)
- [Domain primitives become value objects](decisions/domain-primitives-become-value-objects.md)

## Frontend foundation

- [Frontend tooling: Bun native, no Vite](decisions/frontend-tooling-bun-native-no-vite.md)
- [Generated client: openapi-typescript and openapi-fetch](decisions/generated-client-openapi-typescript-and-openapi-fetch.md)
- [Dev reaches the backend through a proxy](decisions/dev-reaches-the-backend-through-a-proxy.md)
- [Flexoki palette, light and dark](decisions/flexoki-palette-light-and-dark.md)
- [Health mark has three states](decisions/health-mark-has-three-states.md)
- [Frontend skills at project level](decisions/frontend-skills-at-project-level.md)
- [React and Testing Library peers arrive in the skeleton](decisions/react-and-testing-library-peers-arrive-in-the-skeleton.md)
- [Frontend build is a script, not the CLI](decisions/frontend-build-is-a-script-not-the-cli.md)
- [Biome parses Tailwind directives](decisions/biome-parses-tailwind-directives.md)
- [Frontend stays on TypeScript 5](decisions/frontend-stays-on-typescript-5.md)
- [Generated schema is checked by regeneration](decisions/generated-schema-is-checked-by-regeneration.md)
- [HealthCheck wraps the generated client; tests fake fetch](decisions/healthcheck-wraps-the-generated-client-tests-fake-fetch.md)
- [The API reaches components through one ApiProvider](decisions/the-api-reaches-components-through-one-apiprovider.md)
- [Frontend CI gate](decisions/frontend-ci-gate.md)

## Frontend structure

- [react-router for two pages](decisions/react-router-for-two-pages.md)
- [Interface in Spanish](decisions/interface-in-spanish.md)
- [Pages load their own data](decisions/pages-load-their-own-data.md)
- [Loading, error and empty states](decisions/loading-error-and-empty-states.md)
- [Reading states live in one ReadingView](decisions/reading-states-live-in-one-reading-view.md)
- [The gate shows through a standing](decisions/the-gate-shows-through-a-standing.md)
- [Page parts live in their own components](decisions/page-parts-live-in-their-own-components.md)
- [Components grouped by feature](decisions/components-grouped-by-feature.md)
- [Session menu is composed of avatar and dialog](decisions/session-menu-is-composed-of-avatar-and-dialog.md)
- [Domain folder and colocated helpers](decisions/domain-folder-and-colocated-helpers.md)
- [React contexts share one folder](decisions/react-contexts-share-one-folder.md)
- [Frontend API calls go through one CallSender](decisions/frontend-api-calls-go-through-one-call-sender.md)

## E2E

- [E2E is a third repo, composing the other two](decisions/e2e-is-a-third-repo-composing-the-other-two.md)
- [E2E covers the happy path only](decisions/e2e-covers-the-happy-path-only.md)
- [E2E frontend runs the dev server](decisions/e2e-frontend-runs-the-dev-server.md)
- [Playwright on Node in the official image](decisions/playwright-on-node-in-the-official-image.md)
- [Compose waits on healthchecks](decisions/compose-waits-on-healthchecks.md)
- [E2E adds @types/node](decisions/e2e-adds-types-node.md)
- [E2E Compose uses host networking](decisions/e2e-compose-uses-host-networking.md)
- [E2E CI gate](decisions/e2e-ci-gate.md)
- [Bring the stack up for manual checks](decisions/bring-the-stack-up-for-manual-checks.md)
- [E2E uses committed fixtures and an explicit DATA_DIR](decisions/e2e-uses-committed-fixtures-and-an-explicit-data-dir.md)

## Albums

- [Album is a catalogue model](decisions/album-is-a-catalogue-model.md)
- [Albums are withdrawn, never deleted](decisions/albums-are-withdrawn-never-deleted.md)
- [Album reference is typed by the user](decisions/album-reference-is-typed-by-the-user.md)
- [Album measures: free millimetres, no limits](decisions/album-measures-free-millimetres-no-limits.md)
- [First slice: choose an album](decisions/first-slice-choose-an-album.md)
- [Catalogue in memory with a seed](decisions/catalogue-in-memory-with-a-seed.md)
- [Choosing an album stores nothing](decisions/choosing-an-album-stores-nothing.md)
- [Album contract shape](decisions/album-contract-shape.md)
- [Orientation is computed before serving](decisions/orientation-is-computed-before-serving.md)
- [Album reference lookup ignores case](decisions/album-reference-lookup-ignores-case.md)
- [Album seed](decisions/album-seed.md)
- [Album lookup takes the typed text](decisions/album-lookup-takes-the-typed-text.md)
- [Spanish labels for album values](decisions/spanish-labels-for-album-values.md)
- [Albums are presented by a decorator](decisions/albums-are-presented-by-a-decorator.md)
- [Catalogue takes half the window and fits up to three albums](decisions/catalogue-takes-half-the-window-and-fits-up-to-three-albums.md)

## User album

- [User album copies its model](decisions/user-album-copies-its-model.md)
- [Binding side follows the face number](decisions/binding-side-follows-the-face-number.md)
- [User album slice](decisions/user-album-slice.md)
- [The backend keeps the user album](decisions/the-backend-keeps-the-user-album.md)
- [User album operations](decisions/user-album-operations.md)
- [User album lives on disk behind a store](decisions/user-album-lives-on-disk-behind-a-store.md)
- [User album keeps the commercial name](decisions/user-album-keeps-the-commercial-name.md)
- [User album is made and read back by itself](decisions/user-album-is-made-and-read-back-by-itself.md)
- [Session sheds the chosen album in the pages step](decisions/session-sheds-the-chosen-album-in-the-pages-step.md)
- [The frontend presents a user album as an album](decisions/the-frontend-presents-a-user-album-as-an-album.md)
- [The making page has one route](decisions/the-making-page-has-one-route.md)
- [The header shows characteristics on hover](decisions/the-header-shows-characteristics-on-hover.md)
- [A user album gate replaces the session gate](decisions/a-user-album-gate-replaces-the-session-gate.md)
- [The catalogue card is a button](decisions/the-catalogue-card-is-a-button.md)
- [Face number and page proportion carry the face rules](decisions/face-number-and-page-proportion-carry-the-face-rules.md)
- [The card does nothing between pages substeps 1 and 2](decisions/the-card-does-nothing-between-pages-substeps-1-and-2.md)
- [Photo list counts only photo folders](decisions/photo-list-counts-only-photo-folders.md)
- [The face fits the free space with container units](decisions/face-fits-the-free-space-with-container-units.md)
- [The binding side attribute lives on the face](decisions/binding-side-attribute-lives-on-the-face.md)

## Session

- [Anonymous session lives in the browser](decisions/anonymous-session-lives-in-the-browser.md)
- [Choosing an album is recorded in the anonymous session](decisions/choosing-an-album-is-recorded-in-the-anonymous-session.md)
- [Starting over: avatar menu with confirmation](decisions/starting-over-avatar-menu-with-confirmation.md)
- [Avatar colour follows the session identity](decisions/avatar-colour-follows-the-session-identity.md)
- [Session storage degrades to memory](decisions/session-storage-degrades-to-memory.md)
- [A new session is stored when it starts](decisions/a-new-session-is-stored-when-it-starts.md)
- [shadcn components for the session menu](decisions/shadcn-components-for-the-session-menu.md)
- [The backend receives the session identity](decisions/the-backend-receives-the-session-identity.md)
- [Session identity travels in Call](decisions/session-identity-travels-in-call.md)
- [The frontend stamps the session identity through Session](decisions/the-frontend-stamps-the-session-identity-through-session.md)

## Design

- [Penpot design: one page per screen, light mode only](decisions/penpot-design-one-page-per-screen-light-mode-only.md)
- [Penpot only when asked](decisions/penpot-only-when-asked.md)

## Photo tray

- [Photo tray slice](decisions/photo-tray-slice.md)
- [Upload is multipart, the one non-JSON operation](decisions/upload-is-multipart-the-one-non-json-operation.md)
- [Thumbnails are made by sharp](decisions/thumbnails-are-made-by-sharp.md)
- [Photos live on disk behind a PhotoStore](decisions/photos-live-on-disk-behind-a-photostore.md)
- [Thumbnails are served by a GET route](decisions/thumbnails-are-served-by-a-get-route.md)
- [Photos of a forgotten session are left orphaned](decisions/photos-of-a-forgotten-session-are-left-orphaned.md)
- [Rejected files have their own code enum](decisions/rejected-files-have-their-own-code-enum.md)
- [Upload errors follow the RPC rules](decisions/upload-errors-follow-the-rpc-rules.md)
- [Thumbnails are always JPEG](decisions/thumbnails-are-always-jpeg.md)
- [Upload is its own Operation](decisions/upload-is-its-own-operation.md)
- [Photo ids are UUIDv7 and order comes from them](decisions/photo-ids-are-uuidv7-and-order-comes-from-them.md)
- [Photo layout on disk](decisions/photo-layout-on-disk.md)
- [A file is judged by its bytes](decisions/a-file-is-judged-by-its-bytes.md)
- [Request bodies up to 1 GB](decisions/request-bodies-up-to-1-gb.md)
- [The tray scrolls natively and keeps its own state](decisions/the-tray-scrolls-natively-and-keeps-its-own-state.md)
- [Photo id and thumbnail URL have one owner](decisions/photo-id-and-thumbnail-url-have-one-owner.md)
- [Photo store refuses like the user album store](decisions/photo-store-refuses-like-the-user-album-store.md)
- [A refused file carries its rejection code](decisions/a-refused-file-carries-its-rejection-code.md)
