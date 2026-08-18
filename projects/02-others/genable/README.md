# Genable

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Genable presents one Figma-native agent engine through two entry points: a model-configurable plugin inside Figma and `genable-mcp` for an external agent that already owns model access. Both are documented as planning, writing, inspecting and visually checking the current native graph.

## The current file is the continuing context

The public contract covers frames, Auto Layout, vectors, text, components, variables and pages. In plugin mode, credentials live in Figma client storage; in MCP mode, a local relay forwards typed operations to the open plugin. Continued prompts inspect the result rather than starting from a flattened export.

```text
brief + provider -> agent plan -> typed operation relay
-> Genable Figma plugin -> native graph -> readback/screenshot -> refine
```

Evidence has an important ceiling. The pinned repository contains the product site and documentation but not plugin source. npm package `genable-mcp@0.2.1` publishes a relay and a 117 KB tool schema, but only compiled JavaScript; its recorded integrity is `sha512-kC5MPTtbRZYPm...ZemR0SjGWoyFQ==`. Native persistence and editability are therefore well specified, while model orchestration and plugin-side safeguards cannot receive commit-level verification here.

The public repository and npm package declare MIT. No reliable maintainer-region evidence was found.

## Evidence boundary

- [Pinned public repository](https://github.com/musepy/genable/tree/67d1b51bd44934d569e83a471a0336e5005c2307)
- [Product and architecture contract](https://github.com/musepy/genable/blob/67d1b51bd44934d569e83a471a0336e5005c2307/README.md)
- [Published MCP package](https://www.npmjs.com/package/genable-mcp/v/0.2.1)
- [MIT license](https://github.com/musepy/genable/blob/67d1b51bd44934d569e83a471a0336e5005c2307/LICENSE)
