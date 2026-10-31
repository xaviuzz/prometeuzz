# Source

## What it is

A web address that Xavier trusts. Sorzs searches only inside the sources a user has registered.

## What defines it

- Its address: the exact text of a web address starting with `http://` or `https://`.
- Its own identifier, chosen by Sorzs when the source is first registered by anyone.

A source has no name. The name belongs to the user's list (see `source-list.md`).

## Rules

- Two addresses are the same source only when they are written exactly the same, after removing spaces at both ends. `https://example.com` and `https://example.com/` are two sources. Smarter rules (a site that answers on several addresses) are added when a real case appears.
- The address must be a complete web address starting with `http://` or `https://`. Anything else is refused.
- Sorzs does not check that the site exists or is reliable. Trusting is the user's decision.
- A source is the same for everyone who registers it. A second user registering an address already known gets the same source.

## What can be done with it

- It is created the first time someone registers its address.
- It is looked up by address when a user registers it.

## Out of scope

Checking that the site answers, grouping addresses of the same site, favicons or previews, suggesting sources.

## Open questions

- Which rules say that two different addresses are one site? Not before a real case shows up.
