# Blender Scene Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blender Scene Agent is a deployable, multi-channel agent whose web chat, Microsoft 365/Teams activity endpoint and voice interface all operate the same isolated headless Blender scene. It combines an Azure-hosted reasoning layer with a containerized native 3D authority.

## One scene survives transport changes and idle resumes

[`main.py`](https://github.com/davrous/blenderagent/blob/0d785b77d5c044648bf02c6f72f533329d4e0420/main.py) exposes the shared agent and tool stack. [`blender_startup.py`](https://github.com/davrous/blenderagent/blob/0d785b77d5c044648bf02c6f72f533329d4e0420/blender_startup.py) runs the socket service inside Blender, while [`scene_manager.py`](https://github.com/davrous/blenderagent/blob/0d785b77d5c044648bf02c6f72f533329d4e0420/scene_manager.py) saves and restores per-VM state. Viewport screenshots, full renders and imported model/texture galleries return visual evidence to the conversation.

The `.blend` scene is canonical; web, activity and voice are alternate control transports rather than separate products. Per-conversation VM isolation prevents one user's scene from becoming another's working state.

## Evidence

- [Pinned repository](https://github.com/davrous/blenderagent/tree/0d785b77d5c044648bf02c6f72f533329d4e0420)
- [Blender connection adapter](https://github.com/davrous/blenderagent/blob/0d785b77d5c044648bf02c6f72f533329d4e0420/blender_connection.py)
- [Maintainer profile: France](https://github.com/davrous)
