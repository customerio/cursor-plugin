# Add a plugin

This repository is a Cursor **multi-plugin marketplace** with one plugin today: `plugins/customerio`.

To add another plugin later:

1. Create `plugins/<name>/` with `.cursor-plugin/plugin.json` (`name` must be lowercase kebab-case).
2. Add only the components you need (`skills/`, `rules/`, `mcp.json`, `assets/logo.svg`).
3. Register it in `.cursor-plugin/marketplace.json` with `"source": "./plugins/<name>"`.
4. Run `node scripts/validate-template.mjs`.

Keep Customer.io domain playbooks on the MCP (`cio_skills_read`). Plugin skills should stay short routers.
