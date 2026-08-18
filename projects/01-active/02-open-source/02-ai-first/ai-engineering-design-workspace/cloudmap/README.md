# CloudMap

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

CloudMap is an AWS architecture designer in transition between AI integrations. Across the inspected lineage, a Jarvis assistant reads and changes a React Flow topology, explains trade-offs, and can materialize AWS CDK.

## The graph carries architecture state

AWS services, connections, positions, and configuration live as structured canvas state. Natural-language intents such as add, remove, connect, replace, scale, and secure are parsed into changes to that state. Architecture rationale and cost/best-practice analysis are derived views.

## Model integration changed without changing the product identity

Earlier code used Claude-specific routes; the canonical CloudMap repository documents Cohere Command and also contains Gemini-oriented work. The newer pinned tree temporarily disables or repairs some generation paths. These are lifecycle changes within one continuous CloudMap product, not separate products per repository or provider.

## CDK is a promoted output

CDK generation translates the reviewed graph toward infrastructure code. It does not deploy AWS resources or guarantee Well-Architected compliance. Versions and saved diagrams support design recovery, while deployment review remains external.

## Pinned evidence

- Canonical repository: [ZeradamK/claudio_demo_v0.2](https://github.com/ZeradamK/claudio_demo_v0.2)
- Inspected canonical tree: [`72e61e7e9318b171e36a0fd76aa6b65a04751bbf`](https://github.com/ZeradamK/claudio_demo_v0.2/tree/72e61e7e9318b171e36a0fd76aa6b65a04751bbf)
- Earlier same-lineage implementation: [`claudio2.2@ebf8ea82f9a3f7e1142c4db5871a511348481d26`](https://github.com/ZeradamK/claudio2.2/tree/ebf8ea82f9a3f7e1142c4db5871a511348481d26)
