# Customer.io for Cursor

Official Customer.io plugin for the [Cursor Marketplace](https://cursor.com/marketplace/customerio): a shared MCP connector plus skills. It is not a per-user MCP URL.

Install and connect: [Customer.io plugin for Cursor and Grok bot](https://docs.customer.io/ai/plugins/cursor-grok-bot/)

Canonical repository: [github.com/customerio/cursor-plugin](https://github.com/customerio/cursor-plugin)

## What you get

- **Connector** — one MCP server (`customerio`) at `https://mcp.customer.io/mcp`. Cursor’s Connect flow runs Customer.io OAuth; the account’s home region is selected after login.
- **Skill** — `customerio`: connect, sign up, then `cio_prime` and the server’s skills.
- **Rule** — Automations = `campaigns`, Profiles = `customers`.

Playbooks are not copied into this repo. The MCP serves them so they stay current.

## Install

Install **Customer.io** from the [Cursor Marketplace](https://cursor.com/marketplace/customerio), then **Settings → Tools & MCP → Connect**. The connector URL is `mcp.customer.io`; the account’s home region is selected after login.

No Customer.io account yet? Connect opens a page where you create one with your email and a code Customer.io emails you, then continues to the workspace and scope choice. You choose the new account's data center there, once.

Do not paste a personal MCP URL. Do not add a second Customer.io MCP server. If you previously used **Add to Cursor** or a hand-edited `mcp.json`, remove that server first.

## Use

After Connect, ask in Cursor, for example:

- List active automations in my workspace
- Find people who haven’t opened an email in 30 days and create a win-back segment
- Draft a Design Studio welcome email
- Set up Customer.io for my React Native app

The agent should call `cio_prime`, read the matching skill, then use `cio_schema` / `cio_read_api`. Writes run with dry-run first.

## Contributors

This is a public multi-plugin marketplace repo. `plugins/customerio` is the package Cursor loads.

```bash
node scripts/validate-template.mjs
```

See [docs/testing.md](docs/testing.md) if you are changing the plugin package itself.

## License

MIT. See [LICENSE](LICENSE).
