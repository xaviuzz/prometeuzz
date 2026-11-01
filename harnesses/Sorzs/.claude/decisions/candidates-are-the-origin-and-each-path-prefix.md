# Candidates are the origin and each path prefix, the pasted address as pasted

The tramos offered for an address are its origin and each prefix of its path, without query, fragment or final slash, and the last one is the address exactly as the user pasted it (trimmed). Why: a site holds several sources and the user is choosing one of them; the pasted address is what the user meant, so it is never normalized, which also keeps source identity by exact address intact.
