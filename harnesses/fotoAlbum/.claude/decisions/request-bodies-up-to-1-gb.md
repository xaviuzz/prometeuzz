# Request bodies up to 1 GB

`Bun.serve` sets `maxRequestBodySize` to 1 GB; its default of 128 MB holds only about five photos. A bigger upload is refused by transport. Why: `docs/photo.md` sets no limit on photos per upload; this is a technical ceiling, not a product rule. Revisit when a limit is set (open in `docs/photo.md`).
