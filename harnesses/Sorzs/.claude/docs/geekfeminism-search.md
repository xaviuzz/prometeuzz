# Geek Feminism search

## What it is

The way Sorzs searches the sorz `https://geekfeminism.fandom.com`. The wiki offers a search to anyone, so Sorzs asks it for the term and shows the pages it finds, each with a title and a link. Unlike the stand-in searches, it returns real results; unlike Wikipedia, its results carry no description.

## What defines it

- The sorz it applies to: the one on the host `geekfeminism.fandom.com`.
- The term the user searched for.
- The results: up to ten pages the wiki finds, most relevant first. Each has a title and a link to the page.

## Rules

- A sorz is a Geek Feminism sorz when its host is `geekfeminism.fandom.com` or a subdomain of it. The path does not matter: `https://geekfeminism.fandom.com/wiki/AdaCamp` and `https://geekfeminism.fandom.com` are the same sorz.
- Any other Fandom wiki is not a Geek Feminism sorz. It is searched by the generic provider, like any other sorz.
- The search covers the whole wiki, not the page the sorz's address names.
- A sorz returns at most ten results and no next page.
- The link of a result is the address of the page on `https://geekfeminism.fandom.com/wiki/`, followed by the title. Spaces in the title become `_`; every other character is written the way web links require, except `_`, `(`, `)`, `/` and `:`, which stay as they are (`AdaCamp/AdaCampDCSessions`).
- The description of every result is empty. The wiki gives none in its search, and asking for one page at a time is out of scope. A result with no description shows only the favicon of its sorz, the title and the sorz named as the list shows it (name, else title, else address), with no blank line where the description would go.
- The results of a Geek Feminism sorz take the place of that sorz in the merged list. Among sorzs the order stays the order they were added; among the results of one sorz it is the wiki's relevance.
- A Geek Feminism sorz gets only its own results; it never gets the Google one.
- When the wiki finds nothing, that sorz adds no results and nothing is wrong.
- Sorzs waits 3 seconds for the wiki. When the wiki does not answer in that time, answers with an error, or answers with something Sorzs cannot read, the sorz is one that did not answer, and the user sees what [search.md](search.md) says of it; the results of the other sorzs still appear.
- Sorzs identifies itself as Sorzs, with the same contact it gives Wikipedia. The contact is configuration, not a rule here.
- When the wiki asks Sorzs to slow down, that is one more sorz that did not answer. Sorzs keeps no memory of it and asks again on the next search.
- Two sorzs of this wiki in one list are searched separately, even if their results repeat.

## What can be done with it

- Search from the header box with a Geek Feminism sorz in the list: its results are pages of the wiki; the user follows each one to the wiki in a new tab.

## Out of scope

The content of the pages, a description or an excerpt for each result (one call per page), the wiki's HTML search page, a next page of results, wikis in another language path, other Fandom wikis, remembering that the wiki asked to slow down.

## Open questions

None.

## Related

How a sorz picks its way of being searched: [search.md](search.md). The same idea for another site: [wikipedia-search.md](wikipedia-search.md).
