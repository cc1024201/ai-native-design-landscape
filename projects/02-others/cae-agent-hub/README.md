# CAE Agent Hub

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAE Agent Hub is a collection of agent workflows and MCP servers for engineering simulation systems including Abaqus, ANSYS, HyperWorks, CalculiX, LAMMPS and OVITO. The Design artifact here is not a polished image; it is an analysis-ready model, solver setup and inspectable result that constrain an engineering decision.

## Solvers remain the computational authority

The MCP adapters expose real application and solver operations. Skills encode domain workflows such as materials, boundary conditions, meshing and post-processing. Example pipelines export `result_mesh.json`, and the bundled viewer's [`caeProjectStore.js`](https://github.com/Cai-aa/CAE-Agent-Hub/blob/57d04fed3dca8bce010f910a610656836794c8a4/viewer/lib/caeProjectStore.js) loads that structured result for browser inspection.

```text
engineering intent -> domain skill -> solver-specific MCP actions
-> native analysis job and result files -> result_mesh.json
-> visual inspection and engineering decision
```

The repository is one hub record; each adapter is not promoted to a separate product without an independent identity. No reliable first-party maintainer location was found.

## Evidence

- [Pinned hub and adapter index](https://github.com/Cai-aa/CAE-Agent-Hub/tree/57d04fed3dca8bce010f910a610656836794c8a4)
- [MCP implementations](https://github.com/Cai-aa/CAE-Agent-Hub/tree/57d04fed3dca8bce010f910a610656836794c8a4/MCP)
- [Engineering skills](https://github.com/Cai-aa/CAE-Agent-Hub/tree/57d04fed3dca8bce010f910a610656836794c8a4/Skill)
- [Result viewer](https://github.com/Cai-aa/CAE-Agent-Hub/tree/57d04fed3dca8bce010f910a610656836794c8a4/viewer)
