# KiCad Skills with IPC API

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCad Skills with IPC API is a compact agent distribution for operating the document already open in KiCad 10+. Unlike file-rewriting bridges, it uses KiCad's own IPC API and bundled Python runtime to inspect and mutate current native objects.

## Four skills divide live authority by task

[`kicad-connect`](https://github.com/HubertHQH/KiCad-skills/blob/693a140a3d0a29e0842a884028dfde5a1065e7da/.agents/skills/kicad-connect/SKILL.md) discovers the live host and open documents. [`kicad-pcb`](https://github.com/HubertHQH/KiCad-skills/blob/693a140a3d0a29e0842a884028dfde5a1065e7da/.agents/skills/kicad-pcb/SKILL.md) operates footprints, nets, tracks, vias, zones and selection; [`kicad-project`](https://github.com/HubertHQH/KiCad-skills/blob/693a140a3d0a29e0842a884028dfde5a1065e7da/.agents/skills/kicad-project/SKILL.md) handles rules and metadata; [`kicad-export`](https://github.com/HubertHQH/KiCad-skills/blob/693a140a3d0a29e0842a884028dfde5a1065e7da/.agents/skills/kicad-export/SKILL.md) creates manufacturing and review outputs.

The live KiCad document remains the canonical graph. The scripts are adapters, not an alternate schematic format, and the four folders are counted as one released collection.

## Evidence

- [Pinned repository](https://github.com/HubertHQH/KiCad-skills/tree/693a140a3d0a29e0842a884028dfde5a1065e7da)
- [PCB mutation implementation](https://github.com/HubertHQH/KiCad-skills/blob/693a140a3d0a29e0842a884028dfde5a1065e7da/.agents/skills/kicad-pcb/scripts/pcb_modify.py)
