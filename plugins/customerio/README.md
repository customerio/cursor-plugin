# Customer.io

Official Customer.io plugin for Cursor: **MCP connector** plus **skills** for Journeys, Pipelines, Design Studio, and SDK setup.

Install from the [Cursor Marketplace](https://cursor.com/marketplace/customerio) and follow [Customer.io plugin for Cursor and Grok bot](https://docs.customer.io/ai/plugins/cursor-grok-bot/). This folder is the package Cursor loads. Source: [customerio/cursor-plugin](https://github.com/customerio/cursor-plugin).

## Connect

**Settings → Tools & MCP** and connect `customerio`. Complete OAuth and pick workspaces plus scopes. The connector URL is `mcp.customer.io`; the account’s home region is selected after login.

Do not paste a personal MCP URL. Do not add a second Customer.io MCP server.

## Skill

One skill, `customerio`: it connects the MCP server, walks a user with no account through signup, then points the agent to `cio_prime` and the server’s skills.

## License

MIT. See the repository [LICENSE](../../LICENSE).
