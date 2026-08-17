# BitFun

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BitFun is a general desktop coding agent that can materialize task-specific “Agentic Mini Apps”: interactive interfaces tied to the active conversation, files and runtime state. Those mini apps turn visual work from a chat attachment into a live, generated control surface.

## Mini Apps bind generated UI to agent state

[`canvas_api.rs`](https://github.com/GCWing/BitFun/blob/2aa7bff5b83ccbd5230d83d6e11f7c4ea92f618c/src/apps/desktop/src/api/canvas_api.rs) exposes desktop canvas operations, while [`session_application.rs`](https://github.com/GCWing/BitFun/blob/2aa7bff5b83ccbd5230d83d6e11f7c4ea92f618c/src/apps/desktop/src/runtime/session_application.rs) binds an application to a session. The canvas runtime plugin loads generated app source into the desktop shell; examples include an icon-design-system Mini App rather than only generic forms.

BitFun also has filesystem/Git authority and office/presentation delivery paths, so an agent can couple a generated interface to the actual working artifact. Sparo OS states that it derives technical foundations from BitFun, but BitFun is independently published and usable; it is counted as a predecessor product, not folded into Sparo.

## Evidence

- [Pinned repository](https://github.com/GCWing/BitFun/tree/2aa7bff5b83ccbd5230d83d6e11f7c4ea92f618c)
- [Canvas runtime plugin](https://github.com/GCWing/BitFun/blob/2aa7bff5b83ccbd5230d83d6e11f7c4ea92f618c/src/web-ui/vite.config.canvas-runtime-plugin.ts)
- [Mini App examples](https://github.com/GCWing/BitFun/tree/2aa7bff5b83ccbd5230d83d6e11f7c4ea92f618c/MiniApp/Demo)
