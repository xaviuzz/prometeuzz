# Search

## What it is

Looking for a term across the sorzs a user trusts, from a box in the header. Each sorz is searched by a provider: a specific provider when one suits its site (each has its own doc: [reddit-search.md](reddit-search.md), [wikipedia-search.md](wikipedia-search.md), [geekfeminism-search.md](geekfeminism-search.md)), else the generic provider, which answers with a stand-in link that searches Google limited to the sorz's site. Real results from the other sorzs themselves come later.

## What defines it

- The query: the text the user writes in the box.
- The results of each sorz in the user's list, in the order of the list: one, or several when its provider returns real results.
- Each result has a title, a link, a description and the sorz it comes from, shown as the list shows it (name, or title, or address). The description may be empty, as for Geek Feminism; the result then shows no description line.
- The sorzs that did not answer, if any, each named after all the results.

## Rules

- A search covers every sorz in the list of the user who searches and nothing else; other users' sorzs never appear. It never widens to the open web.
- Spaces at both ends of the query are removed first. An empty query is refused; so is one longer than 200 characters.
- With no sorzs the search finds nothing and says nothing is wrong: the answer is an empty list.
- Each sorz gives the results of its provider: one for a stand-in provider, up to the provider's limit for one that returns real results. A sorz has a specific provider when one suits its site; every other sorz has the generic provider, which can search any sorz. The provider of a sorz depends only on its address, so it is the same for every user. The generic provider's answer:
  - the title is always "Search it on Google";
  - the description reads "Google search for «query» limited to site", where site is the address of the sorz without `http://` or `https://` and without a final slash;
  - the link is a Google search for the query followed by the restriction to that site, path included. A sorz on `https://example.com/docs/` restricts Google to `example.com/docs`.
- The results of all sorzs are merged into one list in the order the sorzs were added; the results of one sorz stay together.
- When the provider of a sorz does not answer, that sorz adds no results and the search is not a failure: after the results of all sorzs the user sees one line for it, «name did not answer», with the sorz named as the list shows it and no cause. The lines follow the order of the list, and the results of the other sorzs still appear.
- A link goes to the page it names, never to copied content, and opens in a new tab.
- The box searches on Enter or on the Search button. The button is off while the query is blank or the list has no sorzs.
- The query stays written after searching. The results stay until the next search, even if the list of sorzs changes meanwhile.
- While a search runs the user sees that it is running. If it fails the user sees why.
- When a new search starts before the previous one answers, the answer of the previous one is discarded.

## What can be done with it

- Search: write a term in the header box and search. The results appear in the main area, each with the favicon of its sorz, the title, the description and the sorz's name.
- Follow a result: its link opens in a new tab.

## Out of scope

Real results from sorzs other than Wikipedia and Geek Feminism, ranking or mixing results, a "nothing found" screen, history, searching a subset of sorzs, suggestions while typing.

## Open questions

- Sorzs is meant to search from the frontend through a module the backend serves on demand. This stage searches in the backend as a stepping stone. What happens to the backend search when that module arrives is not decided.
