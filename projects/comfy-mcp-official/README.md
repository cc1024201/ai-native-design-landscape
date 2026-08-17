# Comfy MCP

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Comfy MCP is Comfy's first-party external-agent product with two explicitly documented connections. The cloud server reaches Comfy Cloud accounts and GPUs over remote HTTP; the open local server drives a user-owned ComfyUI installation over stdio. They share a product name and workflow vocabulary but not an execution queue.

## Cloud mode owns saved workflow lifecycle

The [official tool contract](https://docs.comfy.org/agent-tools/mcp) exposes template model and node discovery before execution. A custom workflow can be submitted then saved to the account; updating it creates a recoverable version. The agent can share it or request a URL that opens the exact workflow on the Comfy Cloud canvas for human inspection and correction. Output URLs are delivery evidence and do not replace the saved graph.

## Local mode is an observable CLI adapter

The local implementation is pinned at [`610b691b0d5827fa7e77413934241e6781a42e3f`](https://github.com/Comfy-Org/comfy-mcp/tree/610b691b0d5827fa7e77413934241e6781a42e3f). [`server.py`](https://github.com/Comfy-Org/comfy-mcp/blob/610b691b0d5827fa7e77413934241e6781a42e3f/src/comfy_mcp/server.py) declares the MCP surface and [`target.py`](https://github.com/Comfy-Org/comfy-mcp/blob/610b691b0d5827fa7e77413934241e6781a42e3f/src/comfy_mcp/target.py) resolves the actual Comfy target. Tools invoke `comfy-cli` with structured JSON envelopes so discovery validation execution and failure facts come from the live installation rather than a stale hard-coded catalog.

The cloud server is not open source in this repository, which is why the cross-mode product remains architecture-level despite strong local source evidence.

## Evidence

- [Official Agent Tools comparison](https://docs.comfy.org/agent-tools)
- [Pinned Local Comfy MCP source](https://github.com/Comfy-Org/comfy-mcp/tree/610b691b0d5827fa7e77413934241e6781a42e3f)
- [Comfy Skills distribution](https://github.com/Comfy-Org/comfy-skills/tree/ab5a0cafdf1bd4bf6cbe7e9ddddf93bd4faf40b9)
