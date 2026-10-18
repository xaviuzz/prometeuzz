# Anonymous session

An anonymous session is how the app remembers one person on one browser without asking who they are. It is not an account: it has no name, no password and no owner.

## What defines a session

- **Identity**: a code the app invents when the session starts. Nobody types it, nobody sees it. It tells one session from another and gives the avatar its look.
- **Chosen album**: the album model the person chose to make, if any. A session has at most one.
- **Avatar**: a coloured circle with a generic person icon, shown in the header on every page. The colour follows from the identity, so the same session always looks the same and a new session looks different. It cannot be edited.

## Rules

- A session starts on its own the first time the app opens in a browser.
- The session is remembered between visits to the app, even after the browser is closed.
- Choosing an album from the catalogue records it in the session. From then on the person is taken to that album's making page, whatever page they open.
- A session keeps one chosen album. Choosing another one is only possible after starting over.
- Opening the address of an album's making page does not choose it. With no chosen album, that address leads to the catalogue. With a chosen album, it leads to the chosen one.
- If the chosen album is no longer in the catalogue, the making page says it was not found. The way out is starting over.
- If the browser cannot remember anything, the session still works while the page stays open and is lost when it closes. The person sees no error.

## What can be done

1. Start a session: automatic.
2. Choose an album: from a card in the catalogue.
3. Start over: from the avatar's menu, the only option it has. It asks for confirmation. Once confirmed, the identity and the chosen album are forgotten, a new session begins with a new avatar, and the person returns to the catalogue.

## Out of scope

- Names, accounts, sign-in and anything shared between browsers or devices.
- Photos, layouts and concrete albums kept in the session.
- Getting back a session that was left behind by starting over.

## Open questions

- With the app open in two tabs, starting over in one does not reach the other until it is reloaded. Should it?
- What does the session keep once concrete albums exist?
