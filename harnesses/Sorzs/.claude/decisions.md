# Sorzs decisions

The first entries were inherited from the fotoAlbum boilerplate (tag `boilerplate-v2`); the rest are Sorzs's own. Each why holds until a new entry replaces it.

One file per decision in `decisions/`, listed here by area. Read only the files of the area you work in. Record a new decision as its own file with the title as its heading, and add its line under its area here; a file with no line, or a line with no file, is a defect. Split an area past 15 decisions.

## Umbrella and workflow

- [Umbrella of three repos](decisions/umbrella-of-three-repos.md)
- [Vertical slices, health check first](decisions/vertical-slices-health-check-first.md)
- [CI gates; no deploy](decisions/ci-gates-and-no-deploy.md)

## Contract

- [Backend owns the contract](decisions/backend-owns-the-contract.md)
- [RPC API, not REST](decisions/rpc-api-not-rest.md)
- [Call and Reply: header and body](decisions/call-and-reply-header-and-body.md)
- [Errors live in the message](decisions/errors-live-in-the-message.md)
- [Contract conformance by correspondence test](decisions/contract-conformance-by-correspondence-test.md)

## Backend

- [Backend tooling: Bun native plus Biome](decisions/backend-tooling-bun-native-plus-biome.md)
- [The backend image installs its dependencies](decisions/the-backend-image-installs-its-dependencies.md)
- [Body is an object; Call answers for itself](decisions/body-is-an-object-call-answers-for-itself.md)
- [Operations validate inside execute](decisions/operations-validate-inside-execute.md)
- [Transport is separate from operations](decisions/transport-is-separate-from-operations.md)
- [Operations sit in a registry that hands Bun.serve its routes](decisions/routes-are-a-map-handed-to-bun-serve.md)
- [Domain has its own folder, one per concept](decisions/domain-has-its-own-folder-one-per-concept.md)
- [toJSON only serializes](decisions/tojson-only-serializes.md)

## Frontend foundation

- [Frontend tooling: Bun native, no Vite](decisions/frontend-tooling-bun-native-no-vite.md)
- [Frontend stays on TypeScript 5](decisions/frontend-stays-on-typescript-5.md)
- [Frontend skills at project level](decisions/frontend-skills-at-project-level.md)
- [Dev reaches the backend through a proxy](decisions/dev-reaches-the-backend-through-a-proxy.md)
- [Flexoki palette, light and dark](decisions/flexoki-palette-light-and-dark.md)
- [Wordmark in Rouge Script from a Google Fonts link](decisions/wordmark-in-rouge-script-from-google-fonts.md)
- [Health mark has three states](decisions/health-mark-has-three-states.md)

## Frontend API

- [Generated client: openapi-typescript and openapi-fetch](decisions/generated-client-openapi-typescript-and-openapi-fetch.md)
- [HealthCheck wraps the generated client; tests fake fetch](decisions/healthcheck-wraps-the-generated-client-tests-fake-fetch.md)
- [The API reaches components through one ApiProvider](decisions/the-api-reaches-components-through-one-apiprovider.md)
- [API wrappers throw refusals and let network failures through](decisions/api-wrappers-throw-refusals-and-let-network-failures-through.md)

## Add dialog and list

- [A SourcesProvider owns the reading; the dialog reports what it added](decisions/sources-provider-owns-the-reading-dialog-reports-onadded.md)
- [The add dialog says URL and Title and keeps an sr-only description](decisions/add-dialog-says-url-and-title-and-keeps-an-sr-only-description.md)
- [The add dialog shows the favicon beside the title field](decisions/the-add-dialog-shows-the-favicon-beside-the-title-field.md)
- [A long title is shortened only as a suggestion](decisions/a-long-title-is-shortened-only-as-a-suggestion.md)
- [Clicking a candidate overwrites address and name](decisions/clicking-a-candidate-overwrites-address-and-name.md)
- [Stale inspect replies are discarded](decisions/stale-inspect-replies-are-discarded.md)
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

## Sources, domain

- [Sources persist in memory behind a repository](decisions/sources-persist-in-memory-behind-a-repository.md)
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
