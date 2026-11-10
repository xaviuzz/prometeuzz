# Sorzs decisions

The first entries were inherited from the fotoAlbum boilerplate (tag `boilerplate-v2`); the rest are Sorzs's own. Each why holds until a new entry replaces it.

One file per decision in `decisions/`, listed here by area. Read only the files of the area you work in. Record a new decision as its own file with the title as its heading, and add its line under its area here; a file with no line, or a line with no file, is a defect. Split an area past 15 decisions.

## Umbrella and workflow

- [Umbrella of four repos](decisions/umbrella-of-four-repos.md)
- [Vertical slices, health check first](decisions/vertical-slices-health-check-first.md)
- [CI gates; no deploy](decisions/ci-gates-and-no-deploy.md)

## Contract

- [Backend owns the contract](decisions/backend-owns-the-contract.md)
- [RPC API, not REST](decisions/rpc-api-not-rest.md)
- [Call and Reply: header and body](decisions/call-and-reply-header-and-body.md)
- [Errors live in the message](decisions/errors-live-in-the-message.md)
- [Contract conformance by correspondence test](decisions/contract-conformance-by-correspondence-test.md)
- [The token travels in the Authorization header](decisions/the-token-travels-in-the-authorization-header.md)

## Backend structure

- [Backend tooling: Bun native plus Biome](decisions/backend-tooling-bun-native-plus-biome.md)
- [The backend image installs its dependencies](decisions/the-backend-image-installs-its-dependencies.md)
- [Body is an object; Call answers for itself](decisions/body-is-an-object-call-answers-for-itself.md)
- [Operations validate inside execute](decisions/operations-validate-inside-execute.md)
- [Transport is separate from operations](decisions/transport-is-separate-from-operations.md)
- [Operations sit in a registry that hands Bun.serve its routes](decisions/operations-sit-in-a-registry-that-hands-bun-serve-its-routes.md)
- [Domain has its own folder, one per concept](decisions/domain-has-its-own-folder-one-per-concept.md)
- [toJSON only serializes](decisions/tojson-only-serializes.md)
- [HttpPageReader delegates redirects and favicons](decisions/http-page-reader-delegates-redirects-and-favicons.md)
- [Titles are decoded with the he library](decisions/titles-are-decoded-with-the-he-library.md)
- [Infrastructure is organized by technology](decisions/infrastructure-is-organized-by-technology.md)

## Backend users and access

- [The token is signed and never expires](decisions/the-token-is-signed-and-never-expires.md)
- [Users come from one SEED_USERS variable, with an optional role](decisions/users-come-from-one-seed-users-variable.md)
- [Users persist in SQLite and the seed only adds the missing](decisions/users-persist-in-sqlite-and-the-seed-only-adds-the-missing.md)
- [The Users section operations require the admin role](decisions/the-users-section-operations-require-the-admin-role.md)
- [The last admin cannot be made a user](decisions/the-last-admin-cannot-be-made-a-user.md)
- [The Roster owns the user rules](decisions/the-roster-owns-the-user-rules.md)
- [The Sorzs section reads a SourceCensus](decisions/the-sorzs-section-reads-a-source-census.md)

## Frontend foundation

- [Frontend tooling: Bun native, no Vite](decisions/frontend-tooling-bun-native-no-vite.md)
- [Frontend and CLI stay on TypeScript 5](decisions/frontend-and-cli-stay-on-typescript-5.md)
- [Frontend skills at project level](decisions/frontend-skills-at-project-level.md)
- [Frontend components are grouped by feature](decisions/frontend-components-are-grouped-by-feature.md)
- [Dev reaches the backend through a proxy](decisions/dev-reaches-the-backend-through-a-proxy.md)
- [Flexoki palette, light and dark](decisions/flexoki-palette-light-and-dark.md)
- [Wordmark in Rouge Script from a Google Fonts link](decisions/wordmark-in-rouge-script-from-google-fonts.md)
- [Health mark has three states](decisions/health-mark-has-three-states.md)
- [The backoffice lives at a path, without a router](decisions/the-backoffice-lives-at-a-path-without-a-router.md)
- [Action buttons show an icon, never text](decisions/action-buttons-show-an-icon-never-text.md)
- [Design files live in the frontend repo](decisions/design-files-live-in-the-frontend-repo.md)

## Frontend API

- [Generated client: openapi-typescript and openapi-fetch](decisions/generated-client-openapi-typescript-and-openapi-fetch.md)
- [HealthCheck wraps the generated client; tests fake fetch](decisions/healthcheck-wraps-the-generated-client-tests-fake-fetch.md)
- [The API reaches components through one ApiProvider](decisions/the-api-reaches-components-through-one-apiprovider.md)
- [The session is an object outside React](decisions/the-session-is-an-object-outside-react.md)
- [The session keeps the token in localStorage](decisions/the-session-keeps-the-token-in-localstorage.md)
- [API wrappers throw refusals and let network failures through](decisions/api-wrappers-throw-refusals-and-let-network-failures-through.md)
- [API operations are grouped by resource, like the backend](decisions/api-operations-are-grouped-by-resource-like-the-backend.md)
- [Logout only forgets the token in the browser](decisions/logout-only-forgets-the-token-in-the-browser.md)
- [The login reply carries the role](decisions/the-login-reply-carries-the-role.md)

## Add dialog and list

- [A SourcesProvider owns the reading; the dialog reports what it added](decisions/sources-provider-owns-the-reading-dialog-reports-onadded.md)
- [The add dialog says URL and Title and keeps an sr-only description](decisions/add-dialog-says-url-and-title-and-keeps-an-sr-only-description.md)
- [The add dialog shows the favicon beside the title field](decisions/the-add-dialog-shows-the-favicon-beside-the-title-field.md)
- [A long title is shortened only as a suggestion](decisions/a-long-title-is-shortened-only-as-a-suggestion.md)
- [Clicking a candidate overwrites address and name](decisions/clicking-a-candidate-overwrites-address-and-name.md)
- [Stale inspect replies are discarded](decisions/stale-inspect-replies-are-discarded.md)
- [The add form empties when the dialog closes](decisions/the-add-form-empties-when-the-dialog-closes.md)
- [Repeated candidate titles are not collapsed](decisions/repeated-candidate-titles-are-not-collapsed.md)

## Search

- [The backend searches as a stepping stone](decisions/the-backend-searches-as-a-stepping-stone.md)
- [The stand-in result is a Google search limited to the site](decisions/the-stand-in-result-is-a-google-search-limited-to-the-site.md)
- [The search query is a value object](decisions/the-search-query-is-a-value-object.md)
- [Each result names its source as the list does](decisions/each-result-names-its-source-as-the-list-does.md)

## E2E

- [E2E is a third repo, composing the other two](decisions/e2e-is-a-third-repo-composing-the-other-two.md)
- [E2E covers the happy path only](decisions/e2e-covers-the-happy-path-only.md)
- [E2E frontend runs the dev server](decisions/e2e-frontend-runs-the-dev-server.md)
- [Playwright on Node in the official image](decisions/playwright-on-node-in-the-official-image.md)
- [Compose waits on healthchecks](decisions/compose-waits-on-healthchecks.md)
- [E2E Compose uses host networking](decisions/e2e-compose-uses-host-networking.md)
- [Bring the stack up for manual checks](decisions/bring-the-stack-up-for-manual-checks.md)
- [The sample site has its own compose file](decisions/sample-site-has-its-own-compose-file.md)
- [Persistence is not tested in e2e](decisions/persistence-is-not-tested-in-e2e.md)

## Sources, domain

- [Sources persist in SQLite as JSON documents](decisions/sources-persist-in-sqlite-as-json-documents.md)
- [The repository is told what was added](decisions/the-repository-is-told-what-was-added.md)
- [Each entry row carries its owner](decisions/each-entry-row-carries-its-owner.md)
- [Source and list entry are separate concepts](decisions/source-and-list-entry-are-separate-concepts.md)
- [Source identity is the exact address](decisions/source-identity-is-the-exact-address.md)
- [Registration order: body, page, address, name](decisions/registration-order-body-page-address-name.md)
- [Title and favicon belong to the source; the name stays optional](decisions/title-and-favicon-belong-to-the-source-the-name-stays-optional.md)
- [A missing part is a null object, not null](decisions/a-missing-part-is-a-null-object-not-null.md)
- [WebAddress owns what is known about a web address](decisions/web-address-owns-what-is-known-about-an-address.md)

## Sources, page reading and candidates

- [The backend reads the page for title and favicon](decisions/the-backend-reads-the-page-for-title-and-favicon.md)
- [Reading a page is bounded and never fails the registration](decisions/reading-a-page-is-bounded-and-never-fails-the-registration.md)
- [The page reader is an interface the domain owns](decisions/the-page-reader-is-an-interface-the-domain-owns.md)
- [Candidates are the origin and each path prefix, the pasted address as pasted](decisions/candidates-are-the-origin-and-each-path-prefix.md)
- [Only candidates with a title are offered](decisions/only-candidates-with-a-title-are-offered.md)
- [Inspect gains candidates instead of a new operation](decisions/inspect-gains-candidates-instead-of-a-new-operation.md)
- [Candidates are read in parallel, capped at five](decisions/candidates-are-read-in-parallel-capped-at-five.md)

## CLI structure

- [The CLI is a fourth repo](decisions/the-cli-is-a-fourth-repo.md)
- [The CLI keeps its state in one folder](decisions/the-cli-keeps-its-state-in-one-folder.md)
- [The CLI is Bun native with no prompt library](decisions/the-cli-is-bun-native-with-no-prompt-library.md)
- [The CLI translates invalid credentials in the API layer](decisions/the-cli-translates-invalid-credentials-in-the-api-layer.md)
- [The CLI builds its client on every call](decisions/the-cli-builds-its-client-on-every-call.md)
- [The CLI keeps the typed username with the pass](decisions/the-cli-keeps-the-typed-username-with-the-pass.md)
- [The CLI ships as a compiled executable beside the plain build](decisions/the-cli-ships-as-a-compiled-executable-beside-the-plain-build.md)
- [The CLI reports service failures through one guarded call](decisions/the-cli-reports-service-failures-through-one-guarded-call.md)
- [The CLI splits its terminal into output and input](decisions/the-cli-splits-its-terminal-into-output-and-input.md)
- [The CLI domain is grouped by concept](decisions/the-cli-domain-is-grouped-by-concept.md)

## CLI commands and modes

- [The CLI has a prompt mode and a command mode](decisions/the-cli-has-a-prompt-mode-and-a-command-mode.md)
- [Each CLI command describes itself and help reads them](decisions/each-cli-command-describes-itself-and-help-reads-them.md)
- [The CLI offers command names to the terminal on each ask](decisions/the-cli-offers-command-names-to-the-terminal-on-each-ask.md)
- [The CLI history belongs to the prompt, not to readline](decisions/the-cli-history-belongs-to-the-prompt-not-to-readline.md)
- [A CLI command declares who may use it](decisions/a-cli-command-declares-who-may-use-it.md)
- [CLI commands are named by what they do, in one word](decisions/commands-are-named-by-what-they-do.md)
- [Command mode checks the role before calling the service](decisions/command-mode-checks-the-role-before-calling.md)
- [`adduser` is two commands behind one name](decisions/adduser-is-two-commands-behind-one-name.md)
