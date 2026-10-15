# Obsidian plugin rules

Rules Obsidian imposes that code and config do not show. Commands and layout: `CLAUDE.md`.

## Manifest

- `id` equals the plugin folder name and is frozen after release: it is public API.
- Keep `minAppVersion` equal to the oldest Obsidian that has every API used.
- `isDesktopOnly` is `false`, so use only the Obsidian API and browser APIs. Needing Node or Electron means asking first, because it flips the flag.
- `version` follows SemVer (`x.y.z`).
- Validation rules: https://github.com/obsidianmd/obsidian-releases/blob/master/.github/workflows/validate-plugin-entry.yml

## Tooling

- Node: current LTS. TypeScript runs with `"strict": true`.
- Lint with `eslint-plugin-obsidianmd` (`npm run lint`); its rules follow the Obsidian plugin guidelines.
- Bundle every runtime dependency into `main.js`. Keep the plugin small and prefer browser-compatible packages.
- Split a file that outgrows roughly 300 lines.
- Prefer `async`/`await` to promise chains.

## Lifecycle

- `src/main.ts` holds only `onload`, `onunload` and registration. Features live in their own modules.
- Command IDs are frozen after release, like the manifest `id`.
- A plugin with configuration gets a settings tab with sensible defaults and validation.
- Merge saved settings over defaults: `Object.assign({}, DEFAULT_SETTINGS, await this.loadData())`. Await `loadData` and `saveData`.
- Route every listener, DOM event and interval through `registerEvent`, `registerDomEvent` and `registerInterval`, so unload releases them.
- To replace a native behavior, register on the capture phase and call `preventDefault()` and `stopPropagation()`.

## Privacy

- The plugin works offline. A network call needs a user-facing reason, opt-in and a note in `README.md`.
- Read and write only what the feature needs inside the vault; vault contents and filenames stay on the machine.
- Run only code that ships in the release: no remote scripts, no `eval`, no updates outside a release.
- Telemetry, analytics and third-party calls are opt-in and documented in `README.md` and the settings, with the data sent and the risks.
- Policies: https://docs.obsidian.md/Developer+policies

## Performance

- Keep `onload` light: defer heavy work until a feature needs it.
- Debounce work triggered by file or editor events. Read from the cached vault; avoid rescanning it, and batch disk access.

## Mobile

- Test on iOS and Android where feasible.
- Keep large in-memory structures out: mobile memory and storage are limited.

## UI copy

- Sentence case for headings, buttons and titles.
- Docs write literal UI labels in **bold** and navigation as **Settings → Community plugins**.

## Release

- `versions.json` maps each plugin version to its `minAppVersion`. `version-bump.mjs` writes it and `manifest.json` from `npm_package_version`; no npm script runs it yet.
- The GitHub release tag equals `manifest.json`'s `version`, with no leading `v`.
- Attach `main.js`, `manifest.json` and `styles.css` as separate assets.
