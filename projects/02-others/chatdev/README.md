# ChatDev 2.0 / DevAll

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

ChatDev has evolved from the original role-playing software company into ChatDev 2.0, also presented as DevAll: a visual environment for designing and launching multi-agent workflows across software, research, data visualization, 3D, games, and media tasks.

## YAML and canvas are peer representations

The Vue workbench reads and writes workflow YAML while visual nodes and edges expose agents, models, tools, resources, subgraphs, loops, parallel branches, and human nodes. Validation checks the textual definition before launch, making the graph more than a presentation diagram.

## Runtime topology is explicit

DAG, cycle, parallel, dynamic-edge, and subgraph executors build runtime contexts from the saved workflow. Launch views stream logs and status, while artifact routes and a workspace hook collect files produced by agent teams.

## The lineage is changing, not multiplying

ChatDev 1.0 remains on a legacy branch; 2.0 broadens the product and uses DevAll naming. This census keeps one evolving lineage and marks the transition instead of counting the historical software-company metaphor and current visual studio as two teams.

## Pinned evidence

- Repository: [OpenBMB/ChatDev](https://github.com/OpenBMB/ChatDev)
- Inspected workbench, YAML, graph runtime, human node, launch, and artifact tree: [`4fb2db0ea90375ce1059f44fe03ffbd191a7a169`](https://github.com/OpenBMB/ChatDev/tree/4fb2db0ea90375ce1059f44fe03ffbd191a7a169)
- Immutable revision: [commit `4fb2db0`](https://github.com/OpenBMB/ChatDev/commit/4fb2db0ea90375ce1059f44fe03ffbd191a7a169)
- [Legacy ChatDev 1.0 branch](https://github.com/OpenBMB/ChatDev/tree/chatdev1.0)
