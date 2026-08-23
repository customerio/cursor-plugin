# Customer.io for Cursor

Official Customer.io plugin for the [Cursor Marketplace](https://cursor.com/marketplace): a shared MCP connector plus skills. It is not a per-user MCP URL.

Canonical repository: [github.com/customerio/cursor-plugin](https://github.com/customerio/cursor-plugin)

## What you get

- **Connector** — one MCP server (`customerio`) at `https://mcp.customer.io/mcp`. Cursor’s Connect flow runs Customer.io OAuth; the account’s home region is selected after login.
- **Skills** — short routers that match how Customer.io already ships agent skills (`cio skills install` writes a bootstrap; the rest stay live on the server):
  - `customerio` — prime, region, dry-run, routing table
  - `customerio-journeys` → `cio_skills_read fly-api`
  - `customerio-design-studio` → `design-studio`
  - `customerio-pipelines` → `cdp-api`
  - `customerio-sdk` → `cio`
- **Rule** — Automations = `campaigns`, Profiles = `customers`; dry-run writes.

Playbooks are not copied into this repo. The MCP serves them so they stay current.

## Install

### Cursor Marketplace (after review)

Install **Customer.io** from [cursor.com/marketplace](https://cursor.com/marketplace). Then **Settings → Tools & MCP → Connect**. The connector URL is `mcp.customer.io`; the account’s home region is selected after login.

### Local (development)

```bash
mkdir -p ~/.cursor/plugins/local
rm -rf ~/.cursor/plugins/local/customerio
cp -R plugins/customerio ~/.cursor/plugins/local/customerio
```

Enable third-party plugins, then **Developer: Reload Window**. See [docs/testing.md](docs/testing.md).

### Team Marketplace (internal soak)

**Settings → Plugins → Team Marketplaces → Import** `https://github.com/customerio/cursor-plugin`.

## Use

After Connect, ask in Cursor, for example:

- List active automations in my workspace
- Find people who haven’t opened an email in 30 days and create a win-back segment
- Draft a Design Studio welcome email
- Set up Customer.io for my React Native app

The agent should call `cio_prime`, read the matching skill, then use `cio_schema` / `cio_read_api`. Writes run with dry-run first.

More: [Customer.io MCP for Cursor](https://docs.customer.io/ai/mcp/ide/).

## Validate

```bash
node scripts/validate-template.mjs
```

## Canonical GitHub repo

This package lists `https://github.com/customerio/cursor-plugin` as its repository. Create it on the `customerio` org (needs org permission):

```bash
chmod +x scripts/create-github-repo.sh
./scripts/create-github-repo.sh
```

The repo can stay private while you build. Make it **public** before submitting at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish). Steps: [docs/PUBLISH.md](docs/PUBLISH.md).

## License

MIT. See [LICENSE](LICENSE).
