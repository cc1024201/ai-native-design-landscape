# Vibe Automation Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vibe Automation Studio is an English-and-Arabic workflow builder whose VibeBot can construct or run the current visual automation through structured actions.

## The assistant returns operations rather than a diagram description

An OpenRouter-backed prompt asks VibeBot for JSON that distinguishes graph-building actions from run actions. Those results target the current nodes and edges, allowing the same automation to be inspected and manually revised after a conversational change.

## The backend gives the graph consequences

Thirteen node types execute through the backend, and the frontend polls logs and status as work progresses. The design loop is therefore request, graph mutation, execution evidence, and correction—not merely prompt-to-flowchart rendering.

## One product has two identical repositories

The canonical BORHOM repository predates `NGPTechWorld/NGP-Automation`; both resolve to tree `f1d37be4e1489a624daf0aef70628eba2b2bdf61`. The later copy is not counted as another product or team definition. Persistence in this compact implementation is less developed than its execution path, so durable version-history claims are not made.

## Pinned evidence

- Canonical repository: [BORHOMJKJ0/vibe-automation](https://github.com/BORHOMJKJ0/vibe-automation)
- Inspected canonical source: [`4a94272f1b4118cddc61e4e5df671b07903510b3`](https://github.com/BORHOMJKJ0/vibe-automation/tree/4a94272f1b4118cddc61e4e5df671b07903510b3)
- Identical later repository: [`NGPTechWorld/NGP-Automation@2e546a1039c58c17b8a72275192e4ae72caca3e3`](https://github.com/NGPTechWorld/NGP-Automation/tree/2e546a1039c58c17b8a72275192e4ae72caca3e3)
