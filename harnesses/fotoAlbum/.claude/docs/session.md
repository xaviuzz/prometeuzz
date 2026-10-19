# Anonymous session

An anonymous session is how the app remembers one person on one browser without asking who they are. It is not an account: it has no name, no password and no owner.

## What defines a session

- **Identity**: a code the app invents when the session starts. Nobody types it, nobody sees it. It tells one session from another and gives the avatar its look.
- **User album**: the user album (see `user-album.md`) created when the person chose an album model to make, if any. A session has at most one. The app keeps it with the session's identity; the browser keeps only the identity.
- **Photos**: the photos uploaded from this session (see `photo.md`). The app stores them against the identity, which is the only thing of the session it ever receives. A session has as many as were uploaded.
- **Avatar**: a coloured circle with a generic person icon, shown in the header on every page. The colour follows from the identity, so the same session always looks the same and a new session looks different. It cannot be edited.

## Rules

- A session starts on its own the first time the app opens in a browser.
- The session is remembered between visits to the app, even after the browser is closed.
- Choosing an album from the catalogue creates the user album and records it in the session. From then on the person is taken to that album's making page, whatever page they open.
- A session keeps one user album. Choosing another album is only possible after starting over.
- Opening the address of an album's making page does not choose it. With no user album, that address leads to the catalogue. With one, it leads to its making page.
- A withdrawn model does not affect the user album: it keeps what it copied from the model.
- If the browser cannot remember anything, the session still works while the page stays open and is lost when it closes. The person sees no error.

## What can be done

1. Start a session: automatic.
2. Choose an album: from a card in the catalogue.
3. Start over: from the avatar's menu, the only option it has. It asks for confirmation. Once confirmed, the identity and the user album are forgotten, a new session begins with a new avatar and no photos, and the person returns to the catalogue. The old photos and the old user album stay stored but nobody can reach them.

## Out of scope

- Names, accounts, sign-in and anything shared between browsers or devices.
- Layouts kept in the session.
- Getting back a session that was left behind by starting over.

## Open questions

- With the app open in two tabs, starting over in one does not reach the other until it is reloaded. Should it?
- When are the photos and the user album of a forgotten session removed? Same question in `photo.md` and `user-album.md`.
