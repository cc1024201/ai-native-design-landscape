# Yank Note

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Yank Note is a local-first Markdown editor whose visual authoring surface includes live preview, embedded diagrams and an official AI Copilot extension. The AI component is counted as part of Yank Note, not as a second product, because it installs into and writes the same editor document.

## Markdown remains authority while extensions add visual and AI operations

The desktop application owns files, editor state, extension loading and preview. Its official `yank-note-extension` repository adds provider adapters for OpenAI, Google, GitHub and custom endpoints, plus completion, edit and text-to-image actions. Generated images are inserted into the current document rather than trapped in a separate chat transcript, and editor undo remains available for recovery.

Draw.io and other rendered blocks are projections embedded in the Markdown workflow. The product therefore combines source-authority live projection with an agent extension surface; it is not counted as a native diagram-canvas replacement.

## Evidence

- [Pinned Yank Note repository](https://github.com/purocean/yn/tree/829157b95d8d0dda322f6b088a349e2aeae6ada2)
- [Extension loader](https://github.com/purocean/yn/blob/829157b95d8d0dda322f6b088a349e2aeae6ada2/src/main/extension.ts)
- [Pinned official extension repository](https://github.com/purocean/yank-note-extension/tree/065b22e1081c6118003db64bda41d7df64ee8ab6)
- [AI Copilot package](https://github.com/purocean/yank-note-extension/tree/065b22e1081c6118003db64bda41d7df64ee8ab6/packages/extension-ai-copilot)
