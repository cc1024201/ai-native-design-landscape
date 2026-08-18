# No-Code ADK Interface

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

No-Code ADK Interface is an independent form-driven authoring shell for Google ADK. Unlike Google's graph-oriented ADK Web, this package compiles a structured agent form into a runnable filesystem project.

## The form schema is the authoring contract

[app.py](https://github.com/abhishekkumar35/google-adk-nocode/blob/e73b98f32806d2d4fa464e459177a568292d5ec9/src/google/adk/nocode/app.py) defines model, instruction, tools, provider, API/client generation and nested sub-agent configuration. The browser client loads those options and submits one AgentConfig object.

## Create means materialize source

The create endpoint writes an agent directory containing generated Python, optional FastAPI service, JavaScript or TypeScript clients and documentation. The run endpoint imports that generated project and invokes its root agent. Generated files, not a hidden hosted record, become the durable and executable authority.

## Adapter boundary

The project reuses Google ADK as runtime and can target Ollama, but its authoring UI and code materializer are independently implemented. It is therefore an ecosystem adapter rather than a duplicate copy of ADK Web.

## Pinned evidence

- [Repository](https://github.com/abhishekkumar35/google-adk-nocode)
- [Inspected tree](https://github.com/abhishekkumar35/google-adk-nocode/tree/e73b98f32806d2d4fa464e459177a568292d5ec9)
- [Browser authoring client](https://github.com/abhishekkumar35/google-adk-nocode/blob/e73b98f32806d2d4fa464e459177a568292d5ec9/src/google/adk/nocode/static/js/app.js)
