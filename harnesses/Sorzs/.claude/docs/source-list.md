# Source list

## What it is

The sources a user trusts, each with the name the user gave it. It is the only place where searching looks, and what the user sees in the left side bar.

## What defines it

- One entry per source, holding the source and the user's name for it.
- The order in which the entries were added, oldest first.
- There is one user for now, so there is one list.

## Rules

- Adding takes an address and a name.
- The name is required. Spaces at both ends are removed before anything else. After that it cannot be empty and has at most 60 characters.
- A list never holds the same source twice. Registering an address already in the list is refused with a message saying so; nothing is duplicated.
- A list never holds two entries with the same name. Names are compared ignoring upper and lower case. Registering a name already in use is refused with a message saying so.
- When both the address and the name are already in the list, the refusal is about the address.
- A refusal changes nothing in the list.
- The list is the user's: the name belongs to the user and not to the source.
- The list is kept while the service runs. Reloading the page shows it again. Restarting the service empties it, until lists are saved for good.

## What can be done with it

- Add a source: with an address and a name. The entry appears in the side bar at once.
- See it: the side bar shows each name in order of addition, with the address as a hint on hover. With no entries it says the user has no sources yet.

## Out of scope

Renaming, removing, searching, reordering, several lists, several users, saving across restarts.

## Open questions

- When renaming exists, the same no-repeated-names rule applies to the new name.
- Lists shared between users, and source suggestions, stay open as in the project description.
