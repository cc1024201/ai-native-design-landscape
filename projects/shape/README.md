# Shape

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Shape is a desktop code editor that treats the running interface as an authoring surface over repository files. Its strongest technical distinction is the separation between deterministic property edits, sandboxed AI previews and reviewed filesystem mutations.

## Source files remain authoritative

Shape's visual tools do not introduce a second design document. The [`design source map`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/features/editor/lib/design-source-map.ts) records exact character spans for scrubbable CSS and Tailwind values and rewrites only the selected span. This is a narrower but more reliable contract than regenerating a component whenever a person changes one property.

The product documentation describes direct controls for styling, spacing and tokens alongside source attribution and accessibility diagnostics in [`design-tools.mdx`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/docs/editor/design-tools.mdx).

## Preview is deliberately not durable authority

AI Visual mode can construct or revise a proposed interface in an offline React/Tailwind sandbox. [`design-preview-sandbox.ts`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/lib/design-preview-sandbox.ts) defines that isolated runtime, while [`design-preview-store.ts`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/lib/design-preview-store.ts) keeps preview sessions in memory.

The chat [`preview block`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/features/chat/ui/blocks/preview.tsx) renders the proposal in a sandboxed iframe or image. The preview helps a user decide, but it does not silently supersede the repository.

## Agent mutation crosses a review boundary

The design agent prompt in [`DESIGN.md`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/src-tauri/src/agent/prompts/DESIGN.md) constrains how the filesystem agent approaches interface work. Once the agent writes files, Shape exposes Keep and Undo decisions against the session baseline; terminal commands remain separately approved. Resolved decisions persist with the session, while Git remains the durable project history.

The complete loop is therefore:

`repository source → live/direct design tools or isolated AI preview → reviewed file mutation → Git`

## Current boundary

Shape's documentation states that Visual mode does not yet provide a simultaneous multi-option gallery. In-memory previews are useful decision artifacts but not durable branches. The project qualifies through source-mapped visual editing and a real agent-to-filesystem review path, not through claims of a mature visual version system.

## Evidence

- [Pinned repository](https://github.com/useshape/Shape/tree/28d5e37610aa0c2316591c630e9a63f3e3d61e83)
- [Reviewing agent edits](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/docs/ai/reviewing-edits.mdx)
