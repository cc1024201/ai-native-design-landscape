# OpenMAIC

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenMAIC treats AI-created teaching material as a family of editable classroom artifacts: slides, simulations and whiteboards can be revised, stored and published rather than ending as chat output.

## Whiteboard history is operation-based

At [`131af9c2`](https://github.com/THU-MAIC/OpenMAIC/tree/131af9c25a48a71329aa4bb286af7dcfa18909f4), the whiteboard runtime validates operations and folds them into state. The history UI exposes prior states and conflict tests cover concurrent orchestration behavior.

## Agents act through bounded classroom tools

Chat tools read scenes and issue classroom actions instead of receiving unrestricted database access. Generated or revised artifact payloads pass through canonicalization and validation before becoming current state.

## Delivery is part of the definition

The platform can save and publish interactive lessons and export artifacts such as PPTX, HTML or video through dedicated packages. Design here means constructing a functioning learning experience with a recoverable native history.

## Evidence

- [Pinned source tree](https://github.com/THU-MAIC/OpenMAIC/tree/131af9c25a48a71329aa4bb286af7dcfa18909f4)
- [Whiteboard store](https://github.com/THU-MAIC/OpenMAIC/blob/131af9c25a48a71329aa4bb286af7dcfa18909f4/lib/whiteboard/runtime/store.ts)
- [Operation fold](https://github.com/THU-MAIC/OpenMAIC/blob/131af9c25a48a71329aa4bb286af7dcfa18909f4/lib/whiteboard/runtime/fold.ts)
- [Whiteboard history surface](https://github.com/THU-MAIC/OpenMAIC/blob/131af9c25a48a71329aa4bb286af7dcfa18909f4/components/whiteboard/whiteboard-history.tsx)
- [Classroom agent actions](https://github.com/THU-MAIC/OpenMAIC/blob/131af9c25a48a71329aa4bb286af7dcfa18909f4/lib/chat/pi/tools/classroom-actions.ts)
