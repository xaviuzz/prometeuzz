# markdownPreviewEnhanced

VS Code extension for Markdown Preview Enhanced (`https://github.com/shd101wyy/vscode-markdown-preview-enhanced`), TypeScript, pnpm, mocha. It wraps the crossnote rendering library.

Read `AGENTS.md` before any change: it holds commands, architecture, Node 18 constraints and the changelog rules. Run `pnpm` commands from the repo root only.

Run commands through the `Makefile` (`make install|build|test|check|fix|watch|web`). It puts Node 18 first on the PATH; a bare `pnpm` command needs `export PATH=/home/xaviuzz/.local/share/node18/node_modules/node/bin:$PATH` first. The system Node is 26, and `AGENTS.md` says a green run on Node 20+ proves nothing for this extension.

Run one test file with `pnpm exec mocha --ui tdd test/<file>.test.js` (Node 18 on the PATH); `npx` fails on Node 18. List every new test file in the `test:unit` script of `package.json`, or `make test` skips it.

## Current target

Personal experiment, not an upstream issue: draw Mermaid blocks with Pele (`https://pele.run/`) as an optional engine. Concept in `.claude/docs/mermaid-engine.md`, plan in `.claude/specs/mermaid-engine-pele.md`. Project decisions are indexed in `.claude/decisions.md`; read the area you touch.

## Contributing

Upstream: `https://github.com/shd101wyy/vscode-markdown-preview-enhanced`. Project rules in `AGENTS.md`, the ESLint and Prettier config win over PrometeuZZ's code-style conventions. Remotes: `origin` is the fork `xaviuzz/vscode-markdown-preview-enhanced`, `upstream` is shd101wyy's repo. The default branch is `develop`. The Pele experiment lives on `pele-engine`; keep `develop` a clean copy of upstream.
