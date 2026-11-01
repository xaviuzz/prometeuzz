# E2E frontend runs the dev server

The frontend container runs `bun run dev`; its proxy is the only route to the backend, and `API_URL` points at it as `e2e-compose-uses-host-networking` sets. Why: no new code, and no production server without a deploy target. Revisit when deploy topology is decided; e2e then tests the real topology.
