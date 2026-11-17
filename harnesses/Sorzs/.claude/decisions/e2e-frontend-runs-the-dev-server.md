# E2E frontend runs the dev server

The frontend container runs `bun run dev`; its proxy is the only route to the backend, and `API_URL` points at it as `e2e-compose-uses-host-networking` sets. Why: no new code, and no production server without a deploy target. The topology is now decided (`one-bun-serves-front-and-api-deployed-over-ssh`); revisit once the backend serves `STATIC_DIR`, so e2e tests the real topology.
