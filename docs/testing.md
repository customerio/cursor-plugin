# Desktop testing

This cloud session cannot load Cursor Desktop plugins. Run these on your machine before marketplace submit.

## Load locally

Copy the **plugin folder**, not the repo root:

```bash
mkdir -p ~/.cursor/plugins/local
rm -rf ~/.cursor/plugins/local/customerio
cp -R plugins/customerio ~/.cursor/plugins/local/customerio
```

Confirm this tree:

```text
~/.cursor/plugins/local/customerio/
  .cursor-plugin/plugin.json
  mcp.json
  skills/*/SKILL.md
  rules/
  assets/logo.svg
```

Enable **Include third-party Plugins, Skills, and other configs**. On Team/Enterprise, org policy can set `userLocal=false` and ignore the folder.

Run **Developer: Reload Window**.

Settings → Plugins should list **Customer.io**. Skills should appear under Agent Decides / `/skill`. Tools & MCP should show `customerio` and `customerio-eu`.

Prefer a copy over a symlink; Cursor has rejected some symlinks.

## Connect

Connect **one** region, then complete Customer.io OAuth (workspaces + scopes).

- Pass: Customer.io consent screen.
- Fail: GitHub “search issues” fallback (bad MCP schema) or a missing server.

## Prompt matrix

| Prompt | Expect |
| --- | --- |
| List my Customer.io workspaces / which region am I on? | Bootstrap skill, `cio_prime` / auth |
| List active automations | `customerio-journeys` then `cio_skills_read` `fly-api` |
| Create a win-back segment of people who haven’t opened in 30 days | Journeys skill; profiles language in the description |
| Draft or review a Design Studio email | `customerio-design-studio` |
| Add a JavaScript or React Native source | `customerio-pipelines` and/or `customerio-sdk` |
| Any write | `dry_run` first, then `cio_write_api` with approval |

The agent should **read** the matching Cursor skill, then call `cio_skills_read` on the live MCP root — not guessed Fly paths. EU accounts use `customerio-eu` only.

## Team Marketplace (optional soak)

Import `https://github.com/customerio/cursor-plugin` under **Settings → Plugins → Team Marketplaces**. That exercises `marketplace.json`; the local-folder path does not.
