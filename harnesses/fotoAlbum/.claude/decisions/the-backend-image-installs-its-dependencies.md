# The backend image installs its dependencies

The backend `Dockerfile` copies `bun.lock` and runs `bun install --frozen-lockfile --production`, like the frontend's. Why: without `node_modules`, Bun auto-installs `sharp` at the first upload and blocks the whole server. Found when trying the tray by hand.
