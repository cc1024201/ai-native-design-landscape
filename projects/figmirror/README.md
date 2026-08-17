# FigMirror

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FigMirror recreates the visual language of a reference scientific figure using a user's data, while preserving an editable Matplotlib program and camera-ready PDF. It is a measured visual matching loop rather than image generation by resemblance alone.

## Drawer and reviewer preserve both progress and constraints

A Drawer renders executable plotting code with grounded measurements. A separate Reviewer compares the candidate with the reference, returns a score, revision checklist and a preserve list. The preserve list accumulates across iterations to prevent already-correct visual properties from drifting. Three-dimensional cases add checks for camera, surfaces, lighting and geometry.

The browser workspace records uploads, previews and iteration history, but the editable Python script is the durable authority. Rendered images and audit JSON make each revision inspectable; PDF is the publication output.

## Evidence

- [Pinned repository](https://github.com/VILA-Lab/FigMirror/tree/8e191513f715c5eacc4e53f6102121b18b072f5c)
- [Codex FigMirror skill](https://github.com/VILA-Lab/FigMirror/blob/8e191513f715c5eacc4e53f6102121b18b072f5c/.codex/skills/figmirror/SKILL.md)
- [Reviewer contract](https://github.com/VILA-Lab/FigMirror/blob/8e191513f715c5eacc4e53f6102121b18b072f5c/.codex/skills/figmirror/references/reviewer.md)
- [Iteration runner](https://github.com/VILA-Lab/FigMirror/blob/8e191513f715c5eacc4e53f6102121b18b072f5c/scripts/figcopy_run.py)
