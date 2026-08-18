# Cloud Visualizer Pro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Cloud Visualizer Pro turns cloud intent and infrastructure context into an editable Azure architecture graph, then connects that graph to infrastructure-as-code outputs.

## Grounding before graph generation

The backend uses Microsoft Agent Framework and MCP-facing infrastructure context to build component and relationship proposals. Those proposals are normalized into React Flow nodes and edges rather than rendered as a static image. The canvas is consequently a reviewable architecture model.

## Design and materialization remain distinct

The same architecture can lead to Bicep or Terraform output, but the generated IaC is a downstream materialization—not proof that the visual graph has already been deployed. The source keeps the diagramming and generation boundaries visible so users can inspect topology before infrastructure side effects.

## Honest fallback boundary

Mock data exists for situations where infrastructure services are unavailable; the code distinguishes that path instead of presenting it as live discovery. This matters for evidence: the repository proves the control path and editor, while any claimed match to a real Azure estate requires authenticated runtime verification.

## Pinned evidence

- Repository: [error505/azure-cloud-ai-visualizer](https://github.com/error505/azure-cloud-ai-visualizer)
- Inspected implementation: [`6b9e50e8f6e1e116644aafdd8f492ad041060149`](https://github.com/error505/azure-cloud-ai-visualizer/tree/6b9e50e8f6e1e116644aafdd8f492ad041060149)
- Immutable revision: [commit `6b9e50e`](https://github.com/error505/azure-cloud-ai-visualizer/commit/6b9e50e8f6e1e116644aafdd8f492ad041060149)
