# Domain primitives become value objects

`Binding` (hardcover or softcover) and `UserAlbumId` are value objects like `Reference`, `Size` and `PhotoId`. The rule of three is not waited for: a rule that lives in the owner instead of the value (the list of bindings inside `Album`) is primitive obsession, and the value object is the smaller step.

`AlbumDescription` is `AlbumData` plus `orientation`, not a second copy of the six fields. `Call` reads the header once and hands it to the readers, so no read casts an unchecked value.

`PhotoId` and `UserAlbumId` look alike (generate, read back, JSON) but differ in rules: `PhotoId` validates its format because it becomes a folder name, `UserAlbumId` is only an identity. They share no base; a third id would be the moment to look again.

Why: item 7 of the backend refactor, closed after grilling.
