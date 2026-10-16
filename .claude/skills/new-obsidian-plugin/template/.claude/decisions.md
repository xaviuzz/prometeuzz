# Decisions

Each decision and its why. Replace a bullet when the code changes it; do not stack a correction beside it.

- `tsconfig.json` sets `moduleResolution: "bundler"`. With `"node"`, a bare `tsc --noEmit` cannot resolve the `exports` types of `vite` and `vitest`; `npm run build` hid it behind `-skipLibCheck`.
- `obsidian` is pinned to `1.8.7` and `eslint` to 9, `typescript` to 6: `eslint-plugin-obsidianmd` peers those versions (`typescript-eslint` caps `typescript` at 6.0). Lift them when the plugin does.
