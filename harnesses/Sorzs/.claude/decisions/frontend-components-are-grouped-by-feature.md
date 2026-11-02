# Frontend components are grouped by feature

`src/components/` has one folder per feature (`sources/`, `search/`, `header/`), never per place on screen. A feature with two tasks splits by task (`sources/add/`, `sources/list/`); what both tasks use (`SourcesProvider`, `SourceFavicon`, `messageOf`) stays at the feature root. `test/` mirrors the layout. A component that only composes others (`Header`) lives in its own folder and imports the feature's components from there.

Why: `AddSourceDialog` is shown in the header but is about registering a source; moving it to `header/` would split it from its five parts or pull half of `sources/` into the header. `SearchBox` set the same precedent. A helper two tasks share moves up to the nearest folder both share.
