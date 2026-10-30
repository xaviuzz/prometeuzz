# Pele bundled into one file the module imports by path

`vendor/pele.js` is Pele built with esbuild and committed. `pele` and `esbuild` are dev dependencies of the skill folder only; `node_modules` is ignored.

**Why:** a mod module may import only its own files and `claude-code`, and it must load in every session with no build step. Xavier approved both dependencies.
