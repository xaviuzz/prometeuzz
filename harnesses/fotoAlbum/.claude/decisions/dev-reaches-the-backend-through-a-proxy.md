# Dev reaches the backend through a proxy

The frontend dev server proxies `POST /health.check` to `API_URL` (default `http://localhost:3000`); the client base URL is `/`. The backend gets no CORS. Why: the browser talks to one origin and the backend stays untouched. Deploy topology waits for a target.
