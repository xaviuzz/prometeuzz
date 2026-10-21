# The photos live in a shared context

The frontend reads `photo.list` once, in a provider on the making page, and uploads update that same reading. The photo tray and the slots on the face both read it. Why: a slot needs the thumbnail of its photo and the tray must subtract the placed ones, so a list kept inside the tray could not be shared. Xavier chose it over deriving thumbnail URLs from the photo identity, which would copy a backend convention into the frontend.
