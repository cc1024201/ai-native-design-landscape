# HexCode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HexCode is a community-oriented text-to-website platform. A persistent project can hold either a React file graph or a plain HTML/CSS/JavaScript artifact, plus its generation conversation and social reuse state.

## The model returns different artifact shapes by project type

[`chatController.js`](https://github.com/Ashish-More-2023/HexCode/blob/f442705a8241ebdd29081f4d3f3a71488cd7a51f/backend/controllers/chatController.js) asks Claude for a path-keyed React project or a plain web bundle. Generated image placeholders are also resolved before the response is saved.

## MongoDB makes the conversation part of the project

[`projectModel.js`](https://github.com/Ashish-More-2023/HexCode/blob/f442705a8241ebdd29081f4d3f3a71488cd7a51f/backend/models/projectModel.js) keeps chats and model artifacts under the project identity. [`projectController.js`](https://github.com/Ashish-More-2023/HexCode/blob/f442705a8241ebdd29081f4d3f3a71488cd7a51f/backend/controllers/projectController.js) supports ownership, visibility, voting, and copying a project with its artifact history.

## Sandpack projects the current file graph

[`SandpackPreviewClient.js`](https://github.com/Ashish-More-2023/HexCode/blob/f442705a8241ebdd29081f4d3f3a71488cd7a51f/frontend/src/pages/SandpackPreviewClient.js) renders React output, while the plain path has its own preview. This is a managed project and community loop rather than a single generated snippet.

## Pinned evidence

- [Repository](https://github.com/Ashish-More-2023/HexCode)
- [Inspected tree](https://github.com/Ashish-More-2023/HexCode/tree/f442705a8241ebdd29081f4d3f3a71488cd7a51f)
- Commit: `f442705a8241ebdd29081f4d3f3a71488cd7a51f`
