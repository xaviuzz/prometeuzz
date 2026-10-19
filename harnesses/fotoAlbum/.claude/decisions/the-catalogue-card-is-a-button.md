# The catalogue card is a button

The card stops being a `Link` and becomes a `button` styled as the `Card`, named by the commercial name. Clicking it calls `userAlbum.create`, disables that card meanwhile and navigates to `/confeccion` only on success; on failure an `Alert` shows in the catalogue and the other cards stay active. Why: Xavier's choice; the click is an action with a result, not a navigation, and nothing may navigate when `create` fails.
