# 3DCodeBench

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

3DCodeBench evaluates whether models and coding agents can author executable Blender 5.0 Python for text-to-3D and image-to-3D tasks. It is counted as a visual verification product because it packages runnable task execution, native rendering and multiple geometry/appearance judgments—not because a benchmark spreadsheet alone is Design.

## One script is tested as code, shape and image

The runner executes generated Blender programs, exports assets and creates standardized multiview renders. Metrics separately score executability, image/text similarity, shape distance and failure taxonomy; optional LLM judges see code or rendered evidence under committed prompts. Agent adapters make the same tasks runnable through Codex, Claude, Gemini and other systems.

Generated Blender Python is the reproducible candidate artifact. Blender renders and GLB/mesh exports ground evaluation in actual execution, while the benchmark records scores rather than becoming an authoring canvas.

## Evidence

- [Pinned repository](https://github.com/gaoypeng/3dcodebench/tree/42c7780ed3fcbd466f17f058f62e7996233777f7)
- [Blender renderer](https://github.com/gaoypeng/3dcodebench/blob/42c7780ed3fcbd466f17f058f62e7996233777f7/core/render.py)
- [Image similarity metric](https://github.com/gaoypeng/3dcodebench/blob/42c7780ed3fcbd466f17f058f62e7996233777f7/metrics/image_similarity.py)
- [Coding-agent task adapters](https://github.com/gaoypeng/3dcodebench/tree/42c7780ed3fcbd466f17f058f62e7996233777f7/tasks/coding_agent)
