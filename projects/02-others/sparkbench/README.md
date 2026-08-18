# SparkBench

> Research status: **Source-level** · Lifecycle: **active prototype** · Last reviewed: **2026-08-12**

SparkBench defines hardware design as one managed project spanning firmware, a circuit diagram, simulation and a native KiCad-compatible board. Its Sparky agent sees the whole project, proposes schematic/code changes as diffs and can invoke a routed PCB workflow.

## One project joins simulation and manufacturing geometry

The custom [`KiPCBEditor`](https://github.com/photon-cat/sparkbench/blob/02af8d0cec36bde4f01a258ac03bfe26e02275a2/components/KiPCBEditor.tsx) reads and writes `.kicad_pcb` s-expressions rather than exporting an image. [`pcb-drc.ts`](https://github.com/photon-cat/sparkbench/blob/02af8d0cec36bde4f01a258ac03bfe26e02275a2/lib/pcb-drc.ts) checks layout constraints, [`PCB3DViewer.tsx`](https://github.com/photon-cat/sparkbench/blob/02af8d0cec36bde4f01a258ac03bfe26e02275a2/components/PCB3DViewer.tsx) projects the board, and [`deeppcb-client.ts`](https://github.com/photon-cat/sparkbench/blob/02af8d0cec36bde4f01a258ac03bfe26e02275a2/lib/deeppcb-client.ts) returns cloud routing results to that same project.

Firmware, `diagram.json` and `.kicad_pcb` files share authority by domain. Headless simulation scenarios and agent-generated fuzz cases provide behavioral evidence before physical fabrication.

## Evidence

- [Pinned repository](https://github.com/photon-cat/sparkbench/tree/02af8d0cec36bde4f01a258ac03bfe26e02275a2)
- [Native board parser](https://github.com/photon-cat/sparkbench/blob/02af8d0cec36bde4f01a258ac03bfe26e02275a2/lib/pcb-parser.ts)
- [Project examples](https://github.com/photon-cat/sparkbench/tree/02af8d0cec36bde4f01a258ac03bfe26e02275a2/projects)
