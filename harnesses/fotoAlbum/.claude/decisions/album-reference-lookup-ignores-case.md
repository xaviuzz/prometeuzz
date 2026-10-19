# Album reference lookup ignores case

`album.get` finds `fam-2025` and `FAM-2025` as the same album and answers the reference as the catalogue holds it. Why: the reference is case-insensitive in `docs/album.md`.
