# Pigcasso Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pigcasso Canvas combines a tldraw infinite ChatCanvas with a separate Fabric-based classic editor. Prompts can create images, edits, HTML cards or ideation output, but users can continue through selection tools, direct canvas manipulation, layer-aware actions, history, export and publishing.

## The saved board is more than a generated image

[`schema.ts`](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/db/schema.ts) and the canvas migrations persist a canvas document and chat history in Postgres. [`use-canvas-snapshot-persistence.ts`](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/features/canvases/screens/canvas-screen/hooks/use-canvas-snapshot-persistence.ts) hydrates and writes the tldraw snapshot rather than reconstructing the board from its cover image.

[`use-canvas-send-message.ts`](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/features/canvases/screens/canvas-screen/hooks/use-canvas-send-message.ts) translates chat intent into queued canvas actions with current selection and attachments as context. The classic editor separately serializes Fabric objects and exposes [`use-history.ts`](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/features/editor/hooks/use-history.ts) for undo/redo.

## Delivery retains an editable origin

Canvas PNG, NFT/IPFS publication, gallery sharing and repository-to-asset flows are derivatives of a stored board or editor project. The repository exposes a real implementation but no open-source license file at the reviewed SHA, so source availability should not be confused with an explicit reuse grant.

## Evidence

- [Pinned repository](https://github.com/kevinsslin/pigcasso-canva/tree/c99ea39c69aee32e2263e966395b2fdfd9197963)
- [Canvas screen](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/features/canvases/screens/canvas-screen/canvas-screen.tsx)
- [Fabric serialization](https://github.com/kevinsslin/pigcasso-canva/blob/c99ea39c69aee32e2263e966395b2fdfd9197963/src/features/editor/fabric-json.ts)
