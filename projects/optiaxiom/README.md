# Optiaxiom

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Optiaxiom is Optimizely's Axiom design-system implementation. Its AI-native surface joins an MCP metadata server, typed design tokens, a JSON UI specification and renderer, a visual Proteus designer, Figma Code Connect and visual regression review.

## One governed component identity crosses MCP, JSON UI, React and Figma

The MCP server exposes generated component metadata and examples instead of asking agents to scrape prose. Tokens originate in the globals package. Proteus validates an interactive UI document against a public JSON schema and renders it through Axiom components; its designer exposes the tree and property model for direct manipulation. Figma adapters connect those component identities back to design.

This is not counted merely because a React library has an MCP. It qualifies because agents can materialize a governed, executable Proteus artifact whose component and token vocabulary is traceable across code and Figma, with design review/Chromatic guarding changes.

## Evidence

- [Pinned repository](https://github.com/optimizely-axiom/optiaxiom/tree/9aad15a982651ad9e97a98fc3c16422173c24ab8)
- [MCP server](https://github.com/optimizely-axiom/optiaxiom/blob/9aad15a982651ad9e97a98fc3c16422173c24ab8/packages/mcp/src/server.ts)
- [Proteus public schema](https://github.com/optimizely-axiom/optiaxiom/blob/9aad15a982651ad9e97a98fc3c16422173c24ab8/packages/proteus/src/schema/public-schema.json)
- [Proteus designer](https://github.com/optimizely-axiom/optiaxiom/blob/9aad15a982651ad9e97a98fc3c16422173c24ab8/apps/docs/components/proteus-designer/ProteusDesigner.tsx)
