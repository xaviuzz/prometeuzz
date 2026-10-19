# Photo

A photo is an image a person uploads to the app so it can later be placed in an album. In this document "photo" means the uploaded image, never a spot on an album page. Placing photos in an album is another concept, not yet defined.

The photo tray, "Mis fotos", is the space on the making page where the person sees the photos they have uploaded and uploads more.

## What defines a photo

- **Identity**: a code the app invents when the photo is stored. Nobody types it. It tells one photo from another.
- **Owner**: the anonymous session it was uploaded from. A photo belongs to one session and is visible only there.
- **Original**: the image exactly as it was uploaded. It is kept, but nothing shows it yet.
- **Thumbnail**: a small copy of the original with the same proportions, whose longest side is 256 pixels. It is what the tray shows. The app makes it when the photo is stored.

Two photos with the same content are still two photos.

## Rules

- Accepted formats are JPEG, PNG and WebP. Nothing else.
- Each file may weigh up to 25 MB.
- There is no limit on the number of photos, neither per upload nor per session.
- Several files can be chosen and uploaded together. A rejected file does not stop the others: the app keeps the good ones and tells which were rejected and why. The reasons are an unsupported format, a file that is too large, and a file that cannot be read as an image.
- Photos are kept by the app, not by the browser, so they are still there after reloading or reopening the app.
- Photos show in the order they were uploaded, oldest first. New ones go at the end. Within one upload they keep the order in which the files were chosen.
- A photo cannot be deleted, reordered, renamed or edited.
- Photos need a session. Without one the app refuses to store or list them.

## The photo tray

- It sits on the left of the making page, takes a quarter of the page width and as much height as is visible.
- The thumbnails fill it, and it scrolls inside when they do not fit. The rest of the page does not move.
- Under the photos there is always an upload button, "Subir fotos", with an image-plus icon, that opens the file chooser for several photos. It is always visible, however many photos there are.
- While files upload, the button cannot be pressed again and shows it is working. When they finish, the new photos appear at the end.
- Rejected files are listed in the tray with their names and reasons, until the next upload.
- With no photos yet, the tray says "Aún no hay fotos".
- While the photos load it says "Cargando…". If they cannot be loaded, or a whole upload fails, it shows an error.

## What can be done

1. Upload one or several photos: from the button in the tray.
2. See the uploaded photos as thumbnails: in the tray, on the making page.

## Out of scope

- Deleting, reordering, renaming or editing photos.
- Dragging files onto the tray, and progress per file.
- Showing the original, or any size bigger than the thumbnail.
- Placing photos on album pages, layouts and user albums.
- Formats other than JPEG, PNG and WebP, such as HEIC.
- Sharing photos between sessions, browsers or devices.

## Open questions

- Starting over forgets the session, so its photos stay stored with nobody able to reach them. When should they be removed?
- How long should photos be kept?
- Does a photo belong to the session or, to the user album being made (see `user-album.md`)?
- When should a limit on the number or total weight of photos be set?
