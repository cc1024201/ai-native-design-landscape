# ComfyUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ComfyUI is the native workflow host beneath several separately counted agent products. Its design artifact is a directed node graph: model loaders conditioning samplers media transforms and outputs remain visible and rewritable instead of collapsing into a single generation request.

## The graph is both editor state and executable program

At commit [`27bca654eb9a70237d93f56a6ea336ab55f8925d`](https://github.com/Comfy-Org/ComfyUI/tree/27bca654eb9a70237d93f56a6ea336ab55f8925d), [`execution.py`](https://github.com/Comfy-Org/ComfyUI/blob/27bca654eb9a70237d93f56a6ea336ab55f8925d/execution.py) evaluates the prompt graph by node dependencies and returns outputs keyed to the originating execution. [`server.py`](https://github.com/Comfy-Org/ComfyUI/blob/27bca654eb9a70237d93f56a6ea336ab55f8925d/server.py) exposes queue history object metadata and event channels used by the visual client and external tools.

Blueprint JSON and workflow templates preserve wiring plus configurable widget values. Subgraphs let authors package a reusable part of that graph; asset and model managers connect the saved program to local source material. Images videos audio and 3D files are run outputs. The workflow graph and its referenced environment are the reusable authority.

## Local and cloud are deployment variants

Comfy Cloud changes execution and account ownership but opens the same workflow on an editable ComfyUI canvas. This census counts that managed service as a deployment variant rather than inventing a second graph format. Official MCP and In-App Agent are separate records because they define materially different agent interfaces over the host.

## Evidence

- [Pinned source tree](https://github.com/Comfy-Org/ComfyUI/tree/27bca654eb9a70237d93f56a6ea336ab55f8925d)
- [Workflow blueprints](https://github.com/Comfy-Org/ComfyUI/tree/27bca654eb9a70237d93f56a6ea336ab55f8925d/blueprints)
- [First-party workflow concepts](https://docs.comfy.org/essentials/core-concepts/workflow)
