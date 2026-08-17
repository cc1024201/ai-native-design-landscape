# AI Slide Editor

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Slide Editor treats an uploaded PowerPoint slide as a typed scene graph that a conversational planner can change and then materialize back into the native package. The graph—not a screenshot—is the boundary shared by AI planning, preview, undo and file writing.

## Plans are reviewable before mutation

[`parser.py`](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/parser.py) extracts objects and optional reference-deck styles. The planner translates chat into the action types declared in [`schemas.py`](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/schemas.py). A user can inspect that plan; the executor applies it, validation/review can request correction, and the UI presents the resulting graph plus a diff.

```text
PPTX -> scene graph + reference style -> chat -> ActionPlan
-> execute -> validate/review -> preview + diff -> undo or download PPTX
```

[`session.py`](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/session.py) holds the mutable graph and undo state, while [`writer.py`](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/writer.py) writes the result back to `.pptx`. Sessions are process-local rather than durable projects, so server restart recovery and multi-slide fidelity remain maturity limits.

No license file or reliable maintainer-region evidence was found.

## Pinned sources

- [Repository](https://github.com/StrgFJojo/ai-slide-editor/tree/3bda97673d2a6c8b7dc64a056216ad2e02279c14)
- [Action executor](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/executor.py)
- [Validation](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/validator.py)
- [React preview](https://github.com/StrgFJojo/ai-slide-editor/blob/3bda97673d2a6c8b7dc64a056216ad2e02279c14/frontend/src/components/SlidePreview.tsx)
