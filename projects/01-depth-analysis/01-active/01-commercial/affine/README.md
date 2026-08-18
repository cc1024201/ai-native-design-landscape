# AFFiNE

AFFiNE is a local-first knowledge and canvas platform whose Edgeless Copilot treats design as proposed mutations to the native BlockSuite document. The relevant jobs — generating slides, mind maps, images and prototype interfaces — happen inside an existing spatial workspace rather than in a blank canvas, so the copilot's answer to "what is design" is negotiation with a live document graph.

## AI output is staged before it can join the document

The pinned Edgeless response handler implements explicit insert, discard and retry actions. A generated result is not authoritative just because the model returned it: insertion mutates the BlockSuite store, while discard leaves the document untouched. Action configuration connects capabilities such as `createSlides`, mind maps, images and make-it-real prototypes to that staging path.

```text
selected canvas context + request -> copilot session response
-> staged Edgeless result -> insert / discard / retry
-> persistent BlockSuite workspace and document history
```

This proposal/commit split is the decisive mechanism: the model proposes, the document's existing structure plus a human gesture commits. AFFiNE is counted once as an established platform with AI, not separately for each Edgeless action. The Toeverything GitHub organization reports Singapore.

**证据**

- [Pinned repository](https://github.com/toeverything/AFFiNE/tree/26c515e050211269e911f7d9cfe162a26c83ed98)
- [Edgeless copilot source tree](https://github.com/toeverything/AFFiNE/tree/26c515e050211269e911f7d9cfe162a26c83ed98/blocksuite/affine/blocks/edgeless/src/components/copilot)
- [Copilot actions](https://github.com/toeverything/AFFiNE/blob/26c515e050211269e911f7d9cfe162a26c83ed98/packages/frontend/core/src/blocksuite/ai/config/actions-config.ts)
- [Maintainer location evidence](https://github.com/toeverything)
