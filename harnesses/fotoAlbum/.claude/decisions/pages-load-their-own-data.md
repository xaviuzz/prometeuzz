# Pages load their own data

`HomePage` and `MakingPage` each read through `useAlbums()` into their own loading, error and answer state; there is no generic loading hook. Why: two uses, with different data shapes; the rule of three comes first.
