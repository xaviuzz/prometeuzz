# User album

A user album is a concrete album: the one a person is preparing to print, made from an album model of the catalogue (see `album.md`). In this document "album" always means the catalogue model, and "user album" the concrete one.

A user album takes its size, page size, page count and binding from its model and, for now, holds nothing else: its faces are empty. Placing photos on faces is another concept, not yet defined.

## What defines a user album

- **Identity**: a code the app invents when the user album is created. Nobody types it. It tells one user album from another.
- **Owner**: the anonymous session it was created in (see `session.md`). It belongs to one session and is visible only there.
- **Model**: the reference of the album it was made from. It is only a record of origin.
- **Album size, page size, page count and binding**: copied from the model when the user album is created, and never changed afterwards. The model's later withdrawal does not affect the user album.
- **Faces**: as many as the page count, because a page is a face (see `album.md`). They are numbered from 1 to the page count. They exist from the moment the user album is created.

A user album has no title of its own. People see the commercial name of its model.

## What defines a face

A face is one side of a physical sheet; the sheet has no rules of its own and is not modelled.

- **Number**: its position, from 1 to the page count. Fixed.
- **Size**: the page size of the user album.
- **Binding side**: the edge where the face is bound, which follows from its number. Odd faces are bound on their left edge and even faces on their right edge, as in a book. Face 1 is a right-hand face. The last face is even, so it is a left-hand face.
- **Content**: none. A face is empty.

## Rules

- Choosing an album in the catalogue creates the user album and records it in the session, which keeps one. Choosing another one is only possible after starting over.
- Faces are never added, removed or reordered. Size, page size, page count and binding never change, because a different format is a different album.
- The cover, front and back, is not a face and is not part of the page count.
- The app keeps the user album, not the browser, so it is still there after reloading or reopening the app. Without a session the app refuses to create or consult it.
- Starting over forgets the session, so the user album stays stored with nobody able to reach it, as happens with photos.

## The making page

The area to the right of the photo tray (see `photo.md`) shows one face at a time, at the proportions of the page size. A mark on the edge where the face is bound shows the binding side. Under the face, its number reads "n/N": the face number over the page count, for example "1/24".

"Anterior" and "Siguiente" move to the previous or next face. The first face is shown when the making page opens, and the position is not remembered after reloading. "Anterior" cannot be pressed on face 1, nor "Siguiente" on the last face.

## What can be done

1. Create a user album: by choosing an album in the catalogue.
2. Consult the user album of the session: it opens the making page.
3. Move between its faces: with "Anterior" and "Siguiente".

## Out of scope

- Photos on faces, layouts and any content of a face.
- The cover, and bindings along the top edge, as in a calendar.
- A title for the user album, and any state such as draft, ready or ordered.
- Deleting or editing a user album, and changing its model.
- Orders and printing.
- Jumping to a given face, thumbnails of all faces, and double-page views.
- Remembering the face being shown.

## Open questions

- When should the user albums of a forgotten session be removed? Same question in `photo.md` and `session.md`.
- Does a photo belong to the session or to the user album being made?
