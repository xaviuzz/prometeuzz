# Known projects

Every project PrometeuZZ has worked on, present in `Sandbox/` or not. `Sandbox/` is git-ignored, so this list is the only record of what exists and where it lives.

- **pintafrase**: Obsidian plugin that displays the rhythm of the sentences in a note. Repo: `https://github.com/xaviuzz/pintafrases.git` (the repo name is plural, the project name is not). Reference: `Sandbox/TMP/obsidian-paste-image-as-note`, from `git@github.com:xaviuzz/obsidian-paste-image-as-note.git`.
- **yesterdayWeather** (learning project, Rust, ledger `.claude/concepts/rust.md`): Rust CLI that compares the weather now with yesterday's in natural language. Repo: `https://github.com/xaviuzz/yesterday_weather.git` (the repo name is snake_case, the project name is not). Reference: `reference/weather-rust.md` inside the project.
- **actual**: fork of Actual Budget, TypeScript monorepo. Repo: `https://github.com/xaviuzz/actual.git`. Its own `AGENTS.md` carries the commands and style rules. Harness: `harnesses/actual/`.
- **fotoAlbum**: photo album web app, TypeScript. Umbrella of two repos: `https://github.com/xaviuzz/fotoAlbum-backend.git` cloned to `Sandbox/fotoAlbum/backend`, and `https://github.com/xaviuzz/fotoAlbum-frontend.git` cloned to `Sandbox/fotoAlbum/frontend`. Harness: `harnesses/fotoAlbum/`.
- **jodaTime** (legacy project, Java, Maven): fork of Joda-Time 2.15.0. Repo: `https://github.com/xaviuzz/joda-time.git`, cloned to `Sandbox/jodaTime` (the repo name is hyphenated, the project name is not). Its `CLAUDE.md` and `.claude/` live in the project.

When Xavier asks to work on a known project that is not in `Sandbox/`, clone it with `git clone <repo> Sandbox/<name>`, or `Sandbox/<umbrella>/<repo>` for a repo of an umbrella (see `.claude/git-policy.md`), and clone its reference into `Sandbox/TMP/` too, then make it the current project in `CLAUDE.md`. Install the project's dependencies from its lockfile (`npm ci` for Node) so tests, lint and build run. Add a project to this list when it is created.
