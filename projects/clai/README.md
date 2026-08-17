# Clai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Clai is a prompt-to-physical-product workspace. It carries a concept from structured brief and reference image through a generated GLB product model, packaging panels and export. Its Design loop is broader than 3D generation because the packaging dieline is directly adjustable and each product revision remains addressable.

## A saved project joins the product and packaging states

[`project_state.py`](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/backend/app/models/project_state.py) defines one persisted snapshot with product state, generation status, packaging state and last route. [`project_store.py`](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/backend/app/services/project_store.py) stores and indexes those snapshots in Redis with the repository's file fallback.

Product generation is a staged pipeline rather than a single undifferentiated call. [`product_model_store.py`](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/backend/app/services/product_model_store.py) preserves model outputs by product and version; a chat edit creates a later result without erasing the chosen earlier one.

## Packaging is the human correction surface

[`dieline-editor.tsx`](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/frontend/components/dieline-editor.tsx) exposes dimensions and panels instead of treating packaging as a flattened render. The product and package viewers then compose the selected GLB and textures, while [`file_export.py`](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/backend/app/services/file_export.py) materializes handoff files. Manufacturing readiness remains an aspiration; the current evidence supports an early working design workspace rather than a substitute for parametric CAD.

## Evidence

- [Pinned repository](https://github.com/ericpungholee/Clai/tree/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146)
- [Product pipeline](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/backend/app/services/product_pipeline.py)
- [3D model viewer](https://github.com/ericpungholee/Clai/blob/f773ab4fbc58c7e53bbc4ea987ac38ef20c14146/frontend/components/ModelViewer.tsx)
