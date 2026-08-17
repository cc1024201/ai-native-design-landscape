# VideoCoCo

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

VideoCoCo is a released research implementation for physically consistent video generation. Five agent skills turn an edit instruction into a physical-state plan, Blender simulation code and grayscale proxy video, then formulate and execute a photorealistic restyle.

## The proxy video is an explicit intermediate authority

Blender code encodes motion and physical relationships that are difficult to express in a flat prompt. The rendered proxy preserves that structure; `edit_prompt.txt` defines the mapping into the final appearance. A toy dataset and inference code make the path inspectable, although tuned weights were still being uploaded at the reviewed revision.

The system produces a generated video rather than a timeline editor. Its source-level value is the staged physical artifact graph and executable skills, not a claim of general editing fidelity.

- [Pinned repository](https://github.com/micky-li-hd/VideoCoCo/tree/4afce26a7d012ece8cb3d7931d39117ecf741ade)
- [Physical planner](https://github.com/micky-li-hd/VideoCoCo/blob/4afce26a7d012ece8cb3d7931d39117ecf741ade/skill/physical-state-planner/SKILL.md)
- [Blender implementation contract](https://github.com/micky-li-hd/VideoCoCo/blob/4afce26a7d012ece8cb3d7931d39117ecf741ade/skill/physical-video-blender-implementer/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/micky-li-hd)
