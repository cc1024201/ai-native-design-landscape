# Unreal Agent Harness

> Research status: **Source-level** · Lifecycle: **active experimental** · Last reviewed: **2026-08-12**

Unreal Agent Harness packages a repeatable act–see–correct loop for agents building live Unreal Engine scenes. It combines the official Unreal MCP with viewport decoding, spatial annotations, three-angle QA and domain recipes for cities, lighting, assets and playable scenes.

## Viewport evidence is compressed into an agent-readable state

Unreal's capture tool returns a large base64 image over an asynchronous path. [`ue_qa.py`](https://github.com/per-simmons/unreal-agent-harness/blob/bf8dc7a5b1380d1757cd10bbc2771ff66a647b53/ue_qa.py) converts that result into a small PNG plus JSON camera/actor coordinates. The agent mutates the scene, captures top-down, eye-level and player-eye views, reads logs and spatial queries, then corrects the build.

The Unreal level and assets remain authoritative. Screenshots and decoded coordinates are transient QA evidence, while the harness's crucial safety rule serializes all scene mutation onto the editor's single game thread.

## Evidence

- [Pinned repository](https://github.com/per-simmons/unreal-agent-harness/tree/bf8dc7a5b1380d1757cd10bbc2771ff66a647b53)
- [Programmatic tool capabilities](https://github.com/per-simmons/unreal-agent-harness/blob/bf8dc7a5b1380d1757cd10bbc2771ff66a647b53/docs/programmatic-toolset-capabilities.md)
- [Agentic development guide](https://github.com/per-simmons/unreal-agent-harness/blob/bf8dc7a5b1380d1757cd10bbc2771ff66a647b53/AGENTIC-GAMEDEV-GUIDE.md)
