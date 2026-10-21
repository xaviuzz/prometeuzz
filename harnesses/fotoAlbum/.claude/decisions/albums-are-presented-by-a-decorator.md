# Albums are presented by a decorator

`Albums` answers `PresentedAlbum` (in `src/domain/album/`), a decorator that wraps the contract `Album` and adds the Spanish labels (binding, orientation, album and page size); the components ask it and no longer know the label maps. It forwards `reference`, `commercialName` and `pageCount` and does not expose the raw `Album`. Why: tell, don't ask; the contract type is generated and cannot carry behavior, and composition beats inheritance.
