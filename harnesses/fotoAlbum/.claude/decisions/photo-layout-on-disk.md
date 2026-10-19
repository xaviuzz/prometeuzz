# Photo layout on disk

`DATA_DIR/<sessionId>/<photoId>/original.<ext>` and `thumbnail.jpg`; `DATA_DIR` defaults to `./data`; tests give the `PhotoStore` a temp directory. Why: one folder per photo keeps the original and its thumbnail together behind the store.
