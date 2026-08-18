# AI Component Builder by Gokul Krishna

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This implementation separates model access, state transition and projection into a small playground architecture.

## Source enters Redux before rendering

[`aiService.js`](https://github.com/GokulKrishnaK771/AI-Component-Builder/blob/3b45d7499d761a490421ea26b3f8271869c7cb4d/src/services/aiService.js) constrains Groq to return a default-exported React component. [`aislice.js`](https://github.com/GokulKrishnaK771/AI-Component-Builder/blob/3b45d7499d761a490421ea26b3f8271869c7cb4d/src/features/ai/aislice.js) makes the returned code and request status explicit application state.

[`Preview.jsx`](https://github.com/GokulKrishnaK771/AI-Component-Builder/blob/3b45d7499d761a490421ea26b3f8271869c7cb4d/src/components/playground/tabs/Preview.jsx) converts that state to an iframe document. The playground also exposes code and chat views but has no durable project or saved-variant store.

## Pinned source

- [Canonical repository](https://github.com/GokulKrishnaK771/AI-Component-Builder)
- [Inspected tree](https://github.com/GokulKrishnaK771/AI-Component-Builder/tree/3b45d7499d761a490421ea26b3f8271869c7cb4d)
- Commit: `3b45d7499d761a490421ea26b3f8271869c7cb4d`
