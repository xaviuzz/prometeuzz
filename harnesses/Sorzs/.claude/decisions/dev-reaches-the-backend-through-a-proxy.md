# Dev reaches the backend through a proxy

The frontend dev server proxies each operation's `POST /<name>` to `API_URL` (default `http://localhost:3000`), one entry per route in `dev.ts`; the client base URL is `/`. The backend gets no CORS. Why: the browser talks to one origin and the backend stays untouched. Deploy topology waits for a target.
