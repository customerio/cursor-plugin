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

Settings → Plugins should list **Customer.io**. Skills should appear under Agent Decides / `/skill`. Tools & MCP should show a single `customerio` server (not `customerio-eu`).

Prefer a copy over a symlink; Cursor has rejected some symlinks.

If a tester already added Customer.io under **Settings → Tools & MCP** or in `~/.cursor/mcp.json`, **remove that user MCP first**. A user server named `CustomerIO` (or any host at `mcp.customer.io`) shadows the plugin’s `customerio` server. Symptoms: Connect opens GitHub “search issues”, or OAuth is scoped to an old workspace.

## Connect

Connect `customerio` and complete Customer.io OAuth (workspaces + scopes). The connector URL is `mcp.customer.io`; the account’s home region is selected after login. Existing installs that used a Data center of `mcp-eu.customer.io` should reconnect once.

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

The agent should **read** the matching Cursor skill, then call `cio_skills_read` on the live MCP root — not guessed Fly paths. EU accounts connect the same `customerio` URL; region is selected after OAuth.

## Team Marketplace (optional soak)

The GitHub repo is **private**. Testers need read access to [customerio/cursor-plugin](https://github.com/customerio/cursor-plugin).

Import that URL under **Settings → Plugins → Team Marketplaces**. That exercises `marketplace.json`; the local-folder path does not.

## Tester brief

Ask teammates to:

1. Remove any existing Customer.io MCP from Tools & MCP / `~/.cursor/mcp.json`.
2. Install via Team Marketplace (preferred) or the local copy above.
3. Connect `customerio` and finish Customer.io OAuth (EU accounts use the same URL).
4. Run the prompt matrix with **dry-run writes only** unless they own a sandbox workspace.
