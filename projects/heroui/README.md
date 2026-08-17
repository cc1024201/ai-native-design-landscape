# HeroUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HeroUI is a React/React Native design system with an explicit UI-for-agents layer. Its official MCP servers and installable skills expose component anatomy, docs, source styles, theme variables and migration guidance to coding agents.

## Extracted component knowledge follows the released design system

The main monorepo owns components, themes, documentation and skills. A separate official `heroui-mcp` repository extracts component and theme data, serves version-aware APIs and exposes list/docs/source/theme tools over stdio. The skill scripts query the same source to retrieve component docs, source and current theme instead of embedding a stale prompt copy.

This record counts the HeroUI product lineage once; the MCP and skills are agent surfaces of the design system, not separate products. Code packages and theme variables remain authoritative, while generated UI is constrained through their identities.

## Evidence

- [Pinned HeroUI repository](https://github.com/heroui-inc/heroui/tree/6dd2e1ded57d40bedafdcad4eda9d0b68c57692d)
- [HeroUI React skill](https://github.com/heroui-inc/heroui/blob/6dd2e1ded57d40bedafdcad4eda9d0b68c57692d/skills/heroui-react/SKILL.md)
- [Pinned official MCP repository](https://github.com/heroui-inc/heroui-mcp/tree/0ff616658eec61d9a55c2b10debc7db3bc4d0d29)
- [Component-docs MCP tool](https://github.com/heroui-inc/heroui-mcp/blob/0ff616658eec61d9a55c2b10debc7db3bc4d0d29/apps/native-mcp/src/mcp/tools/get-component-docs.ts)
