# OpenKombai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenKombai is a local design-to-code studio. It deliberately separates seeing from coding: one Ollama model describes an uploaded interface and another turns that description into React source.

## The reference image is evidence, not the artifact

[`main.py`](https://github.com/gojodennis/OpenKombai/blob/515235e2a2c7cf90070f5c5f50e24989c8765496/backend/main.py) validates the image, sends its bytes to a vision model, and passes the resulting layout, color, typography, and interaction description to a coding model. The returned React source is the handoff artifact.

## The workspace exposes model and source control

[`App.tsx`](https://github.com/gojodennis/OpenKombai/blob/515235e2a2c7cf90070f5c5f50e24989c8765496/frontend/src/App.tsx) shows the uploaded reference beside Monaco, allows vision and code model selection, keeps the returned source editable, and supports copy delivery. The pinned version does not yet compile that source into a full live application preview or persist projects, which bounds its maturity.

## Pinned evidence

- [Repository](https://github.com/gojodennis/OpenKombai)
- [Inspected tree](https://github.com/gojodennis/OpenKombai/tree/515235e2a2c7cf90070f5c5f50e24989c8765496)
- Commit: `515235e2a2c7cf90070f5c5f50e24989c8765496`
