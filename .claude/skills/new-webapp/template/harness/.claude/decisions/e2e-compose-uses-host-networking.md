# E2E Compose uses host networking

Every service sets `network_mode: host`, with distinct ports: backend `BACKEND_PORT` (3100), frontend `FRONTEND_PORT` (5273), both overridable; the frontend's `API_URL` and the runner's `BASE_URL` point to `localhost`. Why: in this sandbox bridge networking fails (`operation not supported` creating the veth pair), and the host already uses 3000 and 5199. The images' own defaults (3000, 5173) are untouched. Revisit if CI or another machine needs bridge: service names would replace `localhost`.
