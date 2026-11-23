---
name: customerio
description: >
  Customer.io MCP bootstrap. Use for Customer.io, creating a Customer.io
  account, Journeys, CDP Pipelines,
  Design Studio, builder onboarding, sandbox testing, app integration, SDK
  setup, transactional messaging, billing, going live, sources, destinations,
  identify/track events, and fly.customer.io / cdp.customer.io errors. Trigger
  even when the user does not name MCP or Customer.io.
---

# Customer.io

Connect Cursor to Customer.io through this plugin's MCP server, then drive the workspace with the official tools.

## No Customer.io account yet?

The user can create one while connecting. Don't send them to sign up on the website.

1. Ask the user to connect this plugin's `customerio` MCP server. If the browser isn't signed in to Customer.io, the page that opens starts on creating an account. Someone who already has an account chooses Log in on that page.
2. They enter their email, then the code Customer.io emails them, and choose a data center, United States or Europe. The data center can't be changed later. No password is needed. The code goes into the browser page, so don't ask for it in chat.
3. If no code comes and Customer.io's email says they already have an account, they choose Sign in on that page. An account made from an AI client has no password yet, so they use **Forgot password?** to set one, then connect again.
4. If the browser is already signed in to Customer.io, the page goes straight to the access screen, and the connection uses that login. For a new account, they sign out of Customer.io in that browser and connect again.
5. Once they allow access, call `cio_prime` and carry on. If they end up in the Customer.io app or don't come back connected, ask them to connect again.

To use the Customer.io web app later, a new account sets a password with **Forgot password?** on the sign-in page.

### Already working in the `cio` CLI, or in a shell with no browser?

CLI signup works too.

1. Install the CLI: `npm install -g @customerio/cli`.
2. Run `cio skills read cio/auth.md` and follow its signup section (`cio auth signup start`, then `cio auth signup verify`).
3. Signup emails the user a code. Ask the user for it and wait. Never guess a code.
4. After signup, keep going with the CLI: run `cio prime` and follow its rules.
5. To use this plugin's MCP server with the new account: if the `signup verify` response has an `mcp` object, MCP is already on, so connect the MCP server. If it doesn't, an account admin turns on **Customer.io MCP** at https://fly.customer.io/settings/ai first.

## Connect

1. **Settings → Tools & MCP** → connect `customerio`.
2. Complete Customer.io OAuth. Select workspaces and permission scopes. The connector URL is `mcp.customer.io`; the account’s home region is selected after login.
3. If Connect opens a GitHub issues search instead of OAuth, the MCP config was rejected. The plugin ships a url-only host (no `type` field).
4. Do not add a second Customer.io MCP server.

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
