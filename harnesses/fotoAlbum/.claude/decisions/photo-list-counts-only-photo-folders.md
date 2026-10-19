# Photo list counts only photo folders

`PhotoStore.list` keeps an entry of the session folder only when its name has the shape of a photo id (the same pattern `thumbnailOf` already requires). Why: the session folder also holds `user-album.json` (see "User album lives on disk behind a store"), and listing every entry answered it as a photo, so the tray showed a "Foto 1" with a broken thumbnail in every session with a user album and no photos. Any other file kept in the session folder is safe the same way.
