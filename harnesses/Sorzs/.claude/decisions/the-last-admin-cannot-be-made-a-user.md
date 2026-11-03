# The last admin cannot be made a user

Changing a role refuses, with code `LAST_ADMIN`, to make a user of the only remaining admin. An admin may make themself a user while another admin exists. A username already taken on adding is refused with `USERNAME_TAKEN`. An unknown role, or a `setRole` on a username that does not exist, is `INVALID_BODY` with a message. Why: with no admin nobody could reach the backoffice again short of editing the database; the rule costs one check in the domain. Forbidding self-demotion outright was rejected: it blocks a legitimate handover between two admins.
