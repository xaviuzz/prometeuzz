# Dev reaches the backend through a proxy

The frontend dev server proxies each operation's `POST /<name>` to `API_URL` (default `http://localhost:3000`), one entry per route in `dev.ts`; the client base URL is `/`. The backend gets no CORS. Why: the browser talks to one origin and the backend stays untouched. The proxy is for development only; production topology is in `one-bun-serves-front-and-api-deployed-over-ssh`.
