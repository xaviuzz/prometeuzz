# Wordmark in Rouge Script from a Google Fonts link

The app name in the header and the S of the add button use Rouge Script, loaded by a `<link>` in `index.html` with `text=Sorzs`. Why: no dependency (the alternatives were `@fontsource` and a font file in the repo), and the subset downloads only the five letters. The cost is a request to Google on each load; the fallback is the browser's `cursive`. A new letter set in this font needs the `text` parameter updated. The add button shows `S+` but keeps `aria-label="Add Sorz"`, so tests and e2e specs still find it by role.
