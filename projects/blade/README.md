# Blade

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blade is Razorpay's cross-platform design system with an agent-facing MCP, Figma governance plugins, design-token publishing and repository skills. It qualifies as a system-governance product because it connects agent generation to measurable component identity and handoff rules across design and code.

## Governance occurs at three separate boundaries

`blade-mcp` exposes component, pattern and general documentation, can scaffold a Blade project and can translate Figma context into Blade-oriented code. The Figma coverage plugin maps selected design instances to the canonical Blade library to measure adoption. A separate Figma widget records a human handoff checklist inside the design file. Token workflows publish the shared visual vocabulary into code.

These mechanisms are deliberately not one magic sync. Figma remains the design authority, Blade packages and tokens remain code authority, and MCP materializes guidance or code between them; coverage and handoff artifacts verify the join.

## Evidence

- [Pinned repository](https://github.com/razorpay/blade/tree/0dfc5aa67079280e7b73f8844f18052050513cf0)
- [Blade MCP server](https://github.com/razorpay/blade/blob/0dfc5aa67079280e7b73f8844f18052050513cf0/packages/blade-mcp/src/server.ts)
- [Figma-to-code tool](https://github.com/razorpay/blade/blob/0dfc5aa67079280e7b73f8844f18052050513cf0/packages/blade-mcp/src/tools/getFigmaToCode.ts)
- [Figma coverage plugin](https://github.com/razorpay/blade/blob/0dfc5aa67079280e7b73f8844f18052050513cf0/packages/plugin-figma-blade-coverage/src/main.ts)
