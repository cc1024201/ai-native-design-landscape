# AI React Component Generator by Amit Nandan

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

The product has a deliberately narrow authority chain: natural language goes through a Spring service to JSX; react-live then makes that JSX both editable text and the running component.

## Backend produces executable component source

[`AiController.java`](https://github.com/amitnandan/AIReactComponentGenerator/blob/ed6da4e69a2ef0c276f43869d500bc4a730bf478/backend/src/main/java/com/aicomponent/backend/controller/AiController.java) sends the request through OpenAI chat completions and returns an anonymous component body intended for direct evaluation by the frontend.

## Manual edits and visual output share authority

[`App.jsx`](https://github.com/amitnandan/AIReactComponentGenerator/blob/ed6da4e69a2ef0c276f43869d500bc4a730bf478/frontend/frontend/src/App.jsx) places the returned JSX in editable state and passes it to react-live for immediate rendering. A user can correct source and see the same state projected without another model call.

There is no project store, dependency graph or deployment protocol. The ordinary-user loop is real but bounded to one component session.

## Pinned evidence

- [Canonical repository](https://github.com/amitnandan/AIReactComponentGenerator)
- [Inspected commit](https://github.com/amitnandan/AIReactComponentGenerator/commit/ed6da4e69a2ef0c276f43869d500bc4a730bf478)
- [Maintainer region evidence](https://github.com/amitnandan)
- Commit: `ed6da4e69a2ef0c276f43869d500bc4a730bf478`
