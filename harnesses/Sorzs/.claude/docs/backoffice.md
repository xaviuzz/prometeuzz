# Backoffice

## What it is

The part of Sorzs where an administrator looks after Sorzs itself, apart from the sources every user trusts. It has two sections: Users, where the administrator sees and manages who may use Sorzs, and Sorzs, which for now is only a title.

## What defines it

- Who may enter: only a user with the admin role (see `user.md`). Today that is `xaviuzz`.
- Its sections: Users and Sorzs. Exactly one is active at a time.
- Its own place in the browser address: `/backoffice/users` and `/backoffice/sorzs`. Reloading the page shows the same section.

## Rules

- An admin sees, in the header of Sorzs, an icon button to enter the backoffice. Any other user does not see it.
- A user who is not an admin and asks for the backoffice by its address is sent back to Sorzs. Nothing of the backoffice shows.
- Entering the backoffice, or asking for `/backoffice` alone, shows Users as the active section.
- The header is the same as in Sorzs, without the search box and without the button that adds a source. It keeps the brand, the health mark and the log out button, and gains an icon button to go back to Sorzs. The brand is not a link.
- The side bar holds two entries, each with an icon and its name: Users and Sorzs. Choosing one makes it the active one and shows its title in the main panel. With the side bar collapsed, only the icons show, as in the source list.
- The main panel shows the title of the active section: "Users" or "Sorzs". Sorzs shows nothing else.
- The button to go back has no text; its accessible name is "Back to Sorzs". The button to enter has no text; its accessible name is "Backoffice".
- The backoffice has no source list and runs no search.
- Entering the backoffice is allowed by what the browser knows of the user, which only decides what is shown. What the Users section reads or changes is protected in the service: it refuses anyone who is not an admin, even with a valid pass, as forbidden, and does nothing. The browser then forgets the pass and shows the entry screen, as for any forbidden refusal (see `session.md`).

## The Users section

- Under the title there is a toolbar with one icon-only button to add a user. It shows a user icon with a plus; its accessible name is "Add user", with a tooltip.
- Below it, the list of all users, oldest first. Each row shows the username, the role, and one icon-only button to change the role: a shield with an up caret to make the user an admin (accessible name "Make admin"), a shield with a down caret to make the user a user (accessible name "Make user"). Each has a tooltip. A row offers only the change that applies to its current role.
- The add button opens a dialog with a Username field, a Password field and a Role selector, user by default, plus Add and Cancel. Pressing Add adds the user, closes the dialog and shows the new row. The dialog empties whenever it closes.
- A refusal (username taken, a missing field, the last admin) shows its message: inside the dialog when adding, beside the row when changing a role. Nothing changes.
- Changing a role needs no confirmation, since the opposite button undoes it. The row shows the new role at once.
- If the list cannot be read, the section shows the message of the failure and nothing else.
- A role change counts from that user's next request. A browser that still shows the backoffice button to a user who stopped being an admin is refused on its next request in the section.

## What can be done with it

- Enter it from the header, if admin.
- Switch between Users and Sorzs from the side bar.
- Go back to Sorzs from the header.
- In Users: see every user and their role, add a user, make a user an admin or a user (rules in `user.md`).

## Out of scope

Removing or renaming users, changing passwords, anything about the sources of all users, more roles than admin and user, a different look for the backoffice.

## Open questions

- What will the Sorzs section show: the sources everyone has registered, usage, health?
