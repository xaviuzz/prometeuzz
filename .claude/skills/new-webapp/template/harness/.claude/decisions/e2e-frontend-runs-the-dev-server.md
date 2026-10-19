# E2E frontend runs the dev server

The frontend container runs `bun run dev` with `API_URL=http://backend:3000`; its proxy is the only route to the backend. Why: no new code, and no production server without a deploy target. Revisit when deploy topology is decided; e2e then tests the real topology.
