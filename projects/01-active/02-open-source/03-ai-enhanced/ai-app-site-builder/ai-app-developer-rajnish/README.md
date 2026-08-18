# AI App Developer by Rajnish Kumar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

AI App Developer defines a managed multi-file project rather than a one-shot page. The user supplies a prompt and language/framework choice, receives a file tree, continues work in the editor/preview surface, can collaborate by role and can track deployment metadata.

## The Mongo project is broader than the generated answer

Pinned revision: `e8b12ff542cb77ac08342ec305fa95b176219cc4`.

The `Project` schema stores ownership, collaborators, prompt/model metadata, language, dependencies and files with path/content/last-modified fields. It also records visibility and deployment status. This makes the file array the source authority and treats preview or deployment as projections of it.

The schema contains a numeric version and change-history descriptions, but those entries do not themselves snapshot file content. They are an audit label, not sufficient rollback evidence.

## Delivery has its own clock

Deployment records provider, URL and status independently from current files. A project can therefore advance while its deployed copy stays old or a deployment remains failed. The dossier credits that state separation without assuming every named provider adapter is complete.

## Pinned evidence

- [Repository](https://github.com/rajnishkumarsakh2007-web/AI-App-Developer)
- [Project and file authority](https://github.com/rajnishkumarsakh2007-web/AI-App-Developer/blob/e8b12ff542cb77ac08342ec305fa95b176219cc4/backend/src/models/Project.js)
- [Project routes](https://github.com/rajnishkumarsakh2007-web/AI-App-Developer/blob/e8b12ff542cb77ac08342ec305fa95b176219cc4/backend/src/routes/projects.js)
- [Deployment routes](https://github.com/rajnishkumarsakh2007-web/AI-App-Developer/blob/e8b12ff542cb77ac08342ec305fa95b176219cc4/backend/src/routes/deployment.js)
