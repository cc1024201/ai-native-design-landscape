# Buildora AI Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Buildora stores each generated website as a Mongo document whose full HTML is shared by the editor preview and public project surfaces. Its source exposes a simple persisted artifact model rather than a file graph or design-node graph.

## Browser-side Gemini writes the initial document

[`Builder.jsx`](https://github.com/AdithyaTB/Buildora-AI-Studio/blob/6742f2b84d580b458d0b933e386d60f5446b28d6/client/src/pages/Builder.jsx) constructs a website prompt and calls the Google Generative AI SDK. It normalizes the response into both a snippet and complete HTML document before offering save download and new-tab inspection. This snapshot embeds the provider call in the client build which is a credential-exposure limitation rather than a different artifact authority.

## Mongo owns saved projects

[`Project.js`](https://github.com/AdithyaTB/Buildora-AI-Studio/blob/6742f2b84d580b458d0b933e386d60f5446b28d6/server/models/Project.js) stores prompt generated code full source ownership and public status. [`projectController.js`](https://github.com/AdithyaTB/Buildora-AI-Studio/blob/6742f2b84d580b458d0b933e386d60f5446b28d6/server/controllers/projectController.js) mediates create update and retrieval. The editor and [`PreviewFrame.jsx`](https://github.com/AdithyaTB/Buildora-AI-Studio/blob/6742f2b84d580b458d0b933e386d60f5446b28d6/client/src/components/PreviewFrame.jsx) consume the saved source rather than an unrelated render capture.

## Sharing is not versioning

Public status can expose the current project to the community and download exports it. The model contains no immutable versions collection; saving a revision changes the project authority rather than creating a recoverable historical branch.

## Evidence and location

- [Canonical repository](https://github.com/AdithyaTB/Buildora-AI-Studio)
- [Inspected tree](https://github.com/AdithyaTB/Buildora-AI-Studio/tree/6742f2b84d580b458d0b933e386d60f5446b28d6)
- [Project controller](https://github.com/AdithyaTB/Buildora-AI-Studio/blob/6742f2b84d580b458d0b933e386d60f5446b28d6/server/controllers/projectController.js)
- Commit: `6742f2b84d580b458d0b933e386d60f5446b28d6`

The maintainer's [GitHub profile](https://github.com/AdithyaTB) states Madurai in Tamil Nadu; team region is recorded as India.
