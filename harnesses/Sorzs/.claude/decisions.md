# Sorzs decisions

Entries below were inherited from the fotoAlbum boilerplate (tag `boilerplate-v2`). Each why holds until a new entry replaces it.

One file per decision in `decisions/`, listed here by area. Read only the files of the area you work in. Record a new decision as its own file with the title as its heading, and add its line under its area here; a file with no line, or a line with no file, is a defect. Split an area past 15 decisions.

## Umbrella and workflow

- [Umbrella of three repos](decisions/umbrella-of-three-repos.md)
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
- [The backend image installs its dependencies](decisions/the-backend-image-installs-its-dependencies.md)
- [Body is an object; Call answers for itself](decisions/body-is-an-object-call-answers-for-itself.md)
- [Errors carry their contract code](decisions/errors-carry-their-contract-code.md)
- [Operations validate inside execute](decisions/operations-validate-inside-execute.md)
- [Transport is separate from operations](decisions/transport-is-separate-from-operations.md)
- [Routes are a map handed to Bun.serve](decisions/routes-are-a-map-handed-to-bun-serve.md)
- [Domain has its own folder, one per concept](decisions/domain-has-its-own-folder-one-per-concept.md)

## Frontend foundation

- [Frontend tooling: Bun native, no Vite](decisions/frontend-tooling-bun-native-no-vite.md)
- [Generated client: openapi-typescript and openapi-fetch](decisions/generated-client-openapi-typescript-and-openapi-fetch.md)
- [Dev reaches the backend through a proxy](decisions/dev-reaches-the-backend-through-a-proxy.md)
- [Flexoki palette, light and dark](decisions/flexoki-palette-light-and-dark.md)
- [Wordmark in Rouge Script from a Google Fonts link](decisions/wordmark-in-rouge-script-from-google-fonts.md)
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
- [The side bar owns the reading; the dialog reports what it added](decisions/side-bar-owns-the-reading-dialog-reports-onadded.md)
- [API wrappers throw refusals and let network failures through](decisions/api-wrappers-throw-refusals-and-let-network-failures-through.md)

## E2E

- [E2E is a third repo, composing the other two](decisions/e2e-is-a-third-repo-composing-the-other-two.md)
- [E2E covers the happy path only](decisions/e2e-covers-the-happy-path-only.md)
- [E2E frontend runs the dev server](decisions/e2e-frontend-runs-the-dev-server.md)
- [Playwright on Node in the official image](decisions/playwright-on-node-in-the-official-image.md)
- [Compose waits on healthchecks](decisions/compose-waits-on-healthchecks.md)
- [E2E adds @types/node](decisions/e2e-adds-types-node.md)
- [E2E Compose uses host networking](decisions/e2e-compose-uses-host-networking.md)
- [Bring the stack up for manual checks](decisions/bring-the-stack-up-for-manual-checks.md)
- [E2E CI gate](decisions/e2e-ci-gate.md)

## Sources

- [Sources persist in memory behind a repository](decisions/sources-persist-in-memory-behind-a-repository.md)
- [Source and list entry are separate concepts](decisions/source-and-list-entry-are-separate-concepts.md)
- [Source identity is the exact address](decisions/source-identity-is-the-exact-address.md)
- [Registration refusals check the address first](decisions/registration-refusals-check-the-address-first.md)
