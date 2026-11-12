# conserjeIAdev

Android app (Kotlin, Jetpack Compose Material 3, Room, Gradle) of community concierge work, `https://github.com/motercode/conserjeIAdev`. Cloned to `Sandbox/conserjeIAdev`.

This file is the harness's. It is not linked into the repo, whose own `CLAUDE.md` is only `@AGENTS.md`. Read `Sandbox/conserjeIAdev/AGENTS.md` and the guides it points to (`docs/agentes/`) before any change; they hold the golden rules, commands and conventions. 

The host has no JDK 17 or Android SDK, so Gradle runs in Docker. From the PrometeuZZ root: `make -C harnesses/conserjeIAdev image|test|build|clean|shell`. `image` builds `conserjeiadev-build` once (JDK 17, SDK 34); the others mount the repo and cache Gradle in `~/.cache/conserjeIAdev`. `test` is `./gradlew testDebugUnitTest` (32 tests green on first run). The repo's `gradle.properties` pins `org.gradle.java.home` to another machine's JDK; the Makefile overrides it with `-Dorg.gradle.java.home=/opt/java/openjdk`, so run Gradle only through `make`. Instrumented tests (`scripts/e2e.sh`) need a device and are not covered.

## Contributing

Upstream `https://github.com/motercode/conserjeIAdev`. Xavier has write access, so `origin` is upstream itself, with no fork. Project rules in `AGENTS.md` win over PrometeuZZ's code-style conventions. Commits in English as Conventional Commits with `(#issue)`; comments, UI and docs in Spanish.

## Current target

None yet.
