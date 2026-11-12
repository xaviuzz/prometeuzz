# Reddit API access

Research for the open question "will Sorzs read real results from Reddit?" ([reddit-search.md](../docs/reddit-search.md)). Checked on 2026-11-12; Reddit changes access rules often, so re-check before building.

## Routes to real results

| Route | Verdict |
|---|---|
| Link to Reddit's search page | What Sorzs does today. No parsing, no credentials. |
| Public JSON (`/search.json`), RSS (`/search.rss`) | Blocked. Spike from the dev host: 403 "blocked by network security" on every try, with `curl` and with a custom User-Agent, on `www.reddit.com`; `old.reddit.com` answered 302. Not tested from the backend container. |
| Official Data API with OAuth | The viable route. Needs an access request, then an app with a secret held by the backend. |
| Devvit (developers.reddit.com) | Does not fit. See below. |
| Generic provider (Google `site:reddit.com`) | Links only, no posts. |

## Official Data API

- Register the app at `reddit.com/prefs/apps` (type `web app`; a redirect URI is required even if unused). It gives a client id and a secret.
- Token without a user: `POST https://www.reddit.com/api/v1/access_token`, Basic auth with id and secret, body `grant_type=client_credentials`. It expires in about an hour.
- Search: `GET https://oauth.reddit.com/search` with `Authorization: Bearer <token>` and a unique User-Agent `app/version (by /u/<username>)`.
- Reddit now asks for a Data Access Request before granting access. The form asks for the purpose, what Devvit lacks for the case, the source code link and the subreddits. The request for Sorzs was sent; no answer yet.

## Search parameters

- `q`: the term.
- `sort`: `relevance`, `hot`, `top`, `new`, `comments`.
- `t`: `hour`, `day`, `week`, `month`, `year`, `all`.
- `limit`: up to 100.
- `after` / `before`: a fullname such as `t3_abc123`, not a page number.
- `type`: `link`, `sr`, `user`.
- `restrict_sr=1` on `/r/<sub>/search`: limits the search to one subreddit. This answers the open question about a sorz on one subreddit.
- `include_over_18=on`.

## Reply shape

A `Listing`: `{ kind: "Listing", data: { after, before, children: [{ kind: "t3", data: {...} }] } }`.

- A post (`t3`) carries `title`, `permalink`, `url`, `subreddit`, `author`, `selftext`, `score`, `num_comments`, `created_utc` (seconds), `over_18`, `is_self`.
- The link to the thread is `https://www.reddit.com` + `permalink`. `url` may point outside Reddit.
- `after` is `null` on the last page.
- Sorzs shows links, never copied content: map `title`, the permalink and `subreddit`; leave `selftext` out.

## Devvit

- Devvit apps run on Reddit's infrastructure and are installed in subreddits. The Reddit client (`reddit.searchPosts({ query, subredditName, sort, timeframe, limit })`) exists only in that server code, and needs no `prefs/apps` registration.
- An outside backend cannot import it. The only way in from outside is External Endpoints: limited access by form, a secret token, 5 requests per second, meant for trusted services calling an app installed in a community. A Devvit web app cannot make external requests from its client.
- Devvit's docs say Reddit wants Data API apps to move to Devvit, so access to the Data API may stay hard. Unverified.
- The fetch tool refused `developers.reddit.com`; the pages were read with `curl` from `/docs/llms.txt` and the `.md` variants.
