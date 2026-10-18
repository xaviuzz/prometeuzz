# Album

In this document "album" always means the catalogue model, never a physical album owned by someone.

An album is a model in the catalogue: a physical photo album that can be offered, described by its size, page count and binding. "A 210 × 210 mm hardcover with 24 pages" is an album. It holds no photos and no layout. A concrete album, made from a model and filled with someone's photos, is another concept, not yet defined and not yet named. It will take its size, page count and binding from the model it is made from.

## What defines an album

- **Reference**: a code typed by the user when creating the album. Unique, readable, never changes. It identifies the album.
- **Commercial name**: the label shown to people. Required, can change, can repeat across albums.
- **Album size**: width and height of the closed album, in millimetres.
- **Page size**: width and height of one page, in millimetres. All pages of an album are the same size.
- **Page count**: how many pages the album has.
- **Binding**: hardcover or softcover.

Orientation is not entered. It follows from the album size: square when width and height are equal, portrait when the height is larger, landscape when the width is larger.

## Rules

- A reference is required and holds letters, digits and hyphens, without spaces. Capitals do not matter: `fam-2025` and `FAM-2025` are the same reference.
- Every measure is a whole number of millimetres greater than zero. There is no upper limit.
- A page is never wider or taller than the closed album.
- The page count is always even, because each sheet has two faces. There is no minimum or maximum for now, for any binding.
- Once created, an album's size, page size, page count and binding never change. A different format is a different album. Changing it would invalidate any layout made on the old one. Only the commercial name can be edited.
- The only bindings are hardcover and softcover. More are added when a real need appears.
- A withdrawn album keeps its reference, so the reference is never reused.

## What can be done

1. Create an album.
2. Consult an album by its reference.
3. List albums.
4. Rename an album: change its commercial name.
5. Withdraw an album from the catalogue. Albums are never deleted.

## Choosing an album

People choose which album to make from the list of albums in the catalogue, each shown with its commercial name and its characteristics. Choosing one opens the place where that album will be made, which shows its commercial name, reference, album size, page size, page count, binding and orientation. Choosing stores nothing. Until albums can be created, the catalogue holds a few sample albums: one square, one portrait and one landscape.

## Out of scope

- Photos, pages' content and layout.
- Concrete albums, and orders or printing.
- Paper, cover finish and colour.
- Users and ownership. For now every album is visible to everyone.
- Limits on measures and page counts.

## Open questions

- Can a withdrawn album return to the catalogue?
- Does the list include withdrawn albums, or only those in the catalogue?
- Can a withdrawn album still be consulted by its reference?
- What does a concrete album keep of its model once the model is withdrawn?
