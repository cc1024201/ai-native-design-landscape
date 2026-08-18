# stagewise

stagewise defines design as something you can see *running* — a real web page under a debugger, not a design document and not a spec. Its whole architecture is runtime-observation-first: the visual artifact is the live application, and design intelligence is recovered from that running surface rather than from any separate proprietary model. This is what makes the browser-as-IDE claim cohere.

## The live tab is the design surface; runtime state is the context

An Electron `WebContentsView` hosts a real page on a persistent browser partition. Chrome DevTools Protocol is attached to that tab and exposes the DOM, CSS, console output, screenshots, frames and viewport — the browser's own model of what is on screen becomes the agent's ground truth. [Browsing-tab controller](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/browsing-tab-controller.ts)

Selection is therefore a runtime identity: elements are targeted by CDP `backendNodeId` plus `frameId`, hit-tested and cached along with execution contexts. That is design intent expressed as "this rendered pixel belongs to that browser node," not as a file and line. For React pages a Fiber tracker walks `__reactFiber$` ancestry to recover component names and debug owners, adding framework meaning to the same runtime identity. [Selected-element tracker](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/selected-element-tracker/index.ts) · [React Fiber enrichment](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/selected-element-tracker/react-component-tracker.ts)

## The agent mutates a codebase, but design proof stays in the runtime

Those captured selections feed a first-party coding-agent runtime (`agent-core`, `agent-runtime-node`, `agent-shell`), which can modify a connected project. The durable implementation is the repository; the durable design evidence is the still-running page. The two are joined only through the agent workflow — there is no universal DOM-node-to-source-line resolver or centralized visual-operation log in the pinned source. Arbitrary sites without a connected codebase are observable but not persistable as source. [Agent packages](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/packages/agent-core/) · [Product posture](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/README.md)

The pinned Electron/React/Cdp stack and the browser-first artifact model are source-established; whether selected nodes resolve deterministically to source files remains open ([pinned revision](https://github.com/stagewise-io/stagewise/tree/065cf5f23646f5c2d238c669cfb7112609f7bc6b)).
