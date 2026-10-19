# The frontend presents a user album as an album

`UserAlbums` answers a `PresentedAlbum` built from the user album; there is no `PresentedUserAlbum`. Why: the user album is the album plus an `id` the frontend does not use, and the labels (binding, orientation, sizes) are the same. Add a class of its own only when a screen needs the `id` or a rule that belongs to the user album and not to the model.
