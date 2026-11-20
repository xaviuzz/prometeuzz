# Appropedia search

## What it is

The way Sorzs searches the sorz `https://www.appropedia.org`. The wiki offers a search to anyone, so Sorzs asks it for the term and shows the pages it finds, each with a title, a link and a short description. Like Wikipedia and unlike the stand-in searches, it returns real results; unlike Wikipedia, the description is the fragment of the page around the term, not a summary.

## What defines it

- The sorz it applies to: the one on the host `appropedia.org` or any of its subdomains, `www.appropedia.org` included.
- The term the user searched for.
- The results: up to ten pages the wiki finds, most relevant first. Each has a title, a link to the page and a description.

## Rules

- A sorz is an Appropedia sorz when its host is `appropedia.org` or a subdomain of it. The path does not matter: `https://www.appropedia.org/Solar_cooker` and `https://appropedia.org` are the same sorz.
- The search covers the whole wiki, not the page the sorz's address names, and always asks `www.appropedia.org`, whatever host the sorz holds.
- A sorz returns at most ten results and no next page.
- The link of a result is the address of the page on `https://www.appropedia.org/`, followed by the title. Spaces in the title become `_`; every other character is written the way web links require, except `_`, `(`, `)`, `/` and `:`, which stay as they are (`Community_action/Join`). The address has no `/wiki/` part.
- The description of a result is the fragment of text the wiki shows around the term, without markup and with its characters readable (`"` and not `&quot;`). It may read as a cut piece of the page, without a beginning or an end. When the term matches only the title, the wiki gives no fragment and the description is empty; the result then shows no description line.
- The results of an Appropedia sorz take the place of that sorz in the merged list. Among sorzs the order stays the order they were added; among the results of one sorz it is the wiki's relevance.
- An Appropedia sorz gets only its own results; it never gets the Google one.
- When the wiki finds nothing, that sorz adds no results and nothing is wrong.
- Sorzs waits 3 seconds for the wiki. When the wiki does not answer in that time, answers with an error, or answers with something Sorzs cannot read, the sorz is one that did not answer, and the user sees what [search.md](search.md) says of it; the results of the other sorzs still appear.
- Sorzs identifies itself as Sorzs, with the same contact it gives Wikipedia. The contact is configuration, not a rule here.
- When the wiki asks Sorzs to slow down, that is one more sorz that did not answer. Sorzs keeps no memory of it and asks again on the next search.
- A sorz searched by Appropedia is shown to the user as "Appropedia": the list and the census mark it with the hint "Searched by Appropedia".

## What can be done with it

- Search from the header box with an Appropedia sorz in the list: its results are pages of the wiki; the user follows each one to the wiki in a new tab.

## Out of scope

The content of the pages, a summary of each page (the wiki gives none reliably), the wiki's HTML search page, a next page of results, the wikis of the Appropedia family in other languages, remembering that the wiki asked to slow down.

## Open questions

None.

## Related

How a sorz picks its way of being searched: [search.md](search.md). The same idea for another wiki: [geekfeminism-search.md](geekfeminism-search.md), [wikipedia-search.md](wikipedia-search.md).
