# Blockout

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blockout defines AI-native filmmaking design as unambiguous motion reference, not polished 3D art. A desktop user stages real-scale grey-box locations, performers and camera marks, then exports exactly timed evidence that video generators can follow.

## Scene blocking and shot coverage are separate authorities

The scene owns actor blocking; each shot owns a camera and lens. Pure functions under [`src/engine`](https://github.com/wassermanproductions/blockout/tree/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9/src/engine) resolve deterministic `state(t)` for playback, stills, video and glTF baking. The bundled [MCP bridge](https://github.com/wassermanproductions/blockout/blob/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9/mcp/blockout-mcp.mjs) lets an agent stage, choreograph, reframe, scrub and capture the same running project a person edits.

Pretty-printed project JSON is the versionable authority. [`exporter.ts`](https://github.com/wassermanproductions/blockout/blob/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9/src/renderer/export/exporter.ts) emits reference video, depth/normal passes, stills, generator-specific prompt, metadata and ComfyUI workflow; byte-determinism makes the package reproducible.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/blockout/tree/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9)
- [Camera and choreography engine](https://github.com/wassermanproductions/blockout/tree/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9/src/engine)
- [Agent control contract](https://github.com/wassermanproductions/blockout/blob/3f2d0564fd575f70fc28e9bfaa7e94b05e3955d9/mcp/README.md)
