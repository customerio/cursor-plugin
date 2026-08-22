---
name: customerio-journeys
description: >
  Customer.io Journeys. Use when the user wants to create, list, edit, or
  review automations, campaigns, broadcasts, one-time sends, profiles, people,
  customers, segments, newsletters, subscription topics, transactional
  messages, or in-app messages. Triggers: "list automations", "create a
  campaign", "win-back segment", "people who haven't opened", "find profiles",
  "transactional send", "in-app message".
---

# Customer.io Journeys

Use this skill for workspace messaging and audience work in Journeys.

1. Confirm the Customer.io MCP server `customerio` is connected.
2. Call `cio_prime`.
3. Read the live Journeys skill — do not guess workflow details:

   `cio_skills_read` with path `fly-api`

   Then the matching subfile, for example:

   - Automations / campaigns → `fly-api/automations.md` (also triggers, filters, lifecycle, review)
   - Profiles / people → `fly-api/customers.md`
   - Segments → `fly-api/segments.md`, `fly-api/data_driven_segments.md`, `fly-api/segment_conditions.md`
   - Messaging / newsletters / transactional / in-app → `fly-api/messaging.md`, `fly-api/transactional_send.md`, `fly-api/in_app.md`

4. Discover the endpoint with `cio_schema` (for example `campaigns` or `campaigns.create`).
5. GET with `cio_read_api`. Mutate with `cio_write_api` or `cio_delete_api` and `dry_run: true` first.

Email **content** in Design Studio is not this skill — use `customerio-design-studio` (`design-studio`). Data sources and destinations are `customerio-pipelines` (`cdp-api`).
