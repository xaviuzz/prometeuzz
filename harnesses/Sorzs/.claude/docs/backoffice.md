# Backoffice

## What it is

The part of Sorzs where an administrator looks after Sorzs itself, apart from the sources every user trusts. For now it is only a frame: two sections, each with a title and nothing else.

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
- The main panel shows only the title of the active section: "Users" or "Sorzs".
- The button to go back has no text; its accessible name is "Back to Sorzs". The button to enter has no text; its accessible name is "Backoffice".
- The backoffice has no source list and runs no search.
- Entering the backoffice is allowed by what the browser knows of the user. Nothing in the service is protected yet because nothing in the backoffice reads or changes anything. The first operation that does must refuse anyone who is not an admin.

## What can be done with it

- Enter it from the header, if admin.
- Switch between Users and Sorzs from the side bar.
- Go back to Sorzs from the header.

## Out of scope

Listing, creating or removing users, anything about the sources of all users, more roles than admin and user, a different look for the backoffice.

## Open questions

- What will the Users section show and let the admin do?
- What will the Sorzs section show: the sources everyone has registered, usage, health?
