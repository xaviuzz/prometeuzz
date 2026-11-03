# Source

## What it is

A web address that Xavier trusts. Sorzs searches only inside the sources a user has registered.

## What defines it

- Its address: the exact text of a web address starting with `http://` or `https://`.
- Its own identifier, chosen by Sorzs when the source is first registered by anyone.
- Its title: the title the page at that address gives itself. It may be missing.
- Its favicon: the small icon the page at that address offers. It may be missing.

A source has no name. The name belongs to the user's list (see `source-list.md`). The title is not a name: it comes from the page, not from the user.

## Rules

- Two addresses are the same source only when they are written exactly the same, after removing spaces at both ends. `https://example.com` and `https://example.com/` are two sources. Smarter rules (a site that answers on several addresses) are added when a real case appears.
- The address must be a complete web address starting with `http://` or `https://`. Anything else is refused.
- Sorzs does not check that the site exists or is reliable. Trusting is the user's decision.
- When a source is first registered, Sorzs reads the page at its address to learn its title and favicon. If the page does not answer, is not a web page, or offers no title or no icon, the source is still registered, with that part missing.
- The favicon is the icon the page declares; when it declares none, the icon at the root of the site, kept only if the site answers for it. An icon whose address is not `http://` or `https://` is ignored, and then the root icon is not tried.
- Reading a page is limited: it gives up after 3 seconds, reads only the first megabyte, follows at most 3 redirects and accepts only web pages.
- The title is stripped of spaces at both ends and cut to 200 characters. A title empty after that counts as missing.
- Title and favicon are learned once, the first time the source is registered, and are never refreshed.
- A source is the same for everyone who registers it. A second user registering an address already known gets the same source, with the title and favicon already learned.

- A site often holds several sources. The candidate addresses of an address are its origin and each prefix of its path, without query, fragment or final slash, and the address as the user wrote it (spaces at both ends removed) as the last one. An address that differs from the written one only by the final slash is not a separate candidate address.
- At most 5 candidate addresses are read: the origin and the 4 deepest. Each is read with the limits above. A candidate address is a candidate only if its page gives a title.

- The census of sources is every source that is in the list of at least one user, each once, with the number of users who have it. A source that every user has removed stays known to Sorzs but is not in the census. Only an administrator sees it (see `backoffice.md`).

## What can be done with it

- It is created the first time someone registers its address.
- It is looked up by address when a user registers it.
- Its address can be inspected before registering, to learn the title and favicon the page offers. Nothing is registered by inspecting. Inspecting also gives the candidates: the title and favicon of each candidate address that has a title, from the root to the written address.

## Out of scope

Checking that the site answers, grouping addresses of the same site, previews, refreshing title or favicon, protecting against addresses that point to the machine's own network (revisit when there is more than one user), suggesting sources.

## Open questions

- Which rules say that two different addresses are one site? Not before a real case shows up.
- With a second user, a source registered by one must reach the other with its title and favicon already learned. That needs a store of sources apart from each user's list.
