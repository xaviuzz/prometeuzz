# Penpot

The `penpot` MCP is registered per project in local scope (`claude mcp add --transport http --scope local penpot <url>`), because its URL carries a user token: never put it in `.mcp.json` or any repo file. The Penpot plugin must be connected in the open design file.

## Gotchas

- `penpot.openPage(page)` takes effect on the next `execute_code` call. Switch in one call, check `penpot.currentPage.name`, work in the next; shapes on a non-active page cannot be modified.
- Font weights available: 200, 300, 400, 600, 700, 900. 500 throws.
- A board with a flex layout stays 100×100 until `flex.horizontalSizing` and `flex.verticalSizing` are `"auto"`; set them on every content-sized board.
- `export_shape` with `page` times out; export each board by id.
