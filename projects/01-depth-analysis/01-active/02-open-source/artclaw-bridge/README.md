# ArtClaw Bridge

ArtClaw Bridge answers "what is design" by refusing to own a scene: for every
host it touches — Unreal, Maya, 3ds Max, Blender, Houdini, Substance and
ComfyUI — the native scene or node graph stays authoritative, and the product
is the **agent layer that operates it**. Design is whatever the artist
already works in; ArtClaw contributes the transport and the tooling around
executing changes there.

Its implementation sits on a deliberately minimal execution primitive: each
DCC exposes a narrow Python execution entry, while `mcp_server.py`
standardizes the agent transport that reaches it. That small core is what
makes the rest possible. On top of it, the real product claim is a **managed
tool lifecycle** rather than raw remote execution — artists can discover,
generate, version, publish and share tools and skills from an in-editor
conversation surface. `skill_sync.py` and a CLI skill hub add installation,
updates and team distribution, and in-editor sessions persist and can resume
after a host restart.
[Bridge core](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/bridge_core.py) ·
[Skill sync](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/skill_sync.py)

The decisive move is that ArtClaw treats the agent's *capability* — the skill
— as the durable, shareable artifact, not the produced scene. A skill made in
one host is discoverable, versioned and installable across the fleet, so the
designer's repeated expertise becomes the thing the system persists and
distributes, while each host's scene remains transient working state. It is
counted once because the shared bridge core, tool manager and synchronized
skill lifecycle deliberately form one cross-host product.
[Tool event evidence writer](https://github.com/IvanYangYangXi/artclaw_bridge/blob/de1c262547e078264c4a4189f6252c2f0ee7639c/core/tool_event_writer.py) ·
[Pinned repository](https://github.com/IvanYangYangXi/artclaw_bridge/tree/de1c262547e078264c4a4189f6252c2f0ee7639c)
