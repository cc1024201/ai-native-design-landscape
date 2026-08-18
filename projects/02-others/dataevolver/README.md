# DataEvolver

> Research status: **Source-level** · Lifecycle: **active pre-1.0** · Last reviewed: **2026-08-12**

DataEvolver is a visual construction system whose deliverable is a training-ready multimodal dataset. It composes image/video/3D generation, inserts reconstructed assets into Blender scenes and iteratively repairs lighting, pose, environment and materials from VLM critique.

## A bounded action space closes the render–review–repair loop

[`vlm_review_stage.py`](https://github.com/PRIS-CV/DataEvolver/blob/2894fab9a6866adb21588982939cf24507e45a6f/src/dataevolver/annotation/vlm_review_stage.py) turns free-form visual findings into structured decisions. [`scene_action_space.json`](https://github.com/PRIS-CV/DataEvolver/blob/2894fab9a6866adb21588982939cf24507e45a6f/configs/scene_action_space.json) bounds the allowed repairs, and [`feedback_apply.py`](https://github.com/PRIS-CV/DataEvolver/blob/2894fab9a6866adb21588982939cf24507e45a6f/src/dataevolver/agents/feedback_apply.py) applies them with anti-oscillation controls. Multimodal workflow schemas preserve generator inputs and validation results.

Blender scenes are the spatial construction authority; RGB, masks, depth, normals, metadata and split manifests form the delivered dataset authority. The project is included because it releases an independently usable visual authoring/correction system, not merely a research method or paper.

## Evidence

- [Pinned repository](https://github.com/PRIS-CV/DataEvolver/tree/2894fab9a6866adb21588982939cf24507e45a6f)
- [Multimodal review loop](https://github.com/PRIS-CV/DataEvolver/blob/2894fab9a6866adb21588982939cf24507e45a6f/src/dataevolver/workflows/multimodal/vlm_review.py)
- [First-party team statement: China](https://github.com/PRIS-CV/DataEvolver/blob/2894fab9a6866adb21588982939cf24507e45a6f/README.md)
