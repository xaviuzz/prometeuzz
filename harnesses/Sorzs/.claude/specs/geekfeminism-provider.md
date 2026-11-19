# Geek Feminism provider

Repos: `backend/`, `frontend/`, `cli/` (contract copy only). Docs: `.claude/docs/search.md`, `.claude/docs/sorz-list.md`, `.claude/docs/backoffice.md`. Decisions: `search-providers-qualify-per-sorz-and-generic-is-the-catch-all`, `a-sorz-has-a-specific-provider-or-the-generic-one`, `e2e-covers-the-happy-path-only`. Model: `.claude/specs/wikipedia-provider.md`.

Goal: the sorz `https://geekfeminism.fandom.com` is searched by its own provider, which returns up to ten real results, each with title and link. It is the first provider for one site and the first that returns an empty description.

A step is done when its repo's tests, lint and build pass (frontend and CLI: also typecheck and `generate:check`); then mark it `- [x]`. Work test-first. Agree the seam once, then run every cycle of a step in one go. A structural step changes no behavior. A step marked "by hand" is marked only after Xavier confirms it. A tidy step is structural and eases the step it names; it runs before it.

## Findings

Measured on 2026-11-19 with `curl` and a `Sorzs (<contact>)` User-Agent:

- `https://geekfeminism.fandom.com/api.php?action=query&list=search&srsearch=<term>&srlimit=10&format=json` answers 200. Each hit in `query.search` carries `title`, `pageid`, `size`, `wordcount`, `timestamp` and an empty `snippet`. No hits give `{"query":{"search":[]}}`.
- `prop=extracts` does not exist on this wiki. The description stays empty.
- `Special:Search` (HTML) answers 403 to a client that is not a browser. The provider reads the API only.
- Titles may hold `/` (`AdaCamp/AdaCampDCSessions`).

## Decisions

Settled with Xavier before the steps; step 2 records each as its own decision file.

1. The provider is for this one wiki. Its id is `geekfeminism`, it qualifies with `DomainQualificationStrategy("geekfeminism.fandom.com")`, and it asks `https://<hostname>/api.php`.
2. The frontend shows the mark with the hint "Searched by Geek Feminism" in the list and the census. `SearchProviderId` gains `geekfeminism`.
3. The description of every result is `""`. A second call per page is out of scope.
4. The link is `https://geekfeminism.fandom.com/wiki/<title>`: spaces become `_` and every other character is encoded except `_`, `(`, `)`, `/` and `:`.
5. Ten results per search; each call is cut at 3 seconds. A cut, a non-success status or an unreadable body means the sorz did not answer (`SearchFailedError`). No hits is an empty result, not a failure.
6. No slow-down memory: a 429 is a failure like any other. It is added when Fandom limits in practice.
7. The User-Agent reuses `WIKIPEDIA_CONTACT`, unrenamed.
8. No e2e scenario and no new variable (`e2e-covers-the-happy-path-only`). The CLI only receives the contract copy.

## Steps

Numbered by dependency.

- [x] 1. Change surface analysis, no code, confirmed by Xavier. Result: tidies A and B (steps 4 and 5). The contract and the frontend need none. A shared call between the two providers was weighed and dropped: Wikipedia reads the status for slow-down before it checks success, this provider has no slow-down.
- [x] 2. Docs and decisions, by hand: write `.claude/docs/geekfeminism-search.md` (rules: the API read, the link, the empty description, the failure), `.claude/reference/geekfeminism-api.md` (the findings above), one decision per item above in `.claude/decisions/` with its line in the index, and update `search.md`, `sorz-list.md` and `backoffice.md` where a rule changes. Check whether `search-providers-qualify-per-sorz-and-generic-is-the-catch-all` and `a-sorz-has-a-specific-provider-or-the-generic-one` need a line for a provider tied to one site. Xavier reads them. Marked only after Xavier confirms.
- [x] 3. Contract: in `backend/openapi.yaml` add `geekfeminism` to `SearchProviderId` (decision 2); copy it to `frontend/` and `cli/`; run `generate` in each. Done when `generate:check`, typecheck, lint, tests and build pass in `frontend/` and `cli/`, and the backend passes all of its own. No new route, so the `dev.ts` proxy stays.
- [x] 4. Tidy, structural, eases steps 6 and 8: the fetch type and the contact lose the name Wikipedia. `WikipediaFetch` becomes `WebFetch` in its own file; in `SearchProvidersFactory` and `SearchSettings`, `wikipediaFetch` and `wikipediaContact` become `webFetch` and `contact`. The variable `WIKIPEDIA_CONTACT` keeps its name (decision 7). Protected by `WikipediaSearchProvider.test.ts`, `SearchProvidersFactory.test.ts`, `SearchSettings.test.ts` and typecheck.
- [x] 5. Tidy, structural, eases step 8: the fake fetch of `SearchProvidersFactory.test.ts` answers by URL, Wikipedia's host as today and a 404 for any other. Protected by that file's existing cases.
- [x] 6. Backend, results, test-first: `GeekFeminismSearchProvider` in `infrastructure/geekfeminism/`, with a `GeekFeminismPage` that turns a hit into a `SearchResult`. It receives its `fetch` so tests fake the wiki. Cycles: the request goes to `https://<hostname>/api.php` with `srsearch`, `srlimit=10`, `format=json` and the User-Agent; one result per hit with title and link (decision 4, covering a title with spaces, `/` and `(`); the description is `""`; no hits give no results; each result carries the sorz as the list shows it; `canSearch` follows the qualification of decision 1.
- [x] 7. Backend, failure, test-first (decision 5): a network failure, a cut at 3 seconds, a non-success status and an unreadable body each make the provider throw `SearchFailedError`; `SearchSorzs` already reports that sorz in `failed`. The test that shows the failed sorz next to a working one runs through the real factory, so it lives in step 8.
- [x] 8. Backend, wiring, test-first: `ProviderId.geekfeminism()`; `SearchProvidersFactory` registers the provider after Wikipedia and before the generic one, with the `contact` and `webFetch` it already holds. Nothing but this step's tests catches a provider built and not registered. A test through `SearchSorzs` with a real `SearchProviders` shows a `geekfeminism.fandom.com` sorz gets only its own results and never the Google one, and another `fandom.com` wiki stays generic; add, list and census replies name the provider `geekfeminism`. The correspondence test stays green.
- [x] 9. Frontend, test-first: `providerNamed` knows `geekfeminism` with its own provider class, specific, and the hint "Searched by Geek Feminism"; the mark shows in the list, the collapsed side bar and the census (one `ProviderMark`, so one change). A result with an empty description renders no description line: `SearchResult` gains `hasDescription()` and `SearchResultItem` asks it. No test covers an empty description today, so this one needs its own.
- [x] 10. Real wiki, by hand: Xavier runs the app, registers `https://geekfeminism.fandom.com`, searches `adacamp`, follows a result, and stops the network to see the failure line. Marked only after Xavier confirms.

## Out of scope

Descriptions or extracts (a call per page), reading `Special:Search`, wikis in another language path, other Fandom wikis, a next page, slow-down memory, an e2e scenario, renaming `WIKIPEDIA_CONTACT`.
