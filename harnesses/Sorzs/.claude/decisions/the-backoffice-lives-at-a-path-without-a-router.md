# The backoffice lives at a path, without a router

The backoffice answers to `/backoffice/users` and `/backoffice/sorzs`; `/backoffice` alone goes to `users`. The frontend reads and writes the path with the browser's History API, so reload, back and forward work. No routing dependency. A non-admin at any `/backoffice` path goes back to `/`. The dev proxy and the e2e dev server must serve the app at these paths. Why: two sections do not justify a router, and a path keeps the active section across reloads, where an in-memory state would lose it.
