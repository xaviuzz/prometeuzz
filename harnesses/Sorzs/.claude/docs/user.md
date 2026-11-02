# User

## What it is

A person who may use Sorzs. Nobody uses Sorzs without being one.

## What defines it

- Its username: the name it enters with.
- Its password: a secret only the user knows. Sorzs never keeps it as written; it keeps only something from which the password cannot be recovered.

## Rules

- For now there is exactly one user, `xaviuzz`, and nobody can create, change or remove users.
- Its username and password come from the service's setup when it starts, so the code and the repository do not hold them. The setup used in development and in tests gives `xaviuzz` and `p1casso`.
- A username and a password match a user only when both are exactly right. Upper and lower case count.
- The user's list of sources is not tied to the user: there is one list, and any user who gets in sees it.

## What can be done with it

- Enter Sorzs with its username and password (see `session.md`).

## Out of scope

Creating, renaming, removing users, changing a password, recovering a lost password, several users, roles.

## Open questions

- When there is a second user, each one gets a personal list. How does the existing list pass to the first one?
