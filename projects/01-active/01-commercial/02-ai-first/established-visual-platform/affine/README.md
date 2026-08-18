# AFFiNE

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AFFiNE is a local-first knowledge and canvas platform whose Edgeless Copilot treats AI output as proposed mutations to the native BlockSuite document. The relevant Design jobs include generating slides, mind maps, images and prototype interfaces inside an existing spatial workspace.

## AI output is staged before it joins the document

The pinned Edgeless response handler implements explicit insert, discard and retry actions. Generated results are not authoritative merely because a model returned them: insertion mutates the BlockSuite store, while discard leaves the document unchanged. Action configuration connects capabilities such as `createSlides`, mind maps, images and make-it-real prototypes to that staging path.

```text
selected canvas context + request -> copilot session response
-> staged Edgeless result -> insert / discard / retry
-> persistent BlockSuite workspace and document history
```

This proposal/commit distinction is the decisive mechanism. AFFiNE is counted once as an established platform with AI, not separately for each Edgeless action. The Toeverything GitHub organization reports Singapore.

## Evidence

- [Pinned repository](https://github.com/toeverything/AFFiNE/tree/26c515e050211269e911f7d9cfe162a26c83ed98)
- [Edgeless copilot source tree](https://github.com/toeverything/AFFiNE/tree/26c515e050211269e911f7d9cfe162a26c83ed98/blocksuite/affine/blocks/edgeless/src/components/copilot)
- [Copilot actions](https://github.com/toeverything/AFFiNE/blob/26c515e050211269e911f7d9cfe162a26c83ed98/packages/frontend/core/src/blocksuite/ai/config/actions-config.ts)
- [Maintainer location evidence](https://github.com/toeverything)
