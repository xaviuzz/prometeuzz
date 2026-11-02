# A seed user may carry a role

A `SEED_USERS` pair may take a third field, `username:password:role`. The role is `admin` or `user`; a pair with two fields is a `user`; any other role refuses the start. Development and e2e set `xaviuzz:p1casso:admin,ana:pueblos`. Why: the variable already grows with the users, and a role is one more attribute of the same user, so no second variable or file to keep in step. Only `admin` and `user` exist; finer permissions wait for a real need.
