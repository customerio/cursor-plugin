---
name: customerio-sdk
description: >
  Customer.io SDK and app integration. Use when the user wants to install or
  troubleshoot JavaScript, Node, iOS, Android, React Native, Expo, or Flutter
  SDKs, sandbox testing, first send, Live Activities / Live Notifications, or
  going live. Triggers: "add Customer.io to my React Native app", "JS snippet",
  "iOS SDK", "sandbox", "test send", "go live", "Live Activities".
---

# Customer.io SDK

Use this skill for installing Customer.io in an app and Builder/sandbox onboarding.

1. Confirm the Customer.io MCP server `customerio` is connected.
2. Call `cio_prime`.
3. Read the live CLI/onboarding skill:

   `cio_skills_read` with path `cio`

   Then the matching subfile, for example:

   - `cio/sdk_setup.md` — install snippets
   - `cio/integration.md` — web / backend / mobile router
   - `cio/integration_web.md`, `cio/integration_mobile.md`, `cio/integration_backend.md`
   - `cio/sdk_troubleshooting.md`
   - `cio/sandbox.md`, `cio/go-live.md` (Builder-plan accounts)

4. For the Pipelines source itself (write keys, source settings), also read `cdp-api/sources.md`.
5. Do not put service-account tokens in application code. Use source write keys for identify/track and App API keys for backend transactional sends.
