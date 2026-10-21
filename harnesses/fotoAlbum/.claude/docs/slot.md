# Slot

A slot is the place for a photo on a face of a user album (see `user-album.md`). What people call a page of the album is a face here, as in `album.md`. A face can have any number of slots, and a slot is occupied by a photo (see `photo.md`) or is empty.

A slot is only a place. It is not the photo, and it is not a layout. How slots come to exist on a face is another concept, not yet defined.

## What defines a slot

- **Identity**: a code the app invents when the slot is created. Nobody types it. It tells one slot from another.
- **Face**: the face of the user album it belongs to. A slot belongs to exactly one face.
- **Position**: where its top-left corner is on the face, as a distance to the right and a distance down from the top-left corner of the face. Both are whole millimetres, zero or more. The binding side of the face does not change how it is measured.
- **Dimensions**: width and height, in whole millimetres, each greater than zero.
- **Occupant**: the photo that occupies it, or none.

## Rules

- A face has no minimum or maximum number of slots, and may have none.
- A slot stays fully inside its face: its position plus its dimensions never go beyond the size of the face. Printing past the edge of the page is not possible.
- Slots on the same face never overlap. They may touch.
- A slot holds at most one photo.
- Only a photo of the same session as the user album can occupy a slot.
- The same photo may occupy several slots, on the same face or on different faces. A photo is not used up by being placed.
- Placing a photo in an occupied slot replaces the previous one. The replaced photo is not affected.
- A photo shown in a slot is never altered: the original and its thumbnail stay as they are.
- Photos cannot be deleted, so an occupied slot always has its photo.

## How a photo fits a slot

The whole photo is shown inside the slot, at its own proportions and as large as the slot allows, centred. When the proportions differ, the slot shows empty bands at the sides or above and below. Nothing of the photo is cropped or stretched.

## On the making page

Slots show on the face at their position and size, at the proportions of the face (see `user-album.md`). An empty slot shows as an outlined rectangle. An occupied slot shows the thumbnail of its photo, fitted as described above. A face with no slots shows empty, as it does today.

## What can be done

1. Place a photo in a slot: replacing the previous one when it is occupied.
2. Empty a slot: it keeps its place and has no photo.

## Out of scope

- Creating, moving, resizing and removing slots, and layouts that create them.
- How the person places or empties a slot (dragging, clicking).
- Cropping a photo to fill the slot, moving it inside the slot, rotating it, or any other fit.
- Slots that overlap, go past the edge of the face, or cross from one face to the next.
- Slots on the cover.
- Borders, rounded corners, captions and any look of the slot beyond what is described.

## Open questions

- How do slots come to exist on a face?
- Should a photo that is shown in a slot with empty bands be allowed to fill the slot instead, once cropping is wanted?
