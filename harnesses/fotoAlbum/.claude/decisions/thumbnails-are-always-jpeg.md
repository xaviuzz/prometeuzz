# Thumbnails are always JPEG

Every thumbnail is served as `image/jpeg`, whatever the original format. Why: one output format keeps the contract and the route simple; transparency in PNG or WebP is not worth a second type yet.
