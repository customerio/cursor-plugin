# Customer.io

Cursor plugin: official Customer.io **MCP connector** plus **skills** for Journeys, Pipelines, Design Studio, and SDK setup.

This folder is what Cursor loads (`~/.cursor/plugins/local/customerio` or a marketplace install). The git repository that contains it is [customerio/cursor-plugin](https://github.com/customerio/cursor-plugin).

## Connect

**Settings → Tools & MCP**, then connect **one** server:

| Server | Region | URL |
| --- | --- | --- |
| `customerio` | US | `https://mcp.customer.io/mcp` |
| `customerio-eu` | EU | `https://mcp-eu.customer.io/mcp` |

Complete OAuth and pick workspaces plus scopes. Do not paste a personal MCP URL.

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
