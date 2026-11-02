# Source list

## What it is

The sources a user trusts, each with the name the user gave it, if any. It is the only place where searching looks, and what the user sees in the left side bar.

## What defines it

- One entry per source, holding the source and the user's name for it, if any.
- The order in which the entries were added, oldest first.
- There is one user for now, so there is one list.

## Rules

- Adding takes an address and, optionally, a name.
- Spaces at both ends of the name are removed before anything else. After that, an empty name means the user gave none; otherwise it has at most 60 characters.
- A list never holds the same source twice. Registering an address already in the list is refused with a message saying so; nothing is duplicated.
- A list never holds two entries with the same name. Names are compared ignoring upper and lower case. Registering a name already in use is refused with a message saying so. Entries without a name never clash with each other.
- When both the address and the name are already in the list, the refusal is about the address.
- A refusal changes nothing in the list.
- The list is the user's: the name belongs to the user and not to the source.
- An entry is shown by its name. With no name it is shown by the title of its source; with no title either, by its address. The system never copies the title into the name; the dialog only suggests it (see below).
- Each entry is shown with its source's favicon on the left of the text; with no favicon, a neutral icon. With the side bar collapsed, each entry shows only that icon.
- The list is kept for good. Reloading the page shows it again, and so does restarting the service. Each entry is saved as soon as it is added.
- If the saved list cannot be read when the service starts, the service does not start and the saved list is left as it was.

## What can be done with it

- Add a source: with an address and, optionally, a name, from a button at the right of the header. The entry appears in the side bar at once.
- While adding, once the address is written, the dialog suggests the title of the page as the name. The suggestion fills the name only when the user has not written one, or when it is still an earlier suggestion the user has not edited. The user may change or clear it. If the page offers no title, nothing is suggested.
- A suggested name is never longer than 60 characters, so it always fits. A title of 60 or fewer is suggested as it is. A longer one is cut at the last punctuation mark within its first 60 characters that stands next to a space (a separator like ` - `, ` | `, `: `, `. `, `, `) and lies past the 30th character; the mark is left out and nothing is added. With no such mark, it is cut at the last space within its first 59 characters and `…` is added. With no space either, it is cut at 59 characters and `…` is added. The title kept in the source stays whole. Leaving the address empty suggests nothing.
- While adding, once the address is written, the dialog also shows the page's favicon on the left of the name, or the neutral icon when the page offers none. Nothing is shown before the address is inspected, and changing the address hides it until the new one is inspected. If the page cannot be read, nothing is shown.
- While adding, when the address has two or more candidates (see `source.md`), the dialog lists them from the root to the written address, each with its favicon and title and its address as a hint on hover. The one whose address and name the dialog holds is marked. Clicking one replaces the address and the name with its address and title, even a name the user wrote; the list stays, so another can be clicked. Titles shown are not shortened by the name limit: a title longer than 60 characters goes into the name as the suggestion rule above shortens it. Changing the address hides the list until the new one is inspected. With fewer than two candidates, the list is not shown.
- See it: the side bar shows each entry in order of addition, with the address as a hint on hover. With no entries it says the user has no sources yet.

## Out of scope

Renaming, removing, reordering, several lists, several users, backups, moving the saved list between machines.

## Open questions

- When renaming exists, the same no-repeated-names rule applies to the new name, and clearing a name returns the entry to showing the title.
- Lists shared between users, and source suggestions, stay open as in the project description.
