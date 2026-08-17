# PPT as Code

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PPT as Code is a presentation skill and visual workbench built around staged artifacts rather than direct generation into an opaque deck. It treats HTML as a delivery projection until a richer upstream model exists, and routes edits back to the earliest authoritative artifact that can express them.

## The workbench changes the authority hierarchy

Brief, story, style and visual-plan documents feed `deck_source.json`, while [`deck-model-contract.md`](https://github.com/Russell-cell/PPT-as-code/blob/3f0cfce71fb7e62958ba796653c34aeba484fc59/references/deck-model-contract.md) defines `deck_model.json` as the editable canvas source. The runnable [`workbench/index.html`](https://github.com/Russell-cell/PPT-as-code/blob/3f0cfce71fb7e62958ba796653c34aeba484fc59/workbench/index.html) supports object selection, movement, resizing, snapping and inspector edits, then projects the model into HTML.

HTML Direct Mode can instead edit a compatible built deck and export revised source HTML with stable markers. PPTX is a final hybrid export described by a manifest; it is not silently promoted over the approved model or HTML. Confirmation gates before structure, style and static-HTML approval are part of the artifact protocol rather than UI decoration.

This is independent from the same maintainer's simpler PPT Design Prompt record because the workbench, model contracts and export skill create a separate runnable authority. No reliable region evidence was found.

## Evidence

- [Pinned repository](https://github.com/Russell-cell/PPT-as-code/tree/3f0cfce71fb7e62958ba796653c34aeba484fc59)
- [Deck-source contract](https://github.com/Russell-cell/PPT-as-code/blob/3f0cfce71fb7e62958ba796653c34aeba484fc59/references/deck-source-contract.md)
- [PPTX manifest contract](https://github.com/Russell-cell/PPT-as-code/blob/3f0cfce71fb7e62958ba796653c34aeba484fc59/companion-skills/pptx-export-for-ppt-as-code/references/manifest-contract.md)
