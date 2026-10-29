# Theme follows the editor variables

Pele's CSS variables (`--pele-bg`, `--pele-fg`, `--pele-line`, `--pele-accent`, `--pele-font` and the rest it exposes) are bound to the webview's `--vscode-*` variables.

**Why:** light and dark then switch with the editor, with no per-theme code and no re-render, since Pele applies variable changes live.
