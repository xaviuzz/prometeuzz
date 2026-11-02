# User

## What it is

A person who may use Sorzs. Nobody uses Sorzs without being one.

## What defines it

- Its username: the name it enters with.
- Its password: a secret only the user knows. Sorzs never keeps it as written; it keeps only something from which the password cannot be recovered.

## Rules

- For now there are exactly two users, `xaviuzz` and `ana`, and nobody can create, change or remove users.
- Usernames and passwords come from the service's setup when it starts, so the code and the repository do not hold them. The setup used in development and in tests gives `xaviuzz` with `p1casso` and `ana` with `pueblos`.
- A username and a password match a user only when both are exactly right. Upper and lower case count.
- Each user has a personal list of sources (see `source-list.md`). No user sees or changes another's list.
- The list saved before there were two users belongs to `xaviuzz`. `ana` starts with an empty one.

## What can be done with it

- Enter Sorzs with its username and password (see `session.md`).

## Out of scope

Creating, renaming, removing users, changing a password, recovering a lost password, more than two users, roles.
