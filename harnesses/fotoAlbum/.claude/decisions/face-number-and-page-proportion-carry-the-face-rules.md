# Face number and page proportion carry the face rules

A `FaceNumber` value object holds the position and answers `next`, `previous`, `isFirst`, `isLast`, `bindingSide` and its "n/N" label; `FaceViewer` only keeps one in its state. `PresentedAlbum` answers `pageProportion()` for the face's `aspect-ratio`. Why: Xavier's choice; tell, don't ask: the binding side, the limits and the proportion belong with the data they follow from (see "Binding side follows the face number"), and the value object is tested apart while `FaceViewer` is tested through its buttons, label and `data-binding-side`.
