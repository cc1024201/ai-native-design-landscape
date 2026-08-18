# OpenSCAD Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenSCAD Agent is a Claude Code environment for designing printable 3D objects from natural language. It makes the source/render/export distinction explicit: versioned OpenSCAD code owns the model, PNGs support visual correction, and STL is a validated production handoff.

## Versioned source makes visual correction recoverable

The main skill writes numbered `.scad` revisions and renders each to PNG. The user and agent compare previews, refine dimensions or topology and retain earlier source variants. A separate export skill converts the selected revision to STL and checks for non-manifold or otherwise unprintable geometry.

The screenshot loop gives the agent eyes, but visual plausibility does not become the engineering authority. OpenSCAD source remains editable and reproducible; STL is accepted only after geometry validation.

## Evidence

- [Pinned repository](https://github.com/iancanderson/openscad-agent/tree/d3f3ebf90ec7c743c5b680ff909085f4e780c331)
- [Ordinary workflow](https://github.com/iancanderson/openscad-agent/blob/d3f3ebf90ec7c743c5b680ff909085f4e780c331/README.md)
- [Agent instructions](https://github.com/iancanderson/openscad-agent/blob/d3f3ebf90ec7c743c5b680ff909085f4e780c331/CLAUDE.md)
- [Maintainer profile](https://github.com/iancanderson)
