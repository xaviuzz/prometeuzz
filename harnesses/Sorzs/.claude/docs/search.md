# Search

## What it is

Looking for a term across the sources a user trusts, from a box in the header. For now every source answers with a stand-in: a link that asks Google for the term, limited to that source's site. Real results from the sources themselves come later.

## What defines it

- The query: the text the user writes in the box.
- One result per source in the user's list, in the order of the list.
- Each result has a title, a link, a description and the source it comes from, shown as the list shows it (name, or title, or address).

## Rules

- A search covers every source in the list of the user who searches and nothing else; other users' sources never appear. It never widens to the open web.
- Spaces at both ends of the query are removed first. An empty query is refused; so is one longer than 200 characters.
- With no sources the search finds nothing and says nothing is wrong: the answer is an empty list.
- In this stage each source gives one result:
  - the title is always "Search it on Google";
  - the description reads "Google search for «query» limited to site", where site is the address of the source without `http://` or `https://` and without a final slash;
  - the link is a Google search for the query followed by the restriction to that site, path included. A source on `https://example.com/docs/` restricts Google to `example.com/docs`.
- The results of all sources are merged into one list in the order the sources were added.
- A link goes to the page it names, never to copied content, and opens in a new tab.
- The box searches on Enter or on the Search button. The button is off while the query is blank or the list has no sources.
- The query stays written after searching. The results stay until the next search, even if the list of sources changes meanwhile.
- While a search runs the user sees that it is running. If it fails the user sees why.
- When a new search starts before the previous one answers, the answer of the previous one is discarded.

## What can be done with it

- Search: write a term in the header box and search. The results appear in the main area, each with the favicon of its source, the title, the description and the source's name.
- Follow a result: its link opens in a new tab.

## Out of scope

Real results from the sources, ranking or mixing results, a "nothing found" screen, history, searching a subset of sources, suggestions while typing.

## Open questions

- Sorzs is meant to search from the frontend through a module the backend serves on demand. This stage searches in the backend as a stepping stone. What happens to the backend search when that module arrives is not decided.
