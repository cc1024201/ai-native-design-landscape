# Editable Presentation Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Editable Presentation Studio is a standalone agent skill for authoring a fixed HTML/CSS deck and compiling it into hybrid editable PowerPoint or native Google Slides. The central question it solves is which visual regions can be safely reconstructed as native objects without lying about fidelity.

## A manifest reconciles intent with exported objects

The agent first writes canonical HTML with stable object IDs and an explicit native/fallback policy. [`export-html-editable-deck.mjs`](https://github.com/coille02/html-to-editable-pptx/blob/91939c9740ab7d0860a65326e97d6a6b734ab4f7/scripts/export-html-editable-deck.mjs) measures the rendered DOM in Chromium, emits PPTX objects and records a manifest joining source IDs to output objects.

[`qa-export-manifest.mjs`](https://github.com/coille02/html-to-editable-pptx/blob/91939c9740ab7d0860a65326e97d6a6b734ab4f7/scripts/qa-export-manifest.mjs) and package QA enforce native text coverage and visible-text safety. The Google Slides route produces a native operation plan, executes it through the host API and reads back thumbnails for comparison. Raster fallback is declared per region instead of being presented as native editability.

No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/coille02/html-to-editable-pptx/tree/91939c9740ab7d0860a65326e97d6a6b734ab4f7)
- [Native artifact contract](https://github.com/coille02/html-to-editable-pptx/blob/91939c9740ab7d0860a65326e97d6a6b734ab4f7/skills/create-editable-presentations/references/native-contract.md)
- [Google Slides plan exporter](https://github.com/coille02/html-to-editable-pptx/blob/91939c9740ab7d0860a65326e97d6a6b734ab4f7/scripts/export-html-google-slides-plan.mjs)
