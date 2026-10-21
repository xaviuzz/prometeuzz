# Slot

A slot is the place for a photo on a face of a user album (see `user-album.md`). What people call a page of the album is a face here, as in `album.md`. A slot is occupied by a photo (see `photo.md`) or is empty.

A slot is only a place. It is not the photo, and it is not a layout. For now every face has one fixed slot; how slots will come to exist on a face in general is another concept, not yet defined.

## What defines a slot

- **Identity**: while a face has a single slot, the face number tells it apart. A code will be needed once a face can have several.
- **Face**: the face of the user album it belongs to. A slot belongs to exactly one face.
- **Position**: where its top-left corner is on the face, as a distance to the right and a distance down from the top-left corner of the face. Both are whole millimetres, zero or more. The binding side of the face does not change how it is measured.
- **Dimensions**: width and height, in whole millimetres, each greater than zero.
- **Occupant**: the photo that occupies it, or none.

## The slot of a face

Every face of a user album has exactly one slot, from the moment the user album exists. It takes 90 % of the width and 90 % of the height of the face, leaving 5 % of margin on each of the four sides. When 5 % or 90 % of the page size is not a whole number of millimetres, the position and dimensions are rounded inwards to the millimetre, so the slot never goes beyond the face. Position and dimensions follow from the page size, so they are never stored or changed; only the occupant is kept. The cover has no slot.

## Rules

- A slot stays fully inside its face: its position plus its dimensions never go beyond the size of the face. Printing past the edge of the page is not possible.
- Slots on the same face never overlap. They may touch.
- A slot holds at most one photo.
- A photo is in one place only: in the photo tray or in one slot. Placing it takes it out of the tray, and emptying the slot puts it back.
- Two uploads of the same image are two photos (see `photo.md`), so one may be in a slot while the other stays in the tray.
- Only a photo of the same session as the user album can occupy a slot.
- Placing a photo in an occupied slot replaces the previous one, which goes back to the tray.
- A photo shown in a slot is never altered: the original and its thumbnail stay as they are.
- Photos cannot be deleted, so an occupied slot always has its photo.
- A photo that goes back to the tray takes the place its upload order gives it, not the end.
- The occupants are kept by the app, so they are still there after reloading or reopening the app.

## How a photo fits a slot

The whole photo is shown inside the slot, at its own proportions and as large as the slot allows, centred. When the proportions differ, the slot shows empty bands at the sides or above and below. Nothing of the photo is cropped or stretched. What is shown is the thumbnail of the photo, so a large slot shows it magnified.

## On the making page

The slot shows on the face at its position and size, at the proportions of the face (see `user-album.md`). An empty slot shows as a thin blue line around its rectangle. An occupied slot has no line: it shows the thumbnail of its photo, fitted as described above. Nothing else changes while a photo is dragged over a slot or over the tray.

## What can be done

1. Place a photo in a slot: by dragging it from the photo tray onto the slot, replacing the previous one when the slot is occupied.
2. Empty a slot: by dragging its photo onto the photo tray, dropped anywhere in it. The slot keeps its place and has no photo.

Dragging is done with the mouse. Touch screens and the keyboard are not covered yet.

## Out of scope

- Creating, moving, resizing and removing slots, and layouts that create them.
- Moving a photo from one slot to another, which would need two faces on screen.
- Dragging with touch or the keyboard.
- Showing the original photo in the slot instead of its thumbnail.
- Cropping a photo to fill the slot, moving it inside the slot, rotating it, or any other fit.
- Slots that overlap, go past the edge of the face, or cross from one face to the next.
- Slots on the cover.
- Borders, rounded corners, captions and any look of the slot beyond what is described.

## Open questions

- How do slots come to exist on a face once there can be more than one?
- Should a photo that is shown in a slot with empty bands be allowed to fill the slot instead, once cropping is wanted?
- Does the same photo need to be placeable in several slots once layouts arrive?
