# 42Maker

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | 42Maker · team region not established |
| Ordinary job | prompt a printable part then keep refining it with object-level CAD and print checks |
| Authority | browser scene tree and editable native objects; imported STL remains mesh data |
| Lifecycle | active |

## Native objects and imported meshes coexist

Guest users can start with a prompt or construct from eleven primitives. The editor exposes a scene tree transforms and properties then supports sketch extrude and revolve fillet chamfer mirror screw and snap-tab tools. Images or SVGs can seed sketches and STL files can be imported for remixing.

Native objects retain direct properties while STL input and final STL output are triangulated meshes. The workspace should therefore not be described as uniformly parametric. Print readiness checks apply build-volume and quality thresholds before export and provide evidence about manufacturability without proving a physical print will succeed.

The public product page includes screenshots from the running editor but does not disclose persistence versions boolean kernel model-generation implementation or whether imported meshes gain a feature history.

## Primary evidence

- [42Maker browser editor and object workflow](https://42maker.com/)
- [42Maker running editor](https://app.42maker.com/)
