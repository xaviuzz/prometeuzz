# The page reader is an interface the domain owns

`domain/sorz/` defines the page reader; `infrastructure/` implements it over HTTP. Unit tests use a fake reader; one integration test reads from a local server started inside the test. The e2e stack serves a sample page (a `<title>` and a `<link rel="icon">`) from a small server in the compose, so it needs no internet. Why: the same shape as the sorz list repository (`sorzs-persist-in-sqlite-as-json-documents`), and tests that hit real sites would be slow and flaky.
