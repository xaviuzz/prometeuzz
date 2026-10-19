# Thumbnails are served by a GET route

`GET /photos/<sessionId>/<photoId>/thumbnail` serves a thumbnail, immutable and cacheable, documented in `openapi.yaml` as the single exception to the RPC style. `photo.list` and `photo.upload` answer each photo as `{ id, thumbnailUrl }`. Why: an `<img>` can only GET; base64 in the reply bloats it and fetching by POST into a blob loses browser caching. Ids are unguessable. The original is not served.
