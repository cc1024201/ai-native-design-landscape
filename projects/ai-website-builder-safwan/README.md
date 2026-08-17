# AI Website Builder by Safwan Hanif

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Safwan's builder decomposes a website into persisted components rather than one HTML response. The model first defines plan and tokens then authors each component; complete JSONB snapshots make that graph recoverable.

## Planning expands into component authority

[pipeline.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/ai/pipeline.py) selects Groq or Gemini and separately generates the site plan, design tokens, copy and component source. Generated component rows plus deterministic App and entry files form the project graph.

## Edits are routed component by component

The same pipeline asks the model whether an instruction applies to each existing component and replaces only changed code. It then creates a new snapshot rather than erasing the previous project state.

## PostgreSQL versions contain complete graphs

[version.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/models/version.py) stores a numbered JSONB snapshot. [versions.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/api/versions.py) lists, creates and restores those snapshots as current components.

## Projection and package delivery preserve files

[PreviewFrame.tsx](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/frontend/components/preview/PreviewFrame.tsx) renders the assembled project while [export_service.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/services/export_service.py) writes the same component set into a React ZIP.

## Evidence

- [Canonical repository](https://github.com/SafwanHanif/AI-Website-builder)
- [Inspected tree](https://github.com/SafwanHanif/AI-Website-builder/tree/6f42e507e89d344f06de318ee65453269d26c758)
- Commit: 6f42e507e89d344f06de318ee65453269d26c758
