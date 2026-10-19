# Components grouped by feature

`src/components/` holds one component per file, in `layout/` (`Header`, `HealthMark`), `catalogue/` (`Catalogue`, `AlbumRow`, `AlbumCard`) and `making/` (`AlbumMaking`, `AlbumCharacteristics`); `test/components/` mirrors it. What is not a component lives in `src/lib/`. Why: what changes together lives together, and a folder of components should hold only components.
