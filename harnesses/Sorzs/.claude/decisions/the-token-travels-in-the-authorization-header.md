# The token travels in the Authorization header

Every call except `health.check` and `auth.login` carries `Authorization: Bearer <token>`. The transport reads it before the `Call` is read; operations never see the token. Why: one place checks access for every route, so a new operation is protected without code, and the body keeps only what the operation needs. The frontend adds the header in one middleware on the client, so operation classes do not change. A token inside the call header was rejected: it would make every operation read and check it.
