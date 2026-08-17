# Nature Figure Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Nature Figure Studio combines a desktop scientific-figure workspace, an optional OpenAI recommendation panel and an installable agent skill. Its distinctive authority is an editable Origin project when Origin automation is available, with an open cross-platform visual workspace for other cases.

## Data and recipe remain upstream of the render

Users import structured data, choose a journal preset, tune chart settings and export. In the Electron build the main process sends current data context to the Responses API and receives structured JSON recommendations that the user can apply. Recommendations do not mutate the figure until applied.

On Windows, `origin_driver.py` can inspect data, preview a reproducible job, drive Origin/OriginPro, export SVG/PDF/raster formats and save `.opju` for later manual refinement. The data, recipe and Origin project carry working authority; exported images are delivery projections.

## Platform ceiling

Origin automation depends on a licensed desktop installation and OriginLab's Python bridge. macOS and Linux can use the visual app and skill without that native project path, so editability and reproducibility differ by runtime rather than being silently generalized.

- [Pinned Nature Figure Studio revision](https://github.com/chenyuanfan0307/nature-figure-studio/tree/d4fc98e311db428b2787d30c897d0a0dac0150b1)
- [Desktop and Origin workflow](https://github.com/chenyuanfan0307/nature-figure-studio/blob/d4fc98e311db428b2787d30c897d0a0dac0150b1/README.md)
- [Agent skill](https://github.com/chenyuanfan0307/nature-figure-studio/blob/d4fc98e311db428b2787d30c897d0a0dac0150b1/skills/nature-figure-master/SKILL.md)
- [Origin driver](https://github.com/chenyuanfan0307/nature-figure-studio/blob/d4fc98e311db428b2787d30c897d0a0dac0150b1/skills/nature-figure-master/scripts/origin_driver.py)
