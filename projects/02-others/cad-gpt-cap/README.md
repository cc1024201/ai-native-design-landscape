# CAP / CAD-GPT

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

CAP preserves an important alternative to direct text-to-3D generation: the model writes the logic that generates a part. A designer can inspect parameter descriptions intermediate reasoning and OpenSCAD or CadQuery-oriented source before accepting geometry.

## Generation logic is the editable artifact

At commit [`1752a91`](https://github.com/BlueAsuka/CAD-GPT/tree/1752a919731bac49b10e91fabb3101710067cf71) the paper implementation turns a requirement into design logic parameters and OpenSCAD scripts. Checked notebooks exercise gear families and keep intermediate steps visible. The newer [`agent.py`](https://github.com/BlueAsuka/CAD-GPT/blob/1752a919731bac49b10e91fabb3101710067cf71/agent.py) begins a cleaner agent abstraction and a move toward CadQuery.

```text
requirement -> design logic -> parameters -> CAD source -> rendered geometry
                   ^              |
                   +-- human edit-+
```

Rendered meshes are projections. The durable and rerunnable authority is the domain source plus its parameters. This makes correction materially different from asking an image model for another opaque sample.

## Maturity boundary

The repository combines preserved paper code with an incomplete refactor; it is not a polished CAD application. External model access and CAD runtimes are required and no manufacturing sign-off is claimed. The first-party profile lists Cranfield University which supports a United Kingdom team attribution.

## Evidence

- [Pinned project explanation](https://github.com/BlueAsuka/CAD-GPT/blob/1752a919731bac49b10e91fabb3101710067cf71/README.md)
- [Paper workflow source](https://github.com/BlueAsuka/CAD-GPT/tree/1752a919731bac49b10e91fabb3101710067cf71/paper_code)
- [Workflow diagram](https://github.com/BlueAsuka/CAD-GPT/blob/1752a919731bac49b10e91fabb3101710067cf71/paper_code/assets/CAD-GPT-workflow.jpg)
