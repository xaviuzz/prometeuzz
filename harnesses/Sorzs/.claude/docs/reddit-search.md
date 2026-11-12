# Reddit search

## What it is

The way Sorzs searches a sorz that lives on Reddit. Instead of asking Google to look inside that site, it sends the user straight to Reddit's own search for the term. For now it is a stand-in, like every search in Sorzs: it gives a link, not the posts.

## What defines it

- The sorz it applies to: any sorz whose site is Reddit.
- The term the user searched for.
- One result: a link to Reddit's search page for that term.

## Rules

- A sorz is a Reddit sorz when its address is on `reddit.com` or on any of its subdomains (`www`, `old`, and so on). The path of the address does not matter: `https://www.reddit.com/r/spain` is a Reddit sorz like `https://reddit.com`.
- A site that only looks like Reddit is not Reddit: `notreddit.com`, `reddit.com.evil.org`, or an address that has `reddit.com` only in its path.
- The result has the title "Search it on Reddit" and the description "Reddit search for «term»".
- The link is Reddit's search page with the term in it. Spaces in the term become `+`; every other special character is written the way web links require. The term `beautifull women` gives `https://www.reddit.com/search/?q=beautifull+women`; `café & té` gives `https://www.reddit.com/search/?q=caf%C3%A9+%26+t%C3%A9`.
- The search covers all of Reddit. It is not limited to the sorz's path, so a sorz on `reddit.com/r/spain` still searches the whole site.
- The result names the sorz as the list shows it (name, else title, else address), like every search result.
- A Reddit sorz gets only this result; it never gets the Google one.

## What can be done with it

- Search from the header box with a Reddit sorz in the list: its result is the Reddit link; the user follows it to Reddit in a new tab.

## Out of scope

Posts or any content from Reddit, limiting the search to a subreddit, sorting or filtering Reddit's results, signing in to Reddit.

## Open questions

- Should a sorz on one subreddit search only that subreddit?
- Will Sorzs read real results from Reddit instead of linking to its search page? A Data Access Request is with Reddit; until it answers, the link stays. Findings: [reddit-api-access.md](../reference/reddit-api-access.md).
- Is Reddit's link the same on every Reddit address, such as `old.reddit.com`?

## Related

How a sorz picks its way of being searched: [search.md](search.md).
