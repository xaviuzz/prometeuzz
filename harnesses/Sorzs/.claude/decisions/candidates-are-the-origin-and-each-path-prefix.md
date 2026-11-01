# Candidates are the origin and each path prefix, the pasted address as pasted

The candidate addresses of a pasted address are its origin and each prefix of its path, without query, fragment or final slash, and the last one is the address exactly as the user pasted it (trimmed). A derived address that differs from the pasted one only by the final slash is dropped.

Why: a site holds several sources and the user is choosing one of them; the pasted address is what the user meant, so it is never normalized, which also keeps source identity by exact address intact. `https://a.com/x` and `https://a.com/x/` are two sources, but they almost surely give the same page and title, so offering both is noise.
