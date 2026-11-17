# Wikipedia search API

Findings from trying Wikipedia's search before building its provider. What Sorzs decided from them: [the decision](../decisions/wikipedia-search-reads-the-rest-search-and-takes-its-language-from-the-address.md).

## Two APIs

- REST: `https://<lang>.wikipedia.org/w/rest.php/v1/search/page?q=<term>&limit=<n>`. Each page has `id`, `key` (the title with underscores, builds `/wiki/<key>`), `title`, `excerpt` (HTML), `description` (may be null) and `thumbnail`. No total, word count or timestamp.
- Action API: `/w/api.php?action=query&list=search&srsearch=<term>&format=json&formatversion=2`. Adds `totalhits`, `wordcount`, `timestamp`, paging by `continue.sroffset`, and `srnamespace`, `srwhat`, `srsort`, `srprop`. `srlimit` goes 1 to 500, default 10.
- Both answered the same pages in the same order.

## Quirks seen

- `description` came null in 4 of 10 results for `ciberpunk` (es) and in 1 of 10 for `conglomerado masivo`. The fallback is `excerpt` with tags stripped and entities decoded (`&#039;`, `&quot;`); it starts mid-sentence.
- `excerpt` wraps the match in `<span class="searchmatch">`.
- The Action API `suggestion` for `ergodicity` was `eroticity`: do not show it.
- Each language needs its own term: `ciberpunk` and `cyberpunk` find different pages.
- `es.m.wikipedia.org` answers 301 to `es.wikipedia.org`, and `www.wikipedia.org` to `en.wikipedia.org`.
- A page link is `https://<lang>.wikipedia.org/wiki/<key>`, percent-encoded except `_`, `(` and `)`.

## Access policy

- Wikimedia asks every client for a meaningful User-Agent with a contact (a URL or an email); with none, the request falls in the lowest tier. [Access policy](https://www.mediawiki.org/wiki/Wikimedia_APIs/Access_policy).
- Rate limits are per user and higher when authenticated; they are announced as new in 2026 and may change. A 429 means back off: this comes from a third-party mirror, not confirmed on the official page. No limit was found for `search/page`.
