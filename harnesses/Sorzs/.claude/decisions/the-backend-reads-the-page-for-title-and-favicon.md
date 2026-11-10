# The backend reads the page for title and favicon

A new operation `sorzs.inspect` takes an address and returns the page's title and favicon; `sorzs.add` reads the page again on the server and never trusts what the client sends. Why: the browser cannot read most pages (CORS), and a client-supplied title would let the client write into a shared sorz.
