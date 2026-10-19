# The tray scrolls natively and keeps its own state

`PhotoTray` loads and uploads through `usePhotos` and holds its own state; thumbnails, rejected files and the upload button are presentational parts. The thumbnail list scrolls with plain overflow, so no `scroll-area` was added. Rejection reasons in Spanish live in `lib/`, like the album labels.
