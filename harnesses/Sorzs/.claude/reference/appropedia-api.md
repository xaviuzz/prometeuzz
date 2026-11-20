# Appropedia search API

Findings from trying the wiki's search before building its provider, measured on 2026-11-20 with `curl` and a browser-like User-Agent. What Sorzs decided from them: [the decision](../decisions/appropedia-search-reads-the-wiki-api-from-a-fixed-host.md).

## The API

- Appropedia runs MediaWiki 1.45.5.
- `https://www.appropedia.org/w/api.php?action=query&list=search&srsearch=<term>&srlimit=10&format=json` answers 200 in about 0.8 s.
- Each hit in `query.search` carries `title`, `pageid`, `size`, `wordcount`, `timestamp` and a `snippet`. A search for `code` reports 1459 hits.
- No hits give an empty `query.search`.

## Quirks seen

- The API path is `/w/api.php`; the Geek Feminism wiki's is `/api.php`.
- `appropedia.org` answers 301 to `www.appropedia.org`, so the provider asks `www` directly.
- The `snippet` is HTML: `<span class="searchmatch">` wraps each match and character references such as `&quot;` appear. It is a fragment around the matches, without ellipsis, and may carry the leftovers of headings and lists. It is empty when the match is only in the title.
- An article lives at `https://www.appropedia.org/<Title_with_underscores>`, with no `/wiki/`. `fullurl` and `canonicalurl` confirm it. Titles may hold `/` (`Community_action/Join`).
- `prop=extracts` exists with `generator=search`, but the intro is empty for pages that open with a list or a template (`FAST Free Software`), and the reply becomes `query.pages[]` ordered by `index`. It is not used.
- `Special:Search` is HTML and is not read. The provider reads the API only.
