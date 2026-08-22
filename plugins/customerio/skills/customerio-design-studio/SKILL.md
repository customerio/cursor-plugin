---
name: customerio-design-studio
description: >
  Customer.io Design Studio. Use when the user wants to create, edit, review,
  or publish Design Studio emails, components, global styles, connected
  emails, or email accessibility/QA. Triggers: "Design Studio", "draft an
  email", "email component", "global styles", "publish connected email",
  "review this email".
---

# Customer.io Design Studio

Use this skill for Design Studio email and component work.

1. Confirm the Customer.io MCP server `customerio` is connected.
2. Call `cio_prime`.
3. Read the live Design Studio skill:

   `cio_skills_read` with path `design-studio`

   Then the matching subfile, for example `design-studio/nodes.md`, `design-studio/email_review.md`, `design-studio/journeys.md`.
4. Discover endpoints with `cio_schema`.
5. GET with `cio_read_api`. Mutate with `cio_write_api` and `dry_run: true` first.

Wiring a finished email into an automation, broadcast, or transactional message still needs Journeys (`fly-api`). Audience and send logic is `customerio-journeys`, not this skill.
