# XSharko AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

XSharko AI is a persisted single-document website builder. OpenRouter creates or revises one complete HTML page; MongoDB keeps the adopted document and its conversation; deployment metadata tracks whether it has moved outside the editor.

## `latestCode` is the source of truth

[`website.models.js`](https://github.com/tamimbro01/xsharkoAI/blob/bd069d90eea0140fbeb0c9d3aa15dfd149815f65/backend/src/models/website.models.js) stores `latestCode` beside user messages deployment status URL and slug. There is no file tree or native design graph. The artifact is the latest complete HTML string.

## Generation and revision share one controller boundary

[`website.controllers.js`](https://github.com/tamimbro01/xsharkoAI/blob/bd069d90eea0140fbeb0c9d3aa15dfd149815f65/backend/src/controllers/website.controllers.js) builds a strict raw-JSON prompt and calls the OpenRouter adapter. Initial generation creates the website record; later prompts include current code and replace `latestCode` after a successful parse. Conversation entries explain the transition but do not themselves determine the page.

## Visual and delivery surfaces

[`WebsiteEditor.jsx`](https://github.com/tamimbro01/xsharkoAI/blob/bd069d90eea0140fbeb0c9d3aa15dfd149815f65/frontend/src/Pages/WebsiteEditor.jsx) loads the stored document for code inspection and visual rendering. Deployment state is explicit in the model. The snapshot does not contain a durable historical version collection so a successful revision overwrites the prior `latestCode` unless external deployment or database backups preserve it.

## Evidence and location

- [Canonical repository](https://github.com/tamimbro01/xsharkoAI)
- [Inspected tree](https://github.com/tamimbro01/xsharkoAI/tree/bd069d90eea0140fbeb0c9d3aa15dfd149815f65)
- [OpenRouter adapter](https://github.com/tamimbro01/xsharkoAI/blob/bd069d90eea0140fbeb0c9d3aa15dfd149815f65/backend/config/openRouter.config.js)
- Commit: `bd069d90eea0140fbeb0c9d3aa15dfd149815f65`

The maintainer's [GitHub profile](https://github.com/tamimbro01) states Bangladesh; team region is recorded as Bangladesh.
