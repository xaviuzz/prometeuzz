# Slot operations answer the user album

`slot.place` takes the face and the photo, `slot.empty` takes the face, and both answer the user album as `userAlbum.get` does, so the frontend never rereads it. A missing face or photo, or a photo of another session, is refused with its own code. `photo.list` is unchanged. Why: the face identifies the slot while there is one per face; answering the user album keeps one shape for the occupants.
