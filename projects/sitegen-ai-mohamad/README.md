# SiteGen AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SiteGen AI is a MERN workspace in which a sidebar conversation produces the HTML currently displayed by a dedicated playground. Its source exposes the model boundary and the browser projection rather than only asserting that AI is present.

## The backend constrains the artifact format

[`backend/routes/gemini.js`](https://github.com/Mohamad-Amjad/AI-webpage-generator/blob/50795c659648dc79d8330ee84c31f513e228d5e9/backend/routes/gemini.js) calls Gemini and instructs it to return body-suitable Tailwind and Flowbite HTML. The frontend [`Workspace.js`](https://github.com/Mohamad-Amjad/AI-webpage-generator/blob/50795c659648dc79d8330ee84c31f513e228d5e9/frontend/src/workspace/Workspace.js) holds that returned HTML and passes it from the conversational sidebar to the playground.

## Playground is projection and delivery

[`Playground.js`](https://github.com/Mohamad-Amjad/AI-webpage-generator/blob/50795c659648dc79d8330ee84c31f513e228d5e9/frontend/src/Playground/Playground.js) writes the generated document into an iframe and packages it as a downloadable HTML file. The repository also includes prompt-response history through the full-stack application, but it does not establish a versioned source tree or a structured page graph.

## Authority judgment

The current HTML state is the immediate authority for rendering and export. Conversation history can recover interactions; it is not shown to be a revision lineage for the artifact itself.

## Pinned evidence

- [Canonical repository](https://github.com/Mohamad-Amjad/AI-webpage-generator)
- [Inspected tree](https://github.com/Mohamad-Amjad/AI-webpage-generator/tree/50795c659648dc79d8330ee84c31f513e228d5e9)
- Commit: `50795c659648dc79d8330ee84c31f513e228d5e9`
