# Customer.io

Official Customer.io plugin for Cursor: **MCP connector** plus **skills** for Journeys, Pipelines, Design Studio, and SDK setup.

Install from the [Cursor Marketplace](https://cursor.com/marketplace/customerio) and follow [Customer.io plugin for Cursor and Grok bot](https://docs.customer.io/ai/plugins/cursor-grok-bot/). This folder is the package Cursor loads. Source: [customerio/cursor-plugin](https://github.com/customerio/cursor-plugin).

## Connect

**Settings → Tools & MCP** and connect `customerio`. Complete OAuth and pick workspaces plus scopes. The connector URL is `mcp.customer.io`; the account’s home region is selected after login.

Do not paste a personal MCP URL. Do not add a second Customer.io MCP server.

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
