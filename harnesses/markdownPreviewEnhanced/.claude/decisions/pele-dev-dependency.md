# Pele as a dev dependency bundled for the webview

`pele` (MIT, 1.12.0) is added as a `devDependency` and bundled by esbuild into a webview script.

**Why:** it runs in the webview, not the extension host, so its `engines` field (Node 20+) does not touch the Node 18 constraint in `AGENTS.md`; the build still has to be checked on Node 18. Xavier approved adding it.
