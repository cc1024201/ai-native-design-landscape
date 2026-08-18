# ArtClaw Bridge

> Research status: **Source-level** · Lifecycle: **active beta** · Last reviewed: **2026-08-12**

ArtClaw Bridge is a multi-DCC agent layer for Unreal, Maya, 3ds Max, Blender, Houdini, Substance applications and ComfyUI. Its product claim goes beyond raw remote execution: artists can discover, generate, version, publish and share tools and skills from an in-editor conversation surface.

## A minimal execution primitive supports a managed tool lifecycle

Each host exposes a narrow Python execution entry while [`mcp_server.py`](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/mcp_server.py) standardizes agent transport. [`skill_sync.py`](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/skill_sync.py) and the [CLI skill hub](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/cli/artclaw_bridge/skill_hub.py) add installation, updates and team distribution. In-editor sessions persist and can be resumed after host restart.

Each DCC's native scene or node graph remains authoritative. ArtClaw is counted once because its shared bridge core, tool manager and synchronized skill lifecycle deliberately form one cross-host product.

## Evidence

- [Pinned repository](https://github.com/IvanYangYangXi/artclaw_bridge/tree/de1c262547e078264c4a4189f6252c2f0ee7639c)
- [Bridge core](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/bridge_core.py)
- [Tool event evidence writer](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/tool_event_writer.py)
