# The sample site has its own compose file

The page the e2e tests add as a source lives in `compose.sample-site.yaml`, merged only by `npm run e2e` and `npm run down`. Why: `npm run up` is for trying the web by hand and stays backend and frontend only. A fixture is not part of the product's composition, so the main file stays free of it.
