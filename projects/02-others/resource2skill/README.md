# Resource2Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Resource2Skill is not another gallery of prompts. Microsoft defines a general runtime that distils tutorials, reference artifacts and code into executable skill libraries, then lets an agent retrieve and compose those skills while operating real Web, PowerPoint, Excel, Blender and audio tools.

## The learned resource becomes operational memory

Two stores separate explanation from execution: `skills_wiki/<domain>` exposes browseable records and `skills_library/<domain>` carries runnable assets. At task time the agent searches this material, selects a small set of references and invokes a domain MCP server. The unusual product claim is therefore not merely generation; human-created examples become addressable operational memory.

The output authority varies by domain. A web task resolves into files and a browser render, PowerPoint into an editable PPTX, and Blender into scene state. The runtime and generated project are authoritative; skill records guide construction but do not themselves prove artifact quality.

## A framework boundary, not a PPT Master duplicate

The PowerPoint route can use PPT Master as a backend, but Resource2Skill adds the distillation, retrieval and multi-domain runtime around it. That makes it an upstream agent platform with an embedded presentation implementation, not a second count of PPT Master.

- [Pinned repository](https://github.com/microsoft/Resource2Skill/tree/7f101b4cfe214cc496d085a34efac528a17cc375)
- [Runtime entry point](https://github.com/microsoft/Resource2Skill/blob/7f101b4cfe214cc496d085a34efac528a17cc375/cli.py)
- [Pinned operating contract](https://github.com/microsoft/Resource2Skill/blob/7f101b4cfe214cc496d085a34efac528a17cc375/README.md)
- [Microsoft location evidence](https://github.com/microsoft)
