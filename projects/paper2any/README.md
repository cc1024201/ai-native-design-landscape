# Paper2Any

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Paper2Any is the open-source scientific-visual authoring project, distinct from the separately counted commercial Paper to Any Studio. It turns papers into diagrams, technical routes, plots and decks, then exposes structured editing rather than stopping at generated images.

## Several artifact authorities share one workflow graph

The backend composes specialized workflows such as [`wf_paper2ppt_parallel_consistent_style.py`](https://github.com/OpenDCAI/Paper2Any/blob/1ca1f658e811dcec4f9e3d951ce8dacd344d050c/dataflow_agent/workflow/wf_paper2ppt_parallel_consistent_style.py) and paper-to-draw.io generation. The frontend's [`WorkflowCanvas.tsx`](https://github.com/OpenDCAI/Paper2Any/blob/1ca1f658e811dcec4f9e3d951ce8dacd344d050c/frontend-workflow/src/components/WorkflowCanvas.tsx) owns the executable workflow graph, while output-specific editors own the resulting diagram or deck.

For presentations, the current path combines outline-assisted generation, gallery review, canvas edits and paper/AI-image insertion. HTML can compile to editable PPTX, and ONLYOFFICE is an optional native-office editing projection. [`test_paper2ppt_mask_edit.py`](https://github.com/OpenDCAI/Paper2Any/blob/1ca1f658e811dcec4f9e3d951ce8dacd344d050c/tests/test_paper2ppt_mask_edit.py) and committed editable PPTX fixtures make this more than a README-only promise.

The project therefore does not have one universal “source of truth”: workflow definitions govern generation; Draw.io or editable deck structures govern continued authoring; exported media are delivery artifacts. No reliable team-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/OpenDCAI/Paper2Any/tree/1ca1f658e811dcec4f9e3d951ce8dacd344d050c)
- [Editable PPT and ONLYOFFICE contract](https://github.com/OpenDCAI/Paper2Any/blob/1ca1f658e811dcec4f9e3d951ce8dacd344d050c/docs/onlyoffice-editable-ppt.md)
- [Inline Draw.io editor](https://github.com/OpenDCAI/Paper2Any/blob/1ca1f658e811dcec4f9e3d951ce8dacd344d050c/frontend-workflow/src/components/DrawioInlineEditor.tsx)
