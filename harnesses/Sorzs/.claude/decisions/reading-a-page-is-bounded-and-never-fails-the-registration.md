# Reading a page is bounded and never fails the registration

The reader gives up after 3 seconds in all, favicon check included, reads at most 1 MB, follows at most 3 redirects and accepts only HTML. Any failure leaves title and favicon missing and the registration succeeds. There is no protection against addresses that point to the host's own network (SSRF).

The favicon is the icon the page declares, kept when it is an `http` or `https` address; otherwise it is missing and the root is not tried. When the page declares none, the reader asks the site root for `/favicon.ico` and keeps it only if it answers with a success status.

Why: the limits stop a slow or huge site from hanging the backend; the dropped schemes keep `javascript:` and `data:` out of an `<img>`; a failure cannot refuse a registration because Sorzs does not check that a site exists. The root favicon is checked because the side bar shows the icon as an image, and an address that does not answer would show a broken image instead of the neutral icon; a page that declares an icon has chosen it, so guessing another is not ours to do. SSRF protection is skipped on purpose while the only user is Xavier; revisit it before a second user exists.
