# Customer.io

Cursor plugin: official Customer.io **MCP connector** plus **skills** for Journeys, Pipelines, Design Studio, and SDK setup.

This folder is what Cursor loads (`~/.cursor/plugins/local/customerio` or a marketplace install). The git repository that contains it is [customerio/cursor-plugin](https://github.com/customerio/cursor-plugin).

## Connect

**Settings → Plugins → Customer.io → Configure** and set **Data center** to match the account (`mcp.customer.io` US, `mcp-eu.customer.io` EU). Then **Settings → Tools & MCP** and connect `customerio`.

Complete OAuth and pick workspaces plus scopes. Do not paste a personal MCP URL. Do not add a second Customer.io MCP server.

## Skills

| Skill | Use for | Then read from MCP |
| --- | --- | --- |
| `customerio` | Bootstrap, region, dry-run, routing | `cio_prime` |
| `customerio-journeys` | Automations, profiles, segments, broadcasts, transactional, in-app | `fly-api` |
| `customerio-design-studio` | Design Studio emails and components | `design-studio` |
| `customerio-pipelines` | Sources, destinations, reverse ETL, data in/out | `cdp-api` |
| `customerio-sdk` | JS / mobile SDK install, sandbox, go-live | `cio` |

## License

MIT. See the repository [LICENSE](../../LICENSE).
