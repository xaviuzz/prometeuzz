# The CLI translates invalid credentials in the API layer

`Login` is an interface the domain owns; `ApiLogin` implements it over the generated client. A refusal with code `INVALID_CREDENTIALS` becomes the domain's `InvalidCredentials`; any other refusal reaches the caller as `CallRefusedError`, and a network failure as it is. Why: `domain/` imports no other layer, so `Session` cannot know `CallRefusedError`; and only that code means "say the credentials are not valid" (`session.md`), the rest is not something the user can fix.
