# Handoff: Cursor plugin docs page

Write a public Customer.io docs page for the **official Cursor Marketplace plugin**. This brief is the source of truth for that page. Do not invent product behavior beyond what is specified here. If something is missing, say so in the draft rather than guessing.

## Why this page exists

We are submitting the plugin at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish). The marketplace listing **Website URL** should land here, not on `customer.io` and not on the current IDE MCP page as it stands today.

The existing page [Cursor and other IDEs](https://docs.customer.io/ai/mcp/ide/) documents a **different install path**: Personal Settings → **Add to Cursor**, which adds a **user-level MCP server**. The plugin is a **Cursor Plugin** that ships the same MCP connector plus skills and a rule. Mixing the two installs is a real failure mode (see Troubleshooting).

## URL and information architecture

**Preferred slug:** `/ai/mcp/cursor/`  
Title: **Customer.io plugin for Cursor**

Fallback if a new slug is hard: add a **Cursor Marketplace plugin** section as the **first** install option on `/ai/mcp/ide/`, then keep using that URL. A dedicated slug is better so the marketplace listing does not send people into Windsurf / VS Code / one-click instructions.

**Also update these related pages** (short links, do not duplicate the whole plugin guide):

| Page | Change |
| --- | --- |
| [MCP get started](https://docs.customer.io/ai/mcp/get-started/) | In the Cursor sentence, link the plugin page as the Cursor path. Keep Claude / ChatGPT as they are. |
| [MCP index](https://docs.customer.io/ai/mcp/) | Same: Cursor → plugin page. |
| [Cursor and other IDEs](https://docs.customer.io/ai/mcp/ide/) | Lead with: “If you use Cursor, install the Customer.io plugin” → `/ai/mcp/cursor/`. Keep **Add to Cursor** / `mcp.json` as a legacy or “other IDEs” path. State that you should not run both. |
| Nav / TOCs under AI → MCP | Add the new page next to ChatGPT, Claude, and IDEs. |

Do **not** replace the generic MCP docs. The plugin is Cursor-specific; Claude, ChatGPT, Windsurf, and VS Code stay on their current pages.

## Audience

Someone who already uses Cursor and has (or can get) a Customer.io account. They want to install the plugin, connect, and ask the agent to work in Journeys, Design Studio, Pipelines, or the SDKs.

Assume they have not read this GitHub repo. Do not tell them to copy `~/.cursor/plugins/local` or import a Team Marketplace. Those are internal soak paths only.

## Voice and constraints

Match existing MCP docs: short intro, numbered steps, screenshots where the UI is non-obvious, links out for scopes and account admin settings.

- Use **plugin** for the Cursor Marketplace package. Use **MCP** / **connector** for the server it connects (`customerio` at `mcp.customer.io`).
- Use **automations** and **profiles** in user-facing copy (not “campaigns” / “people”), unless you are explaining API names. The plugin rule is: automations = `campaigns` API, profiles = `customers` API. That mapping is for agents, not a heading on the page.
- Do not mention a Data center picker, `mcp-eu.customer.io`, or `CUSTOMERIO_MCP_HOST`. Region is selected **after OAuth**. One URL for every account: `https://mcp.customer.io/mcp`.
- Do not tell users to paste a personal MCP URL or a service-account token into Cursor.
- Do not document GitHub clone, `plugin.json`, or skill file paths.
- Marketplace listing may still be in review. Write “Install **Customer.io** from the [Cursor Marketplace](https://cursor.com/marketplace)” as the happy path. If the listing is not live when you publish, add one sentence that it appears there after Cursor review, and keep the rest of the page valid.

## Facts the page must get right

| Fact | Value |
| --- | --- |
| Display name | Customer.io |
| Plugin identifier | `customerio` |
| MCP server name in Cursor | `customerio` (one server; not `customerio-eu`) |
| Connector URL | `https://mcp.customer.io/mcp` (document as `mcp.customer.io`; do not add a `type` field in any example config) |
| Auth | Customer.io OAuth in Cursor’s Connect flow. User picks workspaces and permission scopes. |
| Region | Home region (US `fly.customer.io` or EU `eu.fly.customer.io`) is selected after login. Users do not pick a data center. |
| Skills | Shipped as short routers. Full playbooks stay on the MCP (`cio_skills_read`) so they stay current. |
| Writes | Agents should dry-run writes first. Users will see a Cursor approval on live writes. |
| Account prerequisite | An **account admin** must enable **Customer.io MCP** in [AI settings](https://fly.customer.io/settings/ai/). Link [Get started with MCP](https://docs.customer.io/ai/mcp/get-started/) for the toggle, live-data editing, and sensitive-data access. |
| Scopes | Do not re-list scopes. Link [permission scopes](https://docs.customer.io/ai/mcp/get-started/#permission-scopes-for-mcp-users). |
| Open source | [github.com/customerio/cursor-plugin](https://github.com/customerio/cursor-plugin) (MIT). Optional “See the source” link in a footer, not the install path. |
| Support | `win@customer.io` |
| Privacy | [customer.io/legal/privacy](https://customer.io/legal/privacy) if you have a legal/related block. |

### Skills (user-facing, not file paths)

Describe what people can ask, not how Cursor loads SKILL.md:

- **Journeys** — automations, profiles, segments, broadcasts, transactional, in-app
- **Design Studio** — emails, components, global styles, review, publish
- **Pipelines** — sources, destinations, reverse ETL, data in/out
- **SDK / builder** — JavaScript and mobile SDK setup, sandbox, go-live

### What the plugin is not

- Not a per-user MCP URL you paste into `~/.cursor/mcp.json`.
- Not a second MCP server alongside “Add to Cursor”.
- Not Claude / ChatGPT setup (those stay on their own pages).

## Suggested page outline (use these headings)

Copy may be edited for house style. Keep the step order.

### 1. Intro (2–4 sentences)

Connect Cursor to your Customer.io workspace with the official **Customer.io** plugin. It adds the Customer.io MCP connector and skills so the agent can work with automations, profiles, Design Studio, Pipelines, and SDKs inside Cursor.

You need a Customer.io account with MCP enabled. Cursor installs the plugin; you still **Connect** once to authorize workspaces and scopes.

### 2. Before you start

- A Customer.io account. If MCP is off, ask an account admin to enable it: [Get started with MCP](https://docs.customer.io/ai/mcp/get-started/).
- Cursor Desktop (the Marketplace plugin loads in the editor; this is not a paste-a-URL MCP snippet).
- If you already connected Customer.io under **Settings → Tools & MCP** or in `~/.cursor/mcp.json`, **remove that server first**. See Troubleshooting.

### 3. Install the plugin

1. Open the [Cursor Marketplace](https://cursor.com/marketplace).
2. Install **Customer.io**.
3. Reload the window if Cursor asks you to.

Do not clone the GitHub repo to install.

### 4. Connect your account

1. Go to **Settings → Tools & MCP**.
2. Connect the **customerio** server.
3. Complete Customer.io OAuth. Choose workspaces and permission scopes, then allow access.
4. Confirm Cursor shows a single Customer.io server named `customerio`.

Expected: Customer.io consent screen, then a connected server.  
Unexpected: GitHub “search issues” — see Troubleshooting.

The connector is `mcp.customer.io`. After login, the session uses your account’s home region. EU and US accounts use the same Connect button.

### 5. What you can ask

Give 4–6 example prompts. These are validated against the plugin skills:

- List my Customer.io workspaces / which region am I on?
- List active automations in my workspace
- Find people who haven’t opened an email in 30 days and create a win-back segment
- Draft or review a Design Studio welcome email
- Add a JavaScript or React Native source in Pipelines
- Set up Customer.io for my React Native app

One sentence: the agent should look up Customer.io skills and API schema rather than guessing URLs; writes are previewed (dry-run) before they change the workspace.

### 6. Already using MCP in Cursor?

**Do not add a second Customer.io MCP.**

If you previously used **Add to Cursor** (Personal Settings) or a hand-edited `mcp.json`:

1. Remove the user-level Customer.io / `CustomerIO` server from **Settings → Tools & MCP** and from `~/.cursor/mcp.json` if present.
2. Install and Connect the plugin as above.

Two servers for the same host fight each other. Typical symptoms: Connect opens a GitHub issues search, or OAuth is stuck on an old workspace.

People who need Windsurf, VS Code, or Gemini CLI stay on [Cursor and other IDEs](https://docs.customer.io/ai/mcp/ide/).

### 7. Troubleshooting

| Symptom | What to do |
| --- | --- |
| No Customer.io plugin in Marketplace | Listing may still be in review. Do not fall back to pasting `mcp.customer.io` as a second server. |
| Connect shows GitHub “search issues” | A user MCP is shadowing the plugin, or the MCP config was rejected. Remove extra Customer.io servers; keep the plugin’s `customerio` server only. |
| “Needs login” / cannot authorize | Confirm an admin enabled [Customer.io MCP](https://docs.customer.io/ai/mcp/get-started/). Retry Connect. |
| Agent cannot see tools | Reload MCP servers or reload the Cursor window. Confirm **customerio** is connected. |
| Writes blocked / 403 about live data | Workspace **Allow agent to edit live data** is off. Explain that as an admin setting; link MCP AI settings. Do not tell users to bypass it. |
| EU account worries they need a different URL | They do not. Same `mcp.customer.io` Connect flow; region follows the account after OAuth. |
| Old `mcp-eu.customer.io` Data center setting | Reconnect once on `customerio`. That picker was removed. |

### 8. Related

- [Get started with MCP](https://docs.customer.io/ai/mcp/get-started/) — enable MCP, scopes, live data
- [Cursor and other IDEs](https://docs.customer.io/ai/mcp/ide/) — non-plugin MCP clients
- [ChatGPT](https://docs.customer.io/ai/mcp/chatgpt/) and [Claude](https://docs.customer.io/ai/mcp/claude/)
- Source: [github.com/customerio/cursor-plugin](https://github.com/customerio/cursor-plugin)

## Screenshots to request (do not block the first draft)

Capture after the Marketplace listing exists, in a dummy/sandbox account. No customer PII.

1. Cursor Marketplace card for **Customer.io**.
2. **Settings → Tools & MCP** with one connected `customerio` server.
3. Customer.io OAuth consent (workspaces + scopes) — reuse existing MCP consent art from `/ai/mcp/ide/` if it still matches.
4. Optional: AI settings with **Customer.io MCP** enabled (already used on get-started).

## Implementation notes for the docs agent

- Follow the Customer.io docs repo conventions (frontmatter, slug, nav, callouts). This handoff does not prescribe YAML keys.
- Link slugs that exist today; do not invent `/ai/mcp/cursor-plugin/` if you chose `/ai/mcp/cursor/`.
- No `mcp.json` code sample on this page. Showing a JSON snippet encourages the shadowing install.
- No changelog of plugin versions on the first ship. `1.2.0` is the current package version if a reviewer asks; it does not need to be on the page.
- If you must mention Cloud Agents: they can use the MCP when it is connected, but they do not load the Desktop plugin from `~/.cursor/plugins/local`. That is optional and easy to skip.

## Acceptance criteria

- A user who only reads this page can install from Marketplace, Connect, and try an example prompt without opening GitHub.
- `/ai/mcp/ide/` no longer presents **Add to Cursor** as the primary Cursor path.
- The page never instructs someone to add `https://mcp.customer.io/mcp` as a custom MCP **and** install the plugin.
- EU vs US is explained as post-OAuth region, not a URL the user types.
- Get-started still owns admin enablement and scopes.

## Source material (optional reading)

In [github.com/customerio/cursor-plugin](https://github.com/customerio/cursor-plugin):

- `README.md` — product summary
- `plugins/customerio/README.md` — Connect copy
- `plugins/customerio/mcp.json` — url-only host
- `docs/testing.md` — shadowing / single-server behavior (internal testers; do not copy local-install steps into public docs)
