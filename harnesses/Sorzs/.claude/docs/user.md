# User

## What it is

A person who may use Sorzs. Nobody uses Sorzs without being one.

## What defines it

- Its username: the name it enters with.
- Its password: a secret only the user knows. Sorzs never keeps it as written; it keeps only something from which the password cannot be recovered.
- Its role: admin or user.
- The order in which it joined Sorzs, oldest first.

## Rules

- The users are kept for good, with the rest of what Sorzs keeps. Reloading the page shows them again, and so does restarting the service.
- When the service starts, its setup names users with a password and, optionally, a role. Each one not yet known to Sorzs joins it; one already known is left as it is, so a role changed later survives a restart. The setup is required, so a fresh Sorzs always has someone to enter with.
- The setup used in development and in tests gives `xaviuzz` with `p1casso` as admin and `ana` with `pueblos` as user. A user set up without a role is a user.
- A username is unique. Upper and lower case count, so `Ana` and `ana` are different names.
- A username and a password match a user only when both are exactly right.
- Only an admin can see the users, add one or change a role, and only an admin can enter the backoffice (see `backoffice.md`).
- Adding a user takes a username, a password and a role, which is user unless chosen otherwise. A username or a password that is empty or only spaces is refused with a message saying so, and so is a username already taken; nothing is added.
- Changing a role makes the user an admin or a user. The change counts from the next request that user makes, since the role is read each time and not kept in the pass.
- Sorzs always has at least one admin. Making the last admin a user is refused with a message saying so; nothing changes. An admin may make themself a user while another admin remains.
- A refusal changes nothing.
- Each user has a personal list of sorzs (see `sorz-list.md`). No user sees or changes another's list.
- The list saved before there were users belongs to `xaviuzz`. A user who joins starts with an empty one.

## What can be done with it

- Enter Sorzs with its username and password (see `session.md`).
- If admin: see all users with their roles, add a user, and make a user an admin or a user, from the Users section of the backoffice.

## Out of scope

Removing or renaming users, changing or recovering a password, a user changing their own password, roles other than admin and user, seeing or changing another user's sorzs.
