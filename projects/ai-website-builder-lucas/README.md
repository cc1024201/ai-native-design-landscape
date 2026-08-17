# AI Website Builder by Lucas H507

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder uses AI for planning and retrieval while deterministic code assembles a site from a large local foundation library. That split matters: the model decides what to use and how it should be composed but does not freely author every emitted byte.

## Local models turn intent into a component plan

[ai-pipeline.ts](https://github.com/lucash507/AI-Website-Builder/blob/416389a07a6fe35972766eda3472260dbb0b22c4/src/lib/ai-pipeline.ts) coordinates an Ollama-hosted Llama model across the staged generation process. The plan becomes the semantic input to later selection and assembly.

## Embeddings ground generation in a maintained library

[embeddings.ts](https://github.com/lucash507/AI-Website-Builder/blob/416389a07a6fe35972766eda3472260dbb0b22c4/src/lib/embeddings.ts) uses local embeddings to retrieve foundation components. [generator.ts](https://github.com/lucash507/AI-Website-Builder/blob/416389a07a6fe35972766eda3472260dbb0b22c4/src/lib/generator.ts) materializes those decisions into site files. This is design-system-governed assembly rather than unconstrained text-to-HTML.

## Files support a complete local delivery loop

[filesystem.ts](https://github.com/lucash507/AI-Website-Builder/blob/416389a07a6fe35972766eda3472260dbb0b22c4/src/lib/filesystem.ts) owns project directories used by preview update upload and download routes. Visual studio controls can change tokens and current files; ZIP delivery reads the same workspace. No database-backed immutable version graph is established.

## Evidence

- [Canonical repository](https://github.com/lucash507/AI-Website-Builder)
- [Inspected tree](https://github.com/lucash507/AI-Website-Builder/tree/416389a07a6fe35972766eda3472260dbb0b22c4)
- Commit: 416389a07a6fe35972766eda3472260dbb0b22c4
