# E2E frontend runs the dev server

The frontend container runs `bun run dev`; its proxy is the only route to the backend, and `API_URL` points at it as `e2e-compose-uses-host-networking` sets. Why: no new code, and no production server without a deploy target. The topology is decided (`one-bun-serves-front-and-api-deployed-over-ssh`) and the backend now serves `STATIC_DIR`; Xavier chose to keep e2e on the dev server, so it does not test the real topology. Revisit if a bug appears that only the served build shows.
