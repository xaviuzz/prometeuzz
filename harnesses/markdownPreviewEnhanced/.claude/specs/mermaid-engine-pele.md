# Mermaid engine: Pele

Docs touched: `.claude/docs/mermaid-engine.md`. Decisions: `.claude/decisions.md`, areas Integration, Behavior, Theme, Scope and tests.

Mark a step `- [x]` when its tests, lint and build pass (`make test`, `make check`, `make build`). A step tried by hand is marked only after Xavier confirms.

## Facts to verify while building

- crossnote's webview calls `window.mermaid.render(id, code)` and reads `{ svg }` from the result (seen in `node_modules/crossnote/out/webview/preview.js`).
- Whether Pele's `render()` is sync or async, and whether it needs a DOM: read `dist/index.d.ts` and `dist/pele.js` in step 3, once `pele` is installed. The `DiagramRenderer` port of step 2 may need a thin wrapper around it.
- How `src/preview-provider.ts` and crossnote order the scripts in the preview HTML: read it in step 4. Our script must load after crossnote's Mermaid.

## Steps

- [x] 1. Engine setting. Add the setting (`mermaid`, `pele`; default `mermaid`) to `package.json` and every `package.nls*.json`, and read it in `src/config.ts`. The description says the Mermaid theme and configuration settings do not apply with Pele. Test: the default is `mermaid`; `pele` is read.
- [x] 2. Adapter with fakes (`*Strategy` per engine). Cycles, each test-first:
  1. Mermaid chosen: Mermaid draws, Pele is never called.
  2. Pele chosen: Pele's `{ svg }` is returned.
  3. Pele throws: Mermaid draws that diagram.
  4. Both throw: the error is Mermaid's, unchanged.
  Close with the `extract-sut` skill.
- [ ] 3. Dependency and bundle. Add `pele` as a `devDependency`, bundle the adapter and Pele into one webview script in `build.js`, and copy it where `gulpfile.js` packages webview assets. Check the build on Node 18 through the `Makefile`.
- [ ] 4. Load in the preview. Inject the script after crossnote's Mermaid in the preview HTML and pass the chosen engine to it. Tried by hand: one document with a flowchart and a sequence diagram, engine `pele`, then `mermaid`.
- [ ] 5. Theme. Bind Pele's CSS variables to `--vscode-*`. Tried by hand: switch the editor between light and dark with a preview open.
- [ ] 6. Close. Add the README note and the `CHANGELOG.md` entry that `AGENTS.md` asks for.

## Diagram

```mermaid
flowchart TD
  Block[Mermaid block in the document] --> Crossnote[crossnote calls mermaid.render]
  Crossnote --> Adapter{Chosen engine}
  Adapter -->|mermaid| Mermaid[Mermaid draws]
  Adapter -->|pele| Pele[Pele draws]
  Pele -->|fails| Mermaid
  Pele -->|ok| Svg[SVG in the preview]
  Mermaid -->|ok| Svg
  Mermaid -->|fails| Error[Usual error]
  Vars[Editor theme variables] -.-> Svg
```
