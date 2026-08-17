# Deploy on AWS architecture diagram skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

The official Deploy on AWS plugin includes a dedicated architecture-diagram skill that turns a repository or architecture brief into an editable, machine-checked draw.io document. It is the maintained successor surfaced by the deprecated AWS Diagram MCP listing.

## Editable XML is the canonical deliverable

Pinned revision: `34afdf5005325f17d5da2d1443b87f27a53b0a20`.

The agent must write a new `.drawio` file under the target repository's `docs/` directory. That XML remains editable and source-controlled; browser preview and optional PNG, SVG or PDF files are projections. The protocol therefore preserves design authority in the user's workspace instead of only returning a rendered image.

## Generation is constrained by an AWS visual grammar

The skill specifies official AWS4 icon namespaces, category containers, service-icon dimensions, edge attachment rules, titles, numbered flow steps and a legend. It can inspect infrastructure-as-code or map mixed non-AWS technologies through a separate icon vocabulary. These constraints make the output an architecture model with visual semantics, not unconstrained image generation.

## Validation is part of rendering

Post-processing fixes nesting, colors and step-badge overlap. A validator checks XML structure, identifiers, connections and AWS4 shape references before the workflow creates a draw.io preview URL. Requested static exports happen only after validation, making errors observable before delivery.

## Successor provenance

The `awslabs/mcp` migration notice is retained as discovery provenance, not as a second product. It points users from the retired diagram server to this skill in `awslabs/agent-plugins`; the current repository supplies the source-level evidence.

## Pinned evidence

- [Repository](https://github.com/awslabs/agent-plugins)
- [Architecture-diagram generation contract](https://github.com/awslabs/agent-plugins/blob/34afdf5005325f17d5da2d1443b87f27a53b0a20/plugins/deploy-on-aws/skills/aws-architecture-diagram/SKILL.md)
- [Diagram validator](https://github.com/awslabs/agent-plugins/blob/34afdf5005325f17d5da2d1443b87f27a53b0a20/plugins/deploy-on-aws/scripts/lib/validate_drawio.py)
- [Editable preview URL generator](https://github.com/awslabs/agent-plugins/blob/34afdf5005325f17d5da2d1443b87f27a53b0a20/plugins/deploy-on-aws/scripts/lib/drawio_url.py)
- [Deprecated MCP migration notice](https://github.com/awslabs/mcp/blob/main/src/aws-diagram-mcp-server/README.md)
