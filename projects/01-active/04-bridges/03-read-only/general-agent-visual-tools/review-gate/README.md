# Review Gate

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Review Gate is a Cursor extension and MCP tool that prevents an agent from treating its first implementation pass as completion. It opens a review surface where a person can respond with text, voice or images and explicitly controls when the task exits.

## The gate relays visual intent back into the same agent turn

[`review_gate_v2_mcp.py`](https://github.com/LakshmanTurlapati/Review-Gate/blob/9cd73dc7dafa5daa9ecb0579f27324158f4069f2/V2/review_gate_v2_mcp.py) implements the blocking MCP call and transfers uploaded images as model-readable content. The [Cursor extension](https://github.com/LakshmanTurlapati/Review-Gate/blob/9cd73dc7dafa5daa9ecb0579f27324158f4069f2/V2/cursor-extension/extension.js) owns the popup and status channel; `TASK_COMPLETE` is the explicit release signal.

This does not own the designed application. Its artifact is the visual review exchange that coordinates and corrects agent work, so it belongs in the visual-coordination family rather than native authoring. The maintainer's first-party profile identifies Texas, United States.

## Evidence

- [Pinned repository](https://github.com/LakshmanTurlapati/Review-Gate/tree/9cd73dc7dafa5daa9ecb0579f27324158f4069f2)
- [Agent rule](https://github.com/LakshmanTurlapati/Review-Gate/blob/9cd73dc7dafa5daa9ecb0579f27324158f4069f2/V2/ReviewGateV2.mdc)
- [Maintainer profile](https://github.com/LakshmanTurlapati)
