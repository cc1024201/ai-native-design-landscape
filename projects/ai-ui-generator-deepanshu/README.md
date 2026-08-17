# AI UI Generator by Deepanshu Sharma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This repository treats UI generation as a constrained agent pipeline. The important artifact is not an unconstrained code string but React source that survives a known-component check and can then enter an editable preview and version loop.

## A plan becomes source only through a registry

[The generation route](https://github.com/deepanshu921372/ai-ui-generator/blob/6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d/src/app/api/generate/route.ts) orchestrates planner and generator work and reports the explanation separately. [The generator](https://github.com/deepanshu921372/ai-ui-generator/blob/6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d/src/lib/ai/generator.ts) must stay within the declared component schema and retries invalid source instead of silently accepting arbitrary output. That validation boundary is the product's main form of design governance.

## Versions govern editable source

[VersionStore](https://github.com/deepanshu921372/ai-ui-generator/blob/6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d/src/lib/version/versionStore.ts) stores complete code snapshots in process memory. Direct editor changes and generated revisions can therefore be selected or rolled back during a running server session but do not survive a restart.

## Preview is a simplified projector

[PreviewFrame](https://github.com/deepanshu921372/ai-ui-generator/blob/6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d/src/components/preview/PreviewFrame.tsx) converts the accepted component subset into an iframe document. It proves the visual loop but is not a general React runtime and must not be read as production compilation.

## Evidence

- [Canonical repository](https://github.com/deepanshu921372/ai-ui-generator)
- [Inspected tree](https://github.com/deepanshu921372/ai-ui-generator/tree/6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d)
- Commit: 6fbe31eb39da20d8daf199f9edcd2c6bae9ef25d
