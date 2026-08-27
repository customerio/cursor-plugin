# Publish later

Do this in a separate pass. Do not submit from this working tree until `customerio/cursor-plugin` is public.

1. Create the org repo if it does not exist: `./scripts/create-github-repo.sh` (needs `gh` auth on the `customerio` org).
2. Make **https://github.com/customerio/cursor-plugin** public. Marketplace plugins must be open source.
3. Optional: import that URL as a Team Marketplace and soak internally.
4. Submit the repo URL at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish). Cursor’s template also mentions Slack or `kniparko@anysphere.com`.
5. Anysphere reviews security, data handling, and quality. Every later version bump is reviewed again — keep playbooks on the MCP, not in git.
6. Public listing: [cursor.com/marketplace/customerio](https://cursor.com/marketplace/customerio). The listing **Website URL** field should be `https://docs.customer.io/ai/plugins/cursor-grok-bot/` — not `customer.io` and not the generic IDE MCP page.
