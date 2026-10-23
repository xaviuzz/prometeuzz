# Note: e2e `test-results/` is owned by root

Pending, not applied.

## Problem

The `e2e` service in `e2e/compose.yaml` runs the Playwright image as root and mounts `e2e/` from the host. After `npm run e2e` or `npm run up`, `e2e/test-results/` belongs to root. `/clean` then fails with `Permission denied` on `test-results/.last-run.json` and leaves `Sandbox/fotoAlbum/e2e/` behind. Removing it needs `sudo rm -rf Sandbox/fotoAlbum`.

## Proposed change

In `e2e/compose.yaml`, service `e2e`:

```yaml
user: "${UID:-1000}:${GID:-1000}"
```

`UID` is not always exported and `GID` rarely is, hence the default 1000: the user on this machine and the user on GitHub's runner.

## Risks, untested

- Playwright as non-root may complain that `HOME` is not writable. If so, add `HOME: /tmp` under `environment`.
- The container must not need to write elsewhere in `/e2e`.

## Done when

`npm run e2e` is green twice, `ls -l e2e/test-results` shows the host user, and `/clean` deletes the whole umbrella. Commit in `fotoAlbum-e2e` as a config change.
