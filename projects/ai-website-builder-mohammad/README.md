# AI Website Builder by Mohammad Armaan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder stores generated websites as PostgreSQL frames. Its most distinctive correction mechanism does not ask the model again: the user selects an element inside the iframe, edits it through contenteditable controls and saves the rewritten complete document.

## Gemini creates a frame

[ai-model/route.ts](https://github.com/MohammadArmaan/ai-website-builder/blob/e9324814d278ca329bf5fb3e5877d8a459ea54d3/app/api/ai-model/route.ts) streams a complete HTML response from Gemini. [frames/route.ts](https://github.com/MohammadArmaan/ai-website-builder/blob/e9324814d278ca329bf5fb3e5877d8a459ea54d3/app/api/frames/route.ts) persists current frame content and associates it with chat and project records.

## Direct manipulation rewrites current HTML

[playground page](https://github.com/MohammadArmaan/ai-website-builder/blob/e9324814d278ca329bf5fb3e5877d8a459ea54d3/app/playground/%5BprojectId%5D/page.tsx) injects the stored document into an iframe and enables an element-inspection mode. Text and style changes mutate the iframe DOM; saving serializes its current outerHTML back to the frame.

## Persistence is current-state rather than versioned

[schema.ts](https://github.com/MohammadArmaan/ai-website-builder/blob/e9324814d278ca329bf5fb3e5877d8a459ea54d3/config/schema.ts) defines projects, chats and frames but no complete historical snapshot table. The product recovers the latest frame while overwritten direct edits are not independently selectable.

## Evidence

- [Canonical repository](https://github.com/MohammadArmaan/ai-website-builder)
- [Inspected tree](https://github.com/MohammadArmaan/ai-website-builder/tree/e9324814d278ca329bf5fb3e5877d8a459ea54d3)
- Commit: e9324814d278ca329bf5fb3e5877d8a459ea54d3
