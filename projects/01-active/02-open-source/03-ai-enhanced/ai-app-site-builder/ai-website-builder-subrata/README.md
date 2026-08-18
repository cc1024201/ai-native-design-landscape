# AI Website Builder by Subrata Ghosh

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder makes a generated directory the product artifact. It is a deliberately small filesystem pipeline rather than a hosted database workspace or a visual node graph.

## One backend route materializes multiple pages

[app.py](https://github.com/Subrata0Ghosh/ai-website-builder/blob/76497b6490d64ec28a6c91d56b3f770abdb294f6/backend/app.py) asks OpenAI for site material and writes separate page files into a generated project directory. Committed sample outputs demonstrate the expected file contract but are not counted as proof that every run contacted the provider.

## Preview adapts files without replacing authority

[ProjectPreview.jsx](https://github.com/Subrata0Ghosh/ai-website-builder/blob/76497b6490d64ec28a6c91d56b3f770abdb294f6/frontend/src/components/ProjectPreview.jsx) loads the generated project through the backend preview route. The rendered frame is evidence of the files; it is not itself a durable editable graph.

## Delivery is the directory packaged as ZIP

The same backend packages the generated directory for download. There is no source-level evidence of conversation-based correction or a restorable version graph, so the product is recorded as generation plus visual proof and portable delivery.

## Evidence

- [Canonical repository](https://github.com/Subrata0Ghosh/ai-website-builder)
- [Inspected tree](https://github.com/Subrata0Ghosh/ai-website-builder/tree/76497b6490d64ec28a6c91d56b3f770abdb294f6)
- Commit: 76497b6490d64ec28a6c91d56b3f770abdb294f6
