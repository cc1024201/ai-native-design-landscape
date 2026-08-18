# PenBoard

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

PenBoard is counted as an OpenPencil-derived product rather than another OpenPencil mirror. Its claimed product boundary is storyboard intelligence: screen-to-screen navigation data entities shared views and project workflows become editable design objects. The public repository is an attribution-limited one-commit mirror whose README points to a now-inaccessible `ZSeven-W/penboard` repository so this dossier does not treat the mirror owner as the original team.

## What materially changes from OpenPencil

[`package.json`](https://github.com/vietdev99/PenBoard/blob/4fe769fb229ead4f5c6a9f29737f2ab42676fae2/package.json) explicitly calls PenBoard an OpenPencil fork extended with connections entities shared views and project management. This is reflected in executable source rather than only branding:

- [`document-store-connections.ts`](https://github.com/vietdev99/PenBoard/blob/4fe769fb229ead4f5c6a9f29737f2ab42676fae2/src/stores/document-store-connections.ts) writes typed screen connections into the native document and pushes every mutation into history.
- [`entities.ts`](https://github.com/vietdev99/PenBoard/blob/4fe769fb229ead4f5c6a9f29737f2ab42676fae2/src/mcp/tools/entities.ts) gives agents CRUD authority over entities fields rows and views while cascading removed bindings through the node graph.
- [`graph-builder.ts`](https://github.com/vietdev99/PenBoard/blob/4fe769fb229ead4f5c6a9f29737f2ab42676fae2/src/services/workflow/graph-builder.ts) joins pages connections and entities into a workflow graph rather than treating screens as isolated canvases.

Those additions change what the artifact means: the `.op` document is not only a visual scene but also a navigable product storyboard and lightweight data model.

## Agent and human authority converge on the document

The ordinary-user loop remains prompt or direct canvas editing followed by visual inspection and further correction. PenBoard extends the same authority through MCP. [`connections.ts`](https://github.com/vietdev99/PenBoard/blob/4fe769fb229ead4f5c6a9f29737f2ab42676fae2/src/mcp/tools/connections.ts) and the entity tool open mutate and save the document rather than returning detached suggestions. Human edits use the same document store and history boundary.

The key technical definition is therefore `native graph plus storyboard semantics`, not a new renderer or a hosted-code workspace.

## Evidence limit and attribution

- [Public source mirror](https://github.com/vietdev99/PenBoard)
- [Inspected tree](https://github.com/vietdev99/PenBoard/tree/4fe769fb229ead4f5c6a9f29737f2ab42676fae2)
- Commit: `4fe769fb229ead4f5c6a9f29737f2ab42676fae2`

The accessible Git history contains one squashed commit and cannot establish the original implementation sequence. The README badges and links attribute the product to `ZSeven-W/penboard` but that public repository returned 404 at review time. Team region therefore remains unknown and the lineage attribution is deliberately narrower than an original-author claim.
