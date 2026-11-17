# Wikipedia search

## What it is

The way Sorzs searches a sorz that lives on Wikipedia. Wikipedia offers its own search to anyone, so Sorzs asks it for the term and shows the pages it finds, each with a link and a short description. Unlike the stand-in searches, it returns real results.

## What defines it

- The sorz it applies to: any sorz whose site is a Wikipedia in some language.
- The language: the one in the sorz's address (`es` in `https://es.wikipedia.org/wiki/Ciberpunk`).
- The term the user searched for.
- The results: up to ten pages Wikipedia finds, most relevant first. Each has a title, a link to the page and a short description.

## Rules

- A sorz is a Wikipedia sorz when its address is a language site of `wikipedia.org`: a language code, then `.wikipedia.org`. The mobile form, a language code, then `.m.wikipedia.org`, is the same Wikipedia as the normal one. These are the only two forms: an address with any other labels before `wikipedia.org` is not a Wikipedia sorz. The path does not matter: `https://es.wikipedia.org/wiki/Ciberpunk` and `https://es.wikipedia.org` are the same Wikipedia sorz.
- A site that only looks like Wikipedia is not Wikipedia: `notwikipedia.org`, `es.wikipedia.org.evil.org`, or an address that has `wikipedia.org` only in its path.
- An address with no language, such as `wikipedia.org` or `www.wikipedia.org`, is not a Wikipedia sorz. It is searched by the generic provider, like any other sorz.
- A language code is one word of lowercase letters and hyphens (`es`, `en`, `simple`, `zh-yue`), anything but `www`. Sorzs keeps no list of languages: an address that has the shape of a language site without being one, such as `meta.wikipedia.org`, is searched as if it were, and since Wikipedia does not answer for it the user sees the line of a sorz that did not answer.
- The language is read from the sorz's address and nothing else. A sorz on `es.wikipedia.org` searches the Spanish Wikipedia, one on `en.wikipedia.org` the English one. The term is not translated: searching `ciberpunk` in English finds other pages than `cyberpunk`.
- The search covers the whole Wikipedia of that language, not the page the sorz's address names.
- A sorz returns at most ten results and no next page.
- The link of a result is the address of the page on the same language site: `https://es.wikipedia.org/wiki/Ciberpunk`. Special characters in the title are written the way web links require.
- The description of a result is the short description Wikipedia keeps for the page (`Subgénero de ciencia ficción…`). Some pages have none; for those the description is the passage where the term appears, with no formatting marks and as plain text. A result never has an empty description.
- A result looks like every other: the favicon of its sorz, the title of the page, the description and the sorz named as the list shows it (name, else title, else address).
- The results of a Wikipedia sorz take the place of that sorz in the merged list. Among sorzs the order stays the order they were added; among the results of one Wikipedia sorz it is Wikipedia's relevance.
- A Wikipedia sorz gets only Wikipedia results; it never gets the Google one.
- When Wikipedia finds nothing, that sorz adds no results and nothing is wrong.
- Sorzs waits 3 seconds for Wikipedia. When it does not answer in that time, the sorz is one that did not answer, and the user sees what [search.md](search.md) says of it; the results of the other sorzs still appear.
- Two sorzs of the same Wikipedia in one list are searched separately, even if their results repeat.
- Wikipedia asks every program that uses its search to identify itself and to slow down when it says so. Sorzs identifies itself as Sorzs and slows down when Wikipedia asks. The contact Sorzs gives is configuration, not a rule here.
- When Wikipedia asks Sorzs to slow down, that sorz did not answer, and Sorzs asks nothing more of that language's Wikipedia until the time Wikipedia names has passed, a minute if it names none. Other languages are not affected. Sorzs forgets the wait when it restarts.

## What can be done with it

- Search from the header box with a Wikipedia sorz in the list: its results are pages of that Wikipedia; the user follows each one to Wikipedia in a new tab.

## Out of scope

The content of the pages, images, a next page of results, searching several languages at once, translating the term, other Wikimedia sites (Wiktionary, Wikisource, Commons), signing in to Wikipedia.

## Open questions

None.

## Related

How a sorz picks its way of being searched: [search.md](search.md). The same idea for another site: [reddit-search.md](reddit-search.md).
