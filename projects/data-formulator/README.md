# Data Formulator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Microsoft Research's Data Formulator treats visualization Design as a conversation over data, semantic chart specifications and branching alternatives. It is not counted as a generic analytics chatbot: the agent produces structured chart artifacts that users can directly encode, restyle, compare and retain in a workspace.

## The workspace joins data and chart semantics

Imported or transformed data, chart encodings, agent threads and rendered specifications live in application state. The rendering path in [`ChartRenderService.tsx`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/src/views/ChartRenderService.tsx) can project semantic chart descriptions through supported visualization backends rather than storing only a screenshot.

The unified [`analyst agent`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/py-src/data_formulator/analyst/agent.py) composes tools and skills for data and visualization work. A specialized [`chart restyle agent`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/py-src/data_formulator/agents/agent_chart_restyle.py) transforms Vega-Lite style intent while stripping embedded data from the prompt and returns both a specification and configuration UI.

## Generation does not remove direct authoring

Users can manipulate encodings on the shelf, inspect chart variants and issue local refinements. [`EncodingShelfThread.tsx`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/src/views/EncodingShelfThread.tsx) binds direct encoding choices to the agent thread, while [`ChartVariantStrip.tsx`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/src/views/ChartVariantStrip.tsx) preserves alternative chart directions for comparison.

The important decision model is branching rather than only undo: a user can ask for a different chart or edit from an existing point and keep sibling outcomes in the workspace.

## Persistence is a sanitized workspace snapshot

[`useAutoSave.tsx`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/src/app/useAutoSave.tsx) debounces Redux workspace persistence and removes secrets and transient fields before saving a schema-versioned snapshot. The backend [`sessions routes`](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/py-src/data_formulator/routes/sessions.py) define local, Azure and ephemeral storage boundaries plus workspace ZIP import and export.

## Artifact and delivery boundary

Charts can resolve to Vega-Lite, ECharts or Chart.js projections, but the durable object is the workspace's data, thread and semantic chart state. Rendered images are derivatives. Generated transformations and chart claims still require human validation against the underlying data; a successful render is not evidence that an analytical conclusion is correct.

## Evidence

- [Pinned repository](https://github.com/microsoft/data-formulator/tree/5d4f7b32b41888c21ca345742cdc1e6abb566d7f)
- [Current project overview](https://github.com/microsoft/data-formulator/blob/5d4f7b32b41888c21ca345742cdc1e6abb566d7f/README.md)
