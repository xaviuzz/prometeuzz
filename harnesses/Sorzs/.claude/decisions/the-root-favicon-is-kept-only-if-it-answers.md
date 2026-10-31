# The root favicon is kept only if it answers

When a page declares no icon, the reader asks the site root for `/favicon.ico` and keeps it only if it answers with a success status, within the same time and redirect limits as the page. An icon the page declares is kept as written when it is an `http` or `https` address; otherwise the favicon is missing and the root is not tried. Why: the side bar shows the icon as an image, so an address that does not answer would show a broken image instead of the neutral icon; a page that declares an icon has chosen it, so guessing another is not its own.
