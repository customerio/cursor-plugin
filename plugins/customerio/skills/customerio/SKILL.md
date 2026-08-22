---
name: customerio
description: >
  Customer.io MCP bootstrap. Use for Customer.io, Journeys, CDP Pipelines,
  Design Studio, builder onboarding, sandbox testing, app integration, SDK
  setup, transactional messaging, billing, going live, sources, destinations,
  identify/track events, and fly.customer.io / cdp.customer.io errors. Trigger
  even when the user does not name MCP or Customer.io.
---

# Customer.io

Connect Cursor to Customer.io through this plugin's MCP server, then drive the workspace with the official tools.

## Connect

1. Set **Data center** on the plugin (**Settings → Plugins → Customer.io → Configure**): `mcp.customer.io` (US, default) or `mcp-eu.customer.io` (EU). It must match the account region.
2. **Settings → Tools & MCP** → connect `customerio`.
3. Complete Customer.io OAuth. Select workspaces and permission scopes.
4. If Connect opens a GitHub issues search instead of OAuth, the MCP config was rejected. The plugin ships a url-only host (no `type` field).
5. If OAuth succeeds but workspaces are missing, the data center is wrong — switch it and reconnect. Do not add a second MCP server.

Do not paste a personal MCP URL. Do not put API keys or service-account tokens in this plugin.

## First calls

Call `cio_prime` before other Customer.io tools. It prints the live rules for schema lookup, pagination, dry-run writes, and skill reading.

Then:

- `cio_auth_status` if auth is unclear.
- `cio_schema` to discover endpoints. Never guess paths or field names.
- `cio_skills_list` / `cio_skills_read <path>` for workflows the schema does not explain.
- `cio_read_api` for GET.
- `cio_write_api` / `cio_delete_api` with `dry_run: true` first.

## Routing (live skills, not copies)

Do not invent playbooks here. Read the hosted skill for the task:

| Need | Read |
| --- | --- |
| Builder / SDK / sandbox / first send / go-live | `cio_skills_read` path `cio` (then a subfile such as `cio/sdk_setup.md`) |
| Automations, campaigns, broadcasts, profiles, people, segments, newsletters, transactional, in-app | `fly-api` |
| Design Studio emails, components, global styles, publish | `design-studio` |
| CDP sources, destinations, reverse ETL, identify/track, data in/out | `cdp-api` |
| Analysis, campaign review, goals, Liquid | `recipes` |

Cursor also ships discovery skills that point at those same roots: `customerio-journeys`, `customerio-design-studio`, `customerio-pipelines`, `customerio-sdk`.

## Terminology

- Automations = `campaigns` API resource.
- Profiles = `customers` API resource.

## Safety

- Dry-run every write and delete before executing.
- Do not embed service-account tokens (`sa_live_...`) in application code.
- Use CDP source write keys for SDK identify/track/page/screen.
- Use workspace-scoped App API keys for backend transactional sends.
- Do not dump raw API payloads or customer PII unless the user asked for them.
