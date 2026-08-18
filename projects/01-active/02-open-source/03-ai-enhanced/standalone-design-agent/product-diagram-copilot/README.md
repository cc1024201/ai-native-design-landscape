# Product Diagram Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Product Diagram Copilot is a diagram-specification service with desktop and web delivery paths. It can use Ollama or an OpenAI-compatible endpoint without tying artifact ownership to either provider.

## Generated specification is retained

At [`9e7ebae1`](https://github.com/TUARAN/ProductDiagramCopilot/tree/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31), prompts produce typed diagram data through a generator service. Mermaid and draw.io are separate renderers of that specification rather than model-native outputs with unrelated semantics.

## Application state extends beyond the chat

Artifact records live in the database and larger objects can be placed in MinIO. Celery jobs separate generation from the UI; Vue and Tauri provide browser and desktop shells. The artifact has identity and storage independent of one inference request.

## Technical boundary

Mermaid is primarily a source projection while draw.io provides the stronger downstream manual-editing handoff. The current evidence does not establish bidirectional synchronization from draw.io back into the stored specification.

## Evidence

- [Pinned repository](https://github.com/TUARAN/ProductDiagramCopilot/tree/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31)
- [Diagram specification](https://github.com/TUARAN/ProductDiagramCopilot/blob/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31/backend/app/generator/spec.py)
- [Generation service](https://github.com/TUARAN/ProductDiagramCopilot/blob/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31/backend/app/generator/service.py)
- [Artifact model](https://github.com/TUARAN/ProductDiagramCopilot/blob/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31/backend/app/models/artifact.py)
- [Storage boundary](https://github.com/TUARAN/ProductDiagramCopilot/blob/9e7ebae1a20b761d8ee7ccd69ba4875286a83f31/backend/app/core/storage.py)
