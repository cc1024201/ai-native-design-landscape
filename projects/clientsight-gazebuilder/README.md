# ClientSight / GazeBuilder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ClientSight treats attention as authoring context. A generated interface is not only viewed: a sustained gaze can identify a rendered element, ask an AI for targeted changes and feed an accepted change back toward source. The current repository also preserves the earlier GazeBuilder name and multi-author history.

## Gaze becomes a targetable correction signal

[`useComponentDwellDetection.ts`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/src/hooks/useComponentDwellDetection.ts) maps WebGazer coordinates into the same-origin preview and emits an element target after a dwell threshold. [`GazeSuggestionPanel.tsx`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/src/components/GazeSuggestionPanel.tsx) sends the element type, text, properties and dwell duration to the backend. The corresponding [`main.py`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/backend/main.py) routes generate suggestions and apply edits in addition to a gaze optimizer, making attention actionable rather than an analytics-only heatmap.

## Generation and rendering remain source-centered

The backend's multi-section and component routes call OpenRouter-compatible models, validate generated component code, stream section results and retain deterministic fallbacks. [`LiveComponentPreview.tsx`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/src/components/LiveComponentPreview.tsx) builds an iframe document with React, Tailwind and browser Babel, so the visual surface executes a projection of the current component source. The export route packages those components as a TypeScript project.

## Firestore owns recoverable workspace state

[`firestore.ts`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/src/lib/firestore.ts) defines projects, ordered sections, chat sessions and calibration metadata. [`FullPageBuilderWithProjects.tsx`](https://github.com/varunchalamala007-ops/gaze-gui-scribe/blob/abb36bddf070bbcc86729a853ebfc9925de13ee1/src/components/FullPageBuilderWithProjects.tsx) calls the project create and load helpers, establishing persistence as part of the ordinary workspace rather than an unused server interface. No first-class immutable version graph is present.

## Repository identity

The counted repository preserves commits by Glenn and Nxver-GitHub and merge messages from the earlier `ggrantrichards` lineage. The separate Nxver-GitHub repository is a one-commit snapshot with the same README, live-preview component and gaze-dwell hook, so it is recorded as a duplicate encounter rather than a second product.

## Evidence

- [Canonical preserved repository](https://github.com/varunchalamala007-ops/gaze-gui-scribe)
- [Inspected tree](https://github.com/varunchalamala007-ops/gaze-gui-scribe/tree/abb36bddf070bbcc86729a853ebfc9925de13ee1)
- [Duplicate snapshot](https://github.com/Nxver-GitHub/gaze-gui-scribe)
- Commit: `abb36bddf070bbcc86729a853ebfc9925de13ee1`
