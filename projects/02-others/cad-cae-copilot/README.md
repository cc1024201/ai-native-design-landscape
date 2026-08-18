# CAD CAE Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD CAE Copilot defines an auditable `.aieng` engineering package rather than making a chat transcript the project record. Semantic intent, exact geometry, topology references, solver evidence and approvals travel together.

## The package is an engineering decision record

[`package_contract.md`](https://github.com/armpro24-blip/cad-cae-copilot/blob/b476f92f8a7a1d7db9b2bfd5e2a1ab98ea99400c/docs/package_contract.md) specifies the package boundary. Schemas cover object registries, stable topology maps, parameter edits, patch proposals, visual annotations, tool traces and NAFEMS-style verification reports. Exact shape state is therefore joined with claims about why a change is acceptable.

```text
task specification -> Shape IR + exact geometry + stable topology pointers
-> proposed patch and diff -> human approval -> CAD/CAE execution
-> solver evidence + claim map + provenance inside .aieng
```

This proposal/approval/evidence path is the decisive mechanism; the legacy FreeCAD MCP subtree is supporting history, not a second counted product. No reliable first-party maintainer location was found.

## Evidence

- [Pinned repository](https://github.com/armpro24-blip/cad-cae-copilot/tree/b476f92f8a7a1d7db9b2bfd5e2a1ab98ea99400c)
- [Package contract](https://github.com/armpro24-blip/cad-cae-copilot/blob/b476f92f8a7a1d7db9b2bfd5e2a1ab98ea99400c/docs/package_contract.md)
- [Topology map schema](https://github.com/armpro24-blip/cad-cae-copilot/blob/b476f92f8a7a1d7db9b2bfd5e2a1ab98ea99400c/aieng/schemas/topology_map.schema.json)
- [Patch proposal schema](https://github.com/armpro24-blip/cad-cae-copilot/blob/b476f92f8a7a1d7db9b2bfd5e2a1ab98ea99400c/aieng/schemas/patch_proposal.schema.json)
