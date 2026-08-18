# Cr8-xyz

> Research status: **Source-level** · Lifecycle: **active experimental** · Last reviewed: **2026-08-12**

Cr8-xyz is a browser-facing CGI creation platform that uses a custom Blender build as its creative engine. A WebRTC pixel stream makes the live viewport the user surface, while the B.L.A.Z.E agent discovers installed Blender capabilities and executes natural-language edits.

## Pixel streaming does not replace native scene authority

The backend's [`agent.py`](https://github.com/dr-33-m/cr8-app/blob/8a168a0fd99704a3f5de5d0c68fb8d80669cb958/backend/cr8_engine/app/blaze/agent.py) coordinates intent and dynamically assembled tools. [`screenshot_manager.py`](https://github.com/dr-33-m/cr8-app/blob/8a168a0fd99704a3f5de5d0c68fb8d80669cb958/backend/cr8_engine/app/blaze/screenshot_manager.py) feeds visual state back to the agent; render and blend-file endpoints persist deliverables. The modified Blender/GStreamer path streams the viewport without moving the authoritative graph into the browser.

Blender scenes and saved `.blend` files remain canonical. WebRTC is a low-latency projection and control surface; conversation state and user/machine provisioning are managed separately by the platform backend.

## Evidence

- [Pinned repository](https://github.com/dr-33-m/cr8-app/tree/8a168a0fd99704a3f5de5d0c68fb8d80669cb958)
- [B.L.A.Z.E context manager](https://github.com/dr-33-m/cr8-app/blob/8a168a0fd99704a3f5de5d0c68fb8d80669cb958/backend/cr8_engine/app/blaze/context_manager.py)
- [Viewport handler](https://github.com/dr-33-m/cr8-app/blob/8a168a0fd99704a3f5de5d0c68fb8d80669cb958/backend/cr8_controls/handlers/viewport_handlers.py)
