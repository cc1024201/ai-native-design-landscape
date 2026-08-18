# Motion Previs Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Motion Previs Studio is a filmmaking decision workspace for extracting reusable motion intent from a reference shot. A user chooses an exact range and declares whether the authority is camera motion, actor motion, object motion or the full scene before the app derives pose, depth, masks, edges and camera evidence.

## The production pack records intent and diagnostics together

[`cameraMotion.ts`](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/src/lib/cameraMotion.ts) solves movement separately from subject content. [`quality.ts`](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/src/lib/quality.ts) makes readiness observable instead of treating a completed encode as a valid reference. The exported pack joins control videos with camera JSON, OpenPose keypoints, a shot bible, model presets, manifests and a quality report so downstream generation can be traced back to the inspected source.

The working session—not any single derivative video—holds selected media, trim, mode, settings and the last bundle. [`sessionRestore.ts`](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/src/lib/sessionRestore.ts) restores that decision state, while the [MCP bridge](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/mcp/motion-previs-mcp.mjs) drives the same running app rather than maintaining a second shadow project.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/motion-previs-studio/tree/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc)
- [Pose inspection canvas](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/src/components/PoseCanvas.tsx)
- [Agent control contract](https://github.com/wassermanproductions/motion-previs-studio/blob/95e7d0ff1d4cc546f7eb09a74ccbd084988a19bc/mcp/README.md)
