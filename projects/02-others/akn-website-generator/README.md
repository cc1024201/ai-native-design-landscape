# AKN Website Generator AI Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

AKN uses OVHcloud-hosted models to make and revise one complete HTML document. Its distinctive implementation choice is to treat the chat transcript as the recoverable source trail.

## Conversation messages carry the source

Pinned revision: `9d9112cdcb5b92f7a9643679cee02ced91f6566c`.

Assistant messages contain the generated code, and the browser serializes the conversation to `localStorage`. On return, the app recovers the latest assistant document. This gives one-browser continuity, but not named projects, cross-device durability or a first-class version graph.

## Direct edits join history differently

Prompt refinement asks the server for a replacement document. Manual editor changes are also promoted back into the conversation as a new code-bearing entry. The result is a linear sequence with no branch, diff or explicit restore command; selecting the latest code is the de facto current-version rule.

## Save and download are separate exits

The Node service can write generated pages to its own output location, while the browser can download the current HTML. Neither is a hosted deployment record, and the two paths should not be collapsed into “publish.”

## Pinned evidence

- [Repository](https://github.com/akn-code/akn-website-generator-ai-agent)
- [Model and server-side save boundary](https://github.com/akn-code/akn-website-generator-ai-agent/blob/9d9112cdcb5b92f7a9643679cee02ced91f6566c/server.js)
- [Conversation persistence and recovery](https://github.com/akn-code/akn-website-generator-ai-agent/blob/9d9112cdcb5b92f7a9643679cee02ced91f6566c/public/scripts/app.js)
- [Direct-edit promotion](https://github.com/akn-code/akn-website-generator-ai-agent/blob/9d9112cdcb5b92f7a9643679cee02ced91f6566c/public/scripts/editor.js)
- [Preview and browser delivery](https://github.com/akn-code/akn-website-generator-ai-agent/blob/9d9112cdcb5b92f7a9643679cee02ced91f6566c/public/scripts/preview.js)
