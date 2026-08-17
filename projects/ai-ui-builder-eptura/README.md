# AI UI Builder by Alexandr Davydov

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This small workspace is not a free-form app generator. It asks a model to choose and populate one member of a fixed visual component grammar then mounts the validated object as a real React form table card chart or text block.

## The artifact is a typed component object

The pinned [`UIComponent` schema](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/backend/app/schemas/ui.py) is a discriminated union. Its frontend counterpart is consumed by [`Renderer.tsx`](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/frontend/src/renderer/Renderer.tsx), so the structured object rather than a screenshot or generated source file owns the visible result.

## Model output is validated and visibly attributed

[`openrouter.py`](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/backend/app/services/openrouter.py) sends a strict JSON schema to OpenRouter, repairs one invalid response, validates it with Pydantic and surfaces terminal failures. The [generate route](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/backend/app/api/routes.py) then uses a deterministic resolver only as an explicit fallback. [`Workspace.tsx`](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/frontend/src/components/Workspace.tsx) labels each result `ai` or `mock`, preventing the fallback from masquerading as provider output.

## Deliberately narrow persistence boundary

The [home surface](https://github.com/alexandr-davydov-eptura/ai-ui-builder/blob/ec586a998e5e984fca51919ab4e5a3067dec25e9/frontend/src/pages/Home.tsx) keeps turns in React state. There is no project store export path or mutation of a prior component. This is counted as a runnable prompt-to-visual component workspace but not as a durable app builder or iterative canvas.

## Pinned evidence

- [Repository](https://github.com/alexandr-davydov-eptura/ai-ui-builder)
- [Inspected tree](https://github.com/alexandr-davydov-eptura/ai-ui-builder/tree/ec586a998e5e984fca51919ab4e5a3067dec25e9)
- Commit: `ec586a998e5e984fca51919ab4e5a3067dec25e9`
