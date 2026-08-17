# DiPeO

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DiPeO makes a diagram executable: its nodes represent people/agents, tools, and organizational flow, and the runtime can instantiate that graph as a working multi-agent system.

## YAML is both design and program

The CLI can turn a natural-language request into a `.yaml` graph of typed nodes, positions, connections, and configuration. The web editor can then refine that graph. Because the runtime reads the same structure, visual organization is not merely documentation of code elsewhere.

## The organization becomes observable

Running the diagram creates the defined agents and lets users inspect how work moves through them in real time. GraphQL and MCP edges expose state and capabilities to other clients. This makes organization design an executable engineering artifact.

## Local execution changes the risk, not the need for review

The project emphasizes local operation, avoiding a mandatory hosted control plane. A syntactically valid graph can still grant tools too broadly, create loops, or encode an ineffective division of labor. Users must review both topology and runtime permissions before `--and-run`.

## Pinned evidence

- Repository: [sorryhyun/DiPeO](https://github.com/sorryhyun/DiPeO)
- Inspected runtime and editor: [`120beafac344a48d2932e0faebda11bc510e6172`](https://github.com/sorryhyun/DiPeO/tree/120beafac344a48d2932e0faebda11bc510e6172)
- Immutable revision: [commit `120beaf`](https://github.com/sorryhyun/DiPeO/commit/120beafac344a48d2932e0faebda11bc510e6172)
