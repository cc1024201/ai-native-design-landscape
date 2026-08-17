# DCC-MCP After Effects

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This adapter turns an After Effects project into a typed motion-design surface through the shared adobepy broker and CEP bridge. The AEP project remains the durable authority; DCC-MCP supplies discovery, validated calls and delivery jobs around it.

## The product loop crosses project, layer and render state

The project Skill can open/save work, import assets and create compositions. [`create_motion_intro.py`](https://github.com/dcc-mcp/dcc-mcp-aftereffects/blob/672ce17f3720e84ee128f13472a68df9ca0d351a/src/dcc_mcp_aftereffects/skills/aftereffects-project/scripts/create_motion_intro.py) demonstrates that the adapter is not read-only discovery. Layer tools cover text, transforms, masks, effects, ordering and keyframes; render tools queue a composition, configure the output module and control the native render queue.

The structured official DOM is the primary route. Raw ExtendScript remains an explicitly destructive fallback, keeping ordinary authoring calls inspectable and typed. References are session-scoped, so an agent must re-inspect after the host bridge restarts rather than replaying stale object identities.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-aftereffects/tree/672ce17f3720e84ee128f13472a68df9ca0d351a)
- [Layer authoring contract](https://github.com/dcc-mcp/dcc-mcp-aftereffects/blob/672ce17f3720e84ee128f13472a68df9ca0d351a/src/dcc_mcp_aftereffects/skills/aftereffects-layers/SKILL.md)
- [Render queue implementation](https://github.com/dcc-mcp/dcc-mcp-aftereffects/blob/672ce17f3720e84ee128f13472a68df9ca0d351a/src/dcc_mcp_aftereffects/skills/aftereffects-render/scripts/queue_composition.py)
