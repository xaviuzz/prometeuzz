# Backoffice

## What it is

The part of Sorzs where an administrator looks after Sorzs itself, apart from the sources every user trusts. It has two sections: Users, where the administrator sees and manages who may use Sorzs, and Sorzs, where the administrator sees every source that any user has registered and how many users have it.

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
- The main panel shows the title of the active section: "Users" or "Sorzs", and below it the content of that section.
- The button to go back has no text; its accessible name is "Back to Sorzs". The button to enter has no text; its accessible name is "Backoffice".
- The backoffice has no source list and runs no search.
- Entering the backoffice is allowed by what the browser knows of the user, which only decides what is shown. What the Users and Sorzs sections read or change is protected in the service: it refuses anyone who is not an admin, even with a valid pass, as forbidden, and does nothing. The browser then forgets the pass and shows the entry screen, as for any forbidden refusal (see `session.md`).

## The Users section

- Under the title there is a toolbar with one icon-only button to add a user. It shows a user icon with a plus; its accessible name is "Add user", with a tooltip.
- Below it, the list of all users, oldest first. Each row shows the username, the role, and one icon-only button to change the role: a shield with an up caret to make the user an admin (accessible name "Make admin"), a shield with a down caret to make the user a user (accessible name "Make user"). Each has a tooltip. A row offers only the change that applies to its current role.
- The add button opens a dialog with a Username field, a Password field and a Role selector, user by default, plus Add and Cancel. Pressing Add adds the user, closes the dialog and shows the new row. The dialog empties whenever it closes.
- A refusal (username taken, a missing field, the last admin) shows its message: inside the dialog when adding, beside the row when changing a role. Nothing changes.
- Changing a role needs no confirmation, since the opposite button undoes it. The row shows the new role at once.
- If the list cannot be read, the section shows the message of the failure and nothing else.
- A role change counts from that user's next request. A browser that still shows the backoffice button to a user who stopped being an admin is refused on its next request in the section.

## The Sorzs section

- Below the title, a list of every source that is in the list of at least one user. A source no user has any more does not show.
- Each row shows, from left to right, the favicon of the source, its address written in full as it was registered, and on the right the number of users who have it in their list. The row has no title and no name: the names belong to each user.
- The favicon is the one the source learned. A source with no favicon shows the generic globe icon, as in the source list.
- The number counts users, not names: a source that two users have under different names counts 2. It has no visible text; its accessible name is "N users", or "1 user" for one, with a tooltip.
- The rows are in alphabetical order of the address, ignoring upper and lower case, and the scheme is part of the address, so `http://` comes before `https://`. Each source shows once; `https://a.com` and `https://a.com/` are two sources and two rows.
- The section only shows. Rows have no buttons, do not open the site and offer no way to remove a source.
- With no sources in any list, the section shows the title and an empty list, with no special text. If the list cannot be read, the section shows the message of the failure and nothing else.

## What can be done with it

- Enter it from the header, if admin.
- Switch between Users and Sorzs from the side bar.
- Go back to Sorzs from the header.
- In Users: see every user and their role, add a user, make a user an admin or a user (rules in `user.md`).
- In Sorzs: see every source in use, with its favicon, its address and how many users have it.

## Out of scope

Removing or renaming users, changing passwords, removing or changing the sources of other users, health or usage figures beyond the number of users, more roles than admin and user, a different look for the backoffice.

## Open questions

- Does the administrator need to see which users have a source, not only how many?
