# DCC-MCP ComfyUI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP ComfyUI exposes a ComfyUI workflow as a validated asynchronous job rather than reducing the product to a text-to-image endpoint. The native workflow JSON graph remains the editable recipe and ComfyUI remains the execution authority.

## Validate, submit, correlate, retrieve

[`validate_workflow.py`](https://github.com/dcc-mcp/dcc-mcp-comfyui/blob/93c8c4da92b5ea3f3fb940f2f081446b979e59d2/src/dcc_mcp_comfyui/skills/comfyui-workflow/scripts/validate_workflow.py) checks graph structure before work is sent. [`submit_workflow.py`](https://github.com/dcc-mcp/dcc-mcp-comfyui/blob/93c8c4da92b5ea3f3fb940f2f081446b979e59d2/src/dcc_mcp_comfyui/skills/comfyui-workflow/scripts/submit_workflow.py) crosses the REST/WebSocket bridge and returns job identity; status queries and artifact retrieval keep outputs attached to that run.

This separation matters for iterative Design: changing nodes or parameters produces a new graph execution that can be compared with prior artifacts. The adapter does not invent a second hidden generation state and does not treat a network acknowledgement as a finished image.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-mcp-comfyui/tree/93c8c4da92b5ea3f3fb940f2f081446b979e59d2)
- [Workflow Skill](https://github.com/dcc-mcp/dcc-mcp-comfyui/blob/93c8c4da92b5ea3f3fb940f2f081446b979e59d2/src/dcc_mcp_comfyui/skills/comfyui-workflow/SKILL.md)
- [Artifact retrieval](https://github.com/dcc-mcp/dcc-mcp-comfyui/blob/93c8c4da92b5ea3f3fb940f2f081446b979e59d2/src/dcc_mcp_comfyui/skills/comfyui-workflow/scripts/get_artifact.py)
