# dcc-cua

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

dcc-cua is a standalone Computer Use runtime and CLI extracted from DCC-MCP Core. Its Design relevance is not generic mouse automation: it supplies the exact-window observation/action/verification boundary used when a creative host has no reliable typed API.

## Fresh observations are mutation capabilities

Every action is tied to a concrete PID and window plus a fresh observation ID. The runtime cannot broaden that grant to the desktop, and a new screenshot or semantic observation is required after a mutation. Physical Escape, visible control indicators and sensitive-window policy stay in the Host process rather than depending on agent cooperation.

[`actions.rs`](https://github.com/dcc-mcp/dcc-cua/blob/eb6b9ba071b6cdc26bd01809562807a97beb6c7c/crates/dcc-cua-cli/src/actions.rs) is the CLI composition layer; the core [action-result boundary](https://github.com/dcc-mcp/dcc-cua/blob/eb6b9ba071b6cdc26bd01809562807a97beb6c7c/crates/dcc-cua-core/src/runtime/action_result.rs) normalizes what was actually observed after execution. Screenshot delivery is evidence, not proof that input succeeded.

## Semantic routes do not smuggle authority

Profiles for Maya, Unreal and related surfaces provide stable target vocabulary and route hints. They do not launch applications or authorize fallback automatically. Switching from typed host API to accessibility or pixels requires rebinding and re-observing the exact target. This makes the same runtime usable for visual correction and game acceptance without conflating UI state with native scene truth.

## Evidence

- [Pinned source and safety contract](https://github.com/dcc-mcp/dcc-cua/tree/eb6b9ba071b6cdc26bd01809562807a97beb6c7c)
- [Standalone operator Skill](https://github.com/dcc-mcp/dcc-cua/blob/eb6b9ba071b6cdc26bd01809562807a97beb6c7c/skills/cua-cli/SKILL.md)
- [Semantic-profile implementation](https://github.com/dcc-mcp/dcc-cua/blob/eb6b9ba071b6cdc26bd01809562807a97beb6c7c/crates/dcc-cua-semantic-profiles/src/lib.rs)
