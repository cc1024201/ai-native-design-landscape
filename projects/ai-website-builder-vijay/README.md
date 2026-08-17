# AI Website Builder by Vijay Kusekar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vijay's builder separates project planning from per-file generation and later represents revisions as operations against a persisted Mongo file graph. Its numeric version is current-state metadata rather than an archive of every prior graph.

## The model first commits to a file plan

[ai.js](https://github.com/Vijay-2003/AI-Website-Builder/blob/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8/server/services/ai.js) asks OpenRouter for a structured project plan and then generates files under schema and validation checks. Invalid source is normalized before it reaches storage rather than being trusted as an arbitrary response.

## Mongo owns named files and hashes

[Project.js](https://github.com/Vijay-2003/AI-Website-Builder/blob/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8/server/models/Project.js) stores current files, their hashes, generation state and a numeric version. [projectController.js](https://github.com/Vijay-2003/AI-Website-Builder/blob/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8/server/controllers/projectController.js) applies structured revision operations and increments that number.

## Direct editing changes the same graph

The client autosaves manual file changes to the project. [PreviewPanel.jsx](https://github.com/Vijay-2003/AI-Website-Builder/blob/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8/client/src/components/PreviewPanel.jsx) executes current files and [exportProject.js](https://github.com/Vijay-2003/AI-Website-Builder/blob/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8/client/src/utils/exportProject.js) packages them. No source evidence establishes rollback to every numeric version.

## Evidence

- [Canonical repository](https://github.com/Vijay-2003/AI-Website-Builder)
- [Inspected tree](https://github.com/Vijay-2003/AI-Website-Builder/tree/e6a36d5c479c9fc44ed8166658eb8822d5c93ff8)
- Commit: e6a36d5c479c9fc44ed8166658eb8822d5c93ff8
