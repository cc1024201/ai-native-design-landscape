# DiagramAI by Nihal

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This DiagramAI repository defines a D2-first chat editor, but the pinned commit is an incomplete source assembly rather than a runnable completed phase. Its technical direction is still legible: OpenAI proposes D2, D2 stays editable, and Kroki is intended to be the rendering authority.

## The implemented server boundary asks for structured D2

At commit [`0ce5124a`](https://github.com/Nihal018/DiagramAI/tree/0ce5124a39645cb88fecc55e8a051a237b423ebc), [`chat/route.ts`](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/app/api/chat/route.ts) sends supplied messages to GPT-4.1 mini through the Vercel AI SDK. `streamObject` constrains the result to a short message and `d2Code` string. The very large [D2 prompt](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/lib/prompts.ts) supplies syntax and examples across flow, state, ERD, network, class and sequence diagrams.

There is a small contract inconsistency: the Zod schema requests camel-case `d2Code` while the prompt’s required JSON example says `d2code`. Structured generation may repair that at runtime, but the source itself does not document the mismatch.

## The intended artifact is D2 source with a remote projection

[`DiagramEditorMain.tsx`](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/app/editor/DiagramEditorMain.tsx) contains the intended review flow: generated D2 enters a textarea, a user can apply or cancel source edits, and delivery actions download `.d2`, SVG or PNG. [`kroki-client.ts`](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/lib/kroki-client.ts) deflates the source into a Kroki D2 URL and caches the returned SVG in process memory.

That architecture would make source authoritative and rendering reproducible through Kroki. It is not a native node editor: visual correction means changing D2 and re-rendering it.

## The repository is missing its assembly layer

The editor imports `../components/store`, `store-hooks`, `bubbles` and `diagram-renderer`, plus shared UI and example components. None of those files exists in the pinned Git tree. The handlers that are supposed to send prompts, update code, retry/replay queries and render SVG therefore have no implementation available to link.

This is not a dependency-install issue; the project source itself lacks the referenced modules. The README’s “Phase 1 completed” statement consequently cannot be treated as executable evidence. There is also no durable project persistence in the files that are present.

The correct landscape interpretation is a partially implemented product definition, not a verified closed lifecycle. It is useful because it shows another team choosing D2 plus a rendering service rather than Mermaid or a native graph, while its missing modules make the maturity boundary explicit.

## Evidence

- [Pinned repository and phase claims](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/README.md)
- [OpenAI structured-generation route](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/app/api/chat/route.ts)
- [Intended source-edit and delivery UI](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/app/editor/DiagramEditorMain.tsx)
- [Kroki D2 projection](https://github.com/Nihal018/DiagramAI/blob/0ce5124a39645cb88fecc55e8a051a237b423ebc/lib/kroki-client.ts)
