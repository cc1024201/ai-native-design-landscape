# Shape

Shape answers the design question by locating it inside the code the developer already owns. Design is not a separate document the tool maintains; it is a property of ranges in repository source. The desktop editor's direct visual tools and its AI preview are two different ways of touching that one source, and the decisive line between them is whether a change is durable. [Pinned repository](https://github.com/useshape/Shape/tree/28d5e37610aa0c2316591c630e9a63f3e3d61e83)

## Source-mapped editing is the narrow, reliable contract

The [`design source map`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/features/editor/lib/design-source-map.ts) records exact character spans for scrubbable CSS and Tailwind values; dragging a slider rewrites only the selected span instead of regenerating a component. This is a page-local, deterministic edit — nothing is re-synthesized, so nothing can drift. The direct controls in [`design-tools.mdx`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/docs/editor/design-tools.mdx) (styling, spacing, tokens, source attribution, accessibility diagnostics) treat the rendered interface as a hand reaching into known offsets.

## Preview is real but not authoritative

AI Visual mode builds a proposed interface in an isolated React/Tailwind sandbox — [`design-preview-sandbox.ts`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/lib/design-preview-sandbox.ts) defines the offline runtime, [`design-preview-store.ts`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/lib/design-preview-store.ts) keeps sessions only in memory, and the chat [`preview block`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/features/chat/ui/blocks/preview.tsx) shows them in a sandboxed iframe or image. The preview is a decision artifact, not a second truth — it does not silently supersede the repository.

## Agent writes cross a review boundary

Once the AI actually mutates files, Shape separates concerns that most tools blur. The [`DESIGN.md`](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/src-tauri/src/agent/prompts/DESIGN.md) prompt constrains how the filesystem agent approaches interface work, and every write is followed by Keep/Undo decisions against the session baseline ([reviewing edits](https://github.com/useshape/Shape/blob/28d5e37610aa0c2316591c630e9a63f3e3d61e83/docs/ai/reviewing-edits.mdx)); terminal commands are a separate approval. So the pipeline is: repository source → live direct tools (deterministic) or isolated preview (proposed) → reviewed file mutation → Git. The preview helps the human choose; Git is the durable history.

The honest boundary is that Visual mode is not yet a multi-option version system — in-memory previews are useful but not durable branches. Shape qualifies on source-mapped editing plus a genuine agent-to-filesystem review path, not on claim of a mature visual VCS.
