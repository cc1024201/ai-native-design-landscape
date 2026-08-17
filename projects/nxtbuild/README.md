# NxtBuild

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NxtBuild is distinguished from the many one-page generators in this batch by a durable project record. Messages, current generated source and earlier versions coexist in MongoDB and drive later model turns.

## Generation is project-contextual

[`generation.service.js`](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-/blob/c878997cedb3ce5b9bd2fc9e5eabbbbea294785a/server/src/services/generation.service.js) builds the Gemini request from the project conversation and current code. [`Project.model.js`](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-/blob/c878997cedb3ce5b9bd2fc9e5eabbbbea294785a/server/src/models/Project.model.js) persists messages, generated code and versions rather than treating history as transient chat decoration.

## Builder state has three mutation paths

[`BuilderPage.jsx`](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-/blob/c878997cedb3ce5b9bd2fc9e5eabbbbea294785a/client/src/pages/BuilderPage.jsx) joins prompting, code editing, regeneration and download. [`LivePreview.jsx`](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-/blob/c878997cedb3ce5b9bd2fc9e5eabbbbea294785a/client/src/components/LivePreview.jsx) projects current HTML through `srcDoc`.

Versions retain prior directions but the public code does not establish simultaneous side-by-side comparison. We therefore record candidate-promotion as an additional architecture without claiming a full branching design graph.

## Pinned source

- [Canonical repository](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-)
- [Inspected tree](https://github.com/Abhishek121004/AIPoweredWebAppBuilder-NxtBuild-/tree/c878997cedb3ce5b9bd2fc9e5eabbbbea294785a)
- Commit: `c878997cedb3ce5b9bd2fc9e5eabbbbea294785a`
