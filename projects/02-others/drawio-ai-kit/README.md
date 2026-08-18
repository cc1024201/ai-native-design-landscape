# drawio-ai-kit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

drawio-ai-kit is an orchestration and validation framework for cloud and technical diagrams. It asks the agent to declare topology and containment, then computes coordinates, applies canonical stencil identities and audits the resulting Draw.io XML.

## Logical topology is compiled into editable geometry

Catalog files are the source of truth for AWS, Azure, GCP and other stencil names and colors. A layout engine turns pipeline, hierarchy, network, hub-spoke, mesh, sequence and hybrid structures into positioned graph objects; a validator rejects invented stencils and rule violations. The CLI can render the `.drawio` file to PNG so the agent can inspect and rectify visible defects.

The project removed its earlier MCP server at version 1.0.0 in favor of a local CLI plus thin domain skills. That transition does not change the artifact boundary: editable Draw.io XML remains authoritative, while PNG is disposable visual evidence.

## Evidence

- [Pinned repository](https://github.com/sparklabx/drawio-ai-kit/tree/66c614b28e8f008e8bcea15df99f54bd7f298a02)
- [Layout engine](https://github.com/sparklabx/drawio-ai-kit/blob/66c614b28e8f008e8bcea15df99f54bd7f298a02/src/layout-engine.mjs)
- [AWS stencil catalog](https://github.com/sparklabx/drawio-ai-kit/blob/66c614b28e8f008e8bcea15df99f54bd7f298a02/catalog/aws.json)
- [Migration and visual-check contract](https://github.com/sparklabx/drawio-ai-kit/blob/66c614b28e8f008e8bcea15df99f54bd7f298a02/README.md)
