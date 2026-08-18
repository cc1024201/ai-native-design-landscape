# Delements Web Stack

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Delements Web Stack is a portable agent workspace for taking one commerce experience across Figma, Webflow and Shopify. It does not collapse the three hosts into a generic prompt: each service has its own MCP workspace, agent contract and handoff rules, while a registry coordinates which specialist owns the next operation.

## Handoff files are the cross-host authority

Figma remains the design-input authority, Webflow owns the site structure and visual implementation, and Shopify owns commerce state. Templates persist agent registration, workspace boundaries and structured handoffs so that a design decision can cross hosts without pretending that one universal artifact graph exists. The product is therefore the coordination layer and its reusable operating contracts, not any one external canvas.

The ordinary route is inspect the source design, construct and verify the Webflow surface, then pass explicit commerce requirements to the Shopify specialist. This gives the repository an independent product boundary even though execution depends on three external platforms.

- [Pinned repository](https://github.com/ithelpdesk-delements/delements-web-stack/tree/8ed4f0655b61d1b4b1022821a967b695cc8386c4)
- [Agent registry template](https://github.com/ithelpdesk-delements/delements-web-stack/blob/8ed4f0655b61d1b4b1022821a967b695cc8386c4/templates/agent_registry.md)
- [Webflow workspace contract](https://github.com/ithelpdesk-delements/delements-web-stack/blob/8ed4f0655b61d1b4b1022821a967b695cc8386c4/templates/workspaces/bsi-webflow-mcp/AGENTS.md)
- [Maintainer profile checked; no location published](https://github.com/ithelpdesk-delements)
