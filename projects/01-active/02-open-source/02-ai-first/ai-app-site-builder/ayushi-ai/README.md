# Ayushi.AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ayushi.AI is a single-document website builder. Gemini returns complete HTML; the browser keeps that document as current; source editing preview download and publication are projections or promotions of the same value.

## One generated document drives the loop

[`server/Controller/genAi.controller.js`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/server/Controller/genAi.controller.js) requests a complete HTML page from Gemini. [`client/src/pages/Canvas.jsx`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/client/src/pages/Canvas.jsx) owns the current source in React state.

[`EditableComponent.jsx`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/client/src/component/EditableComponent.jsx) supports direct correction and [`IframePreview.jsx`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/client/src/component/IframePreview.jsx) renders the same document.

## Export and publication are explicit but persistence is thin

[`downloadZip.js`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/client/src/Utils/downloadZip.js) packages the adopted HTML. [`publish.controller.js`](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/blob/12b49e44f93e259091bdb9e592f2ca1afad1b4c1/server/Controller/publish.controller.js) writes it into a server publication directory and returns a URL. There is no durable user project or version graph in the inspected source.

## Evidence and location

- [Canonical repository](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder)
- [Inspected tree](https://github.com/harshxframe/ayushi.ai-Prompt_to_website_builder/tree/12b49e44f93e259091bdb9e592f2ca1afad1b4c1)
- Commit: `12b49e44f93e259091bdb9e592f2ca1afad1b4c1`

The maintainer profile states India; team region is recorded as India.
