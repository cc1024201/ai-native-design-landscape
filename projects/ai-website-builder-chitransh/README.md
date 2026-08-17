# AI Website Builder by Chitransh Chocksey

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Chitransh's builder separates initial structured generation from two forms of correction: general chat and element-targeted refinement. The browser remains the current artifact authority.

## Initial generation has a three-layer schema

[generate/route.ts](https://github.com/Chitransh-C/ai_website_builder/blob/0aef4a0d3c88d176ef5d8fee1fa960517495272b/src/app/api/generate/route.ts) asks Gemini for HTML CSS JavaScript and external scripts as structured output. Those layers can be inspected independently before they are combined for rendering.

## Refinement can carry a selected DOM target

[refine-element/route.ts](https://github.com/Chitransh-C/ai_website_builder/blob/0aef4a0d3c88d176ef5d8fee1fa960517495272b/src/app/api/refine-element/route.ts) accepts element context and requested changes while [chat/route.ts](https://github.com/Chitransh-C/ai_website_builder/blob/0aef4a0d3c88d176ef5d8fee1fa960517495272b/src/app/api/chat/route.ts) handles broader conversation. This gives runtime selection a path back to generated source rather than leaving it as annotation only.

## Browser state owns the accepted revision

[page.tsx](https://github.com/Chitransh-C/ai_website_builder/blob/0aef4a0d3c88d176ef5d8fee1fa960517495272b/src/app/page.tsx) assembles and previews the current layers. The inspected code does not establish durable server projects or historical snapshots so persistence claims stop at the active browser workspace.

## Evidence

- [Canonical repository](https://github.com/Chitransh-C/ai_website_builder)
- [Inspected tree](https://github.com/Chitransh-C/ai_website_builder/tree/0aef4a0d3c88d176ef5d8fee1fa960517495272b)
- Commit: 0aef4a0d3c88d176ef5d8fee1fa960517495272b
