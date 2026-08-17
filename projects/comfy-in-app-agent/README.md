# Comfy In-App Agent

> Research status: **Architecture-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Comfy In-App Agent is a private-alpha chat experience inside Comfy Cloud. Unlike external MCP clients it is co-located with the native node canvas: a user prompts in the app and watches the agent build or edit the visible workflow graph.

## The current evidence is narrow but decisive

The [first-party alpha page](https://docs.comfy.org/agent-tools/in-app-agent) confirms both mutation verbs—build and edit—and identifies the graph as the target. The [Agent Tools comparison](https://docs.comfy.org/agent-tools) distinguishes it from the cloud and local MCP connections by client ownership setup GPU location and visual review: the in-app product needs no separate agent client and is intended for users who want to see the canvas and check workflows visually.

This is enough to establish a distinct interaction model but not enough to infer prompt planning permissions history semantics or implementation details. Those remain unknown until public access or deeper documentation appears. ComfyUI's saved graph is still the artifact authority; the record counts the agent surface rather than duplicating the host.

## Evidence

- [Comfy In-App Agent private alpha](https://docs.comfy.org/agent-tools/in-app-agent)
- [Official Agent Tools overview](https://docs.comfy.org/agent-tools)
- [Related Comfy MCP contract](https://docs.comfy.org/agent-tools/mcp)
