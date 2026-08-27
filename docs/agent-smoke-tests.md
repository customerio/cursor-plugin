# Agent smoke tests

Executable checks for the Customer.io Cursor plugin and its MCP connector. Cloud agents cannot load Desktop plugins; they can still verify repo files and, if Customer.io MCP is connected, run the live cases.

**Safety:** dry-run every write and delete. Do not execute live mutations. Do not dump raw API payloads, tokens, or customer PII.

Record each case as **pass**, **fail**, or **skip** (MCP not connected), with one line of evidence.

## A. Plugin package (no MCP)

| ID | Check | Pass if |
| --- | --- | --- |
| A1 | [`plugins/customerio/mcp.json`](../plugins/customerio/mcp.json) | Single server `customerio`, url `https://mcp.customer.io/mcp`, no `type` field |
| A2 | [`plugins/customerio/.cursor-plugin/plugin.json`](../plugins/customerio/.cursor-plugin/plugin.json) | `version` matches `.cursor-plugin/marketplace.json` `metadata.version`, and no `variables` / `CUSTOMERIO_MCP_HOST` |
| A3 | Skills | `plugins/customerio/skills/` contains `customerio`, `customerio-journeys`, `customerio-design-studio`, `customerio-pipelines`, `customerio-sdk` |
| A4 | Connect copy | Skill/README/rule do **not** tell the user to pick a Data center or `mcp-eu` |

## B. Auth and region (MCP)

Call `cio_prime`, then `cio_auth_status` twice.

| ID | Check | Pass if |
| --- | --- | --- |
| B1 | `cio_prime` | Returns without auth error |
| B2 | `cio_auth_status` | `status` is `authenticated`; `base_url` and `allowed_workspace_ids` are present |
| B3 | Home region | `base_url` is `https://fly.customer.io` (US) or `https://eu.fly.customer.io` (EU). Connector URL stays `mcp.customer.io` |
| B4 | Sticky session | Second `cio_auth_status` matches the first (same account, workspace, `base_url`) |

## C. Reads (MCP)

Use workspace id from B2. Discover paths with `cio_schema` first. Use `jq` to keep output small (id/name/state only).

| ID | Check | Pass if |
| --- | --- | --- |
| C1 | `cio_schema` resource list | Lists API resources. If an empty query returns an array the Cursor wrapper cannot display, pass by using a resource-level or `resource.method` query instead (for example `campaigns` or `campaigns.list`) |
| C2 | `cio_schema` `campaigns.list` / `campaigns.create` | Shows GET/POST `/v1/environments/{environment_id}/campaigns` |
| C3 | `cio_skills_read` path `fly-api` | Returns Journeys skill (not a guessed path) |
| C4 | List automations | `cio_read_api` GET campaigns for the auth workspace; request succeeds (empty list is still pass) |
| C5 | `cio_skills_read` path `design-studio` | Returns Design Studio skill |
| C6 | `cio_skills_read` path `cdp-api` | Returns Pipelines skill |

## D. Dry-run write (MCP)

| ID | Check | Pass if |
| --- | --- | --- |
| D1 | Dry-run create | `cio_schema` for the create endpoint, then `cio_write_api` with `dry_run: true` for a harmless resource (prefer a segment or automation name prefixed `cursor-plugin-smoke-`). Preview returns; nothing is created |
| D2 | No live write | No `cio_write_api` / `cio_delete_api` without `dry_run: true` in this run |

## Report

End with a table of ID / result / evidence. Call out region (`fly` vs `eu.fly`) and whether MCP was available.
