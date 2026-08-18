# Generative UI Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Generative UI Builder turns a screenshot into React through an explicit five-stage agent pipeline. Its distinctive authority is an intermediate validated layout DSL: vision output must become a typed graph before code generation and browser projection.

## Perception cannot write code directly

[`backend/orchestrator.py`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/backend/orchestrator.py) sequences planning vision validation code generation and reflection. [`backend/agents/vision.py`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/backend/agents/vision.py) interprets the screenshot but [`backend/schemas/layout_schema.py`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/backend/schemas/layout_schema.py) defines the structure that interpretation must satisfy.

[`backend/agents/validator.py`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/backend/agents/validator.py) validates and can repair the DSL before [`code_generator.py`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/backend/agents/code_generator.py) emits React. Reflection can reject the output and trigger another pass.

## The accepted code is inspectable but not durably versioned

[`useGenerationStream.ts`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/frontend/hooks/useGenerationStream.ts) receives stage events DSL and code over SSE. [`LivePreview.tsx`](https://github.com/v3rmxni7/Generative-UI-Builder/blob/ec495208752caeebaa903a697363873d22bf3c13/frontend/components/LivePreview.tsx) compiles the current code for a sandboxed iframe while Monaco allows direct correction and the UI supports copy or download. The inspected source does not establish a durable project or version service.

## Evidence

- [Canonical repository](https://github.com/v3rmxni7/Generative-UI-Builder)
- [Inspected tree](https://github.com/v3rmxni7/Generative-UI-Builder/tree/ec495208752caeebaa903a697363873d22bf3c13)
- Commit: `ec495208752caeebaa903a697363873d22bf3c13`

No reliable geographic evidence was found; team region remains `unknown`.
