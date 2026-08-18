# Video Shotcraft

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Video Shotcraft is an installable agent skill for building product films as Remotion source rather than asking a media model for an opaque clip. Its public library couples 152 shot recipes with rendered previews, sound assets and a production template, so the reusable unit is a parameterized motion construction rather than a prompt gallery.

## Shot recipes become executable composition decisions

The [`SKILL.md`](https://github.com/Vincentwei1021/video-shotcraft/blob/41ee360d82f4c491ba9d88a24a4add7d8ff1cf8b/SKILL.md) makes capture, art direction, storyboarding, motion, sound and render QA one workflow. The agent selects and combines recipes, but React/Remotion files under [`template/src`](https://github.com/Vincentwei1021/video-shotcraft/tree/41ee360d82f4c491ba9d88a24a4add7d8ff1cf8b/template/src) remain the editable authority; the MP4 is a delivery projection.

The gallery is operational evidence: each recipe has a preview and reusable code. This is different from a static inspiration catalog because the installed skill materializes a project, renders it and sends failed shots back through source-level revision.

## Evidence

- [Pinned repository](https://github.com/Vincentwei1021/video-shotcraft/tree/41ee360d82f4c491ba9d88a24a4add7d8ff1cf8b)
- [Production template contract](https://github.com/Vincentwei1021/video-shotcraft/blob/41ee360d82f4c491ba9d88a24a4add7d8ff1cf8b/template/TEMPLATE.md)
- [Rendered gallery data](https://github.com/Vincentwei1021/video-shotcraft/tree/41ee360d82f4c491ba9d88a24a4add7d8ff1cf8b/gallery)
