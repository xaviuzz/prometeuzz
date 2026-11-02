# The add form empties when the dialog closes

`AddSourceForm` lives inside `DialogContent`, which Radix unmounts on close, so its state (address, title, inspected page, message) is gone when the dialog reopens. Nothing resets it by hand. Why: a half-typed source is not worth keeping, and a reset step would be code to keep a behavior nobody asked for. `AddSourceDialog` keeps only whether it is open.
