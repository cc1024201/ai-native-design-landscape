# AI UI Builder by Merchantry

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This hackathon builder makes a serializable UI schema the boundary between Gemini and React. Saved schemas can outlive their originating chat and reopen as independently addressable artifacts.

## Prompt vocabulary limits the model

[`uiSystemPrompt.ts`](https://github.com/merchantry/ai-ui-builder-hackaton-project/blob/549eb9fbc1b237499ff61296073dc154f0201d79/src/lib/uiSystemPrompt.ts) enumerates the allowed node and property vocabulary. [`chat/route.ts`](https://github.com/merchantry/ai-ui-builder-hackaton-project/blob/549eb9fbc1b237499ff61296073dc154f0201d79/src/app/api/chat/route.ts) sends that contract to Gemini.

## Interpreter owns visible behavior

[`UiRenderer.tsx`](https://github.com/merchantry/ai-ui-builder-hackaton-project/blob/549eb9fbc1b237499ff61296073dc154f0201d79/src/components/UiRenderer.tsx) maps schema nodes to a fixed local component library and collects form data. [`schemas/route.ts`](https://github.com/merchantry/ai-ui-builder-hackaton-project/blob/549eb9fbc1b237499ff61296073dc154f0201d79/src/app/api/schemas/route.ts) creates and lists saved schemas. The model proposes graph data; deterministic code controls execution.

## Evidence

- [Canonical repository](https://github.com/merchantry/ai-ui-builder-hackaton-project)
- [Inspected commit](https://github.com/merchantry/ai-ui-builder-hackaton-project/commit/549eb9fbc1b237499ff61296073dc154f0201d79)
- Commit: `549eb9fbc1b237499ff61296073dc154f0201d79`
