# AI Component Builder by Debanik

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This browser-only component generator makes a sharper execution tradeoff than iframe-based peers: it evaluates returned JavaScript inside the application process.

## Constrained prompt then dynamic evaluation

[`App.tsx`](https://github.com/Debanikkkk/AI_Component_Builder/blob/59881660253405db56926283d1000df9f5ffa165/src/App.tsx) asks Gemini for a named React component under explicit import and output rules and retains the response for inspection. [`AIRenderComponent.tsx`](https://github.com/Debanikkkk/AI_Component_Builder/blob/59881660253405db56926283d1000df9f5ffa165/src/component/AIRenderComponent.tsx) transforms and executes that string with `new Function` to obtain the running component.

The source string is the working artifact; the React element is its projection. Dynamic evaluation is also the principal trust boundary. The repository provides neither isolation comparable to Sandpack nor durable revisions.

## Source anchors

- [Canonical repository](https://github.com/Debanikkkk/AI_Component_Builder)
- [Inspected tree](https://github.com/Debanikkkk/AI_Component_Builder/tree/59881660253405db56926283d1000df9f5ffa165)
- Commit: `59881660253405db56926283d1000df9f5ffa165`
