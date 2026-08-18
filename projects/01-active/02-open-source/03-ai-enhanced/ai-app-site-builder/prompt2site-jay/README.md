# Prompt2Site by Jay Sankopal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Prompt2Site defines a small hosted website artifact as three separately stored source layers. Authentication and history use Firebase identity while MongoDB owns the expiring generated project.

## OpenRouter is parsed into three authorities

[aiControllers.js](https://github.com/jayy0077/AI_Website_Generator/blob/4608d13f1e6852753c776740b880be2b5ccb0a29/backend/controllers/aiControllers.js) asks OpenRouter for labeled HTML, CSS and JavaScript blocks and parses them into a structured response. A failed or malformed block is visible as missing-source placeholders rather than a hidden template substitute.

## Projects deliberately expire

[Project.js](https://github.com/jayy0077/AI_Website_Generator/blob/4608d13f1e6852753c776740b880be2b5ccb0a29/backend/models/Project.js) stores the three layers with a seven-day Mongo TTL. [save.js](https://github.com/jayy0077/AI_Website_Generator/blob/4608d13f1e6852753c776740b880be2b5ccb0a29/backend/routes/save.js) binds them to the authenticated user. This is durable short-lived storage rather than indefinite version history.

## Preview and ZIP reassemble the same layers

The frontend composes current HTML, CSS and JavaScript into an iframe. Its download path writes those same layers into a portable ZIP; history recovers saved projects but does not expose snapshots inside one project.

## Evidence

- [Canonical repository](https://github.com/jayy0077/AI_Website_Generator)
- [Inspected tree](https://github.com/jayy0077/AI_Website_Generator/tree/4608d13f1e6852753c776740b880be2b5ccb0a29)
- Commit: 4608d13f1e6852753c776740b880be2b5ccb0a29
