---
name: customerio-pipelines
description: >
  Customer.io Data Pipelines (CDP). Use when the user wants to add or inspect
  sources, destinations, reverse ETL, database syncs, identify/track/page/screen
  calls, or data in/out integrations (Salesforce, HubSpot, Segment, warehouses,
  ad audiences). Triggers: "add a JavaScript source", "Pipelines", "CDP",
  "destination", "reverse ETL", "identify and track", "send data to Salesforce".
---

# Customer.io Pipelines

Use this skill for Data Pipelines and integration routing.

1. Confirm the Customer.io MCP server is connected (`customerio` or `customerio-eu`, not both).
2. Call `cio_prime`.
3. Read the live CDP skill — it is the entry point for integration questions:

   `cio_skills_read` with path `cdp-api`

   Then the matching subfile, for example `cdp-api/sources.md`, `cdp-api/destinations.md`, `cdp-api/reverse_etl.md`, `cdp-api/journeys_integrations.md`.
4. Prefer a native Pipelines source for ongoing data in. Do not lead with a Track API or Zapier workaround.
5. Discover endpoints with `cio_schema`. Mutate with `dry_run: true` first.

Automations, profiles, and segments are Journeys (`customerio-journeys` / `fly-api`). App SDK install snippets are `customerio-sdk` / `cio`.
