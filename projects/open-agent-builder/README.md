# Open Agent Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Open Agent Builder is 01.AI's visual editor for constructing an agent as a typed control graph and materializing that graph into runnable code.

## Control nodes carry runtime meaning

Start and end nodes join agents, file search, guardrails, conditional branches, loops, state assignment, transforms, MCP calls, and user approval. These types encode execution semantics; moving or reconnecting them changes the program rather than only its documentation.

## Versions bridge canvas and generated code

Workflows are stored in a local JSON database with version records. A generator translates the selected graph into code, while the editor continues to hold layout and node configuration. This creates two related authorities: the versioned visual definition for iteration and generated source for downstream execution or inspection.

## One filename exposes a real portability limit

The Git object tree is inspectable, but a tracked filename containing a colon prevents a normal checkout on Windows. That does not erase the implementation evidence, yet it means the published revision is not cross-platform reproducible without path repair. Runtime correctness and provider behavior were not inferred from UI screenshots alone.

## Pinned evidence

- Repository: [01-ai/open-agentkit-builder](https://github.com/01-ai/open-agentkit-builder)
- Inspected Git object tree: [`8ec24962f17bbfb8829cebfc702791b502dea3b4`](https://github.com/01-ai/open-agentkit-builder/tree/8ec24962f17bbfb8829cebfc702791b502dea3b4)
- Immutable revision: [commit `8ec2496`](https://github.com/01-ai/open-agentkit-builder/commit/8ec24962f17bbfb8829cebfc702791b502dea3b4)
