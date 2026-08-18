# LZBot 5000

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LZBot 5000 is counted for a file-producing architecture workflow, not for a proprietary canvas. It coordinates specialized agents and MCP tools to turn a request into an inspectable bundle of architecture evidence.

## The deliverable is a bundle

The workflow produces source-controlled documents and diagrams rather than hiding the answer in chat. Architecture descriptions, decisions, and visual evidence can be reviewed as files. Their usefulness comes from being diffable and reusable by later agents or humans.

## Orchestration is the implementation

AWS Strands-style agents divide research, architecture, and artifact-production responsibilities. MCP provides external tool edges. The control plane is therefore the agent graph and its file contracts, while Mermaid or other visuals are one output type within a larger governed deliverable.

## Authority and limits

The filesystem is the durable handoff surface; a rendered diagram is derived evidence. The repository demonstrates orchestration and artifact assembly, but it does not prove that recommendations match a live estate or that produced architecture has passed organizational review.

## Pinned evidence

- Repository: [chungos/lzbot-5000](https://github.com/chungos/lzbot-5000)
- Inspected workflow source: [`f3bfdf5e938b0a437fc67575cc6955c8cc27de39`](https://github.com/chungos/lzbot-5000/tree/f3bfdf5e938b0a437fc67575cc6955c8cc27de39)
- Immutable revision: [commit `f3bfdf5`](https://github.com/chungos/lzbot-5000/commit/f3bfdf5e938b0a437fc67575cc6955c8cc27de39)
