# OpticalModeler

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpticalModeler reconstructs a 2D photonics schematic as a physically auditable Blender optical table. It treats topology, aperture alignment, real hardware CAD, fasteners, load paths and fiber routing as release gates rather than decorative realism.

## Evidence is part of the 3D artifact

The workflow saves the scene, reopens it and runs mesh, ray, BVH and load-path checks. Manifests, hashes, annotated renders and machine-readable acceptance states travel with the model; results can be `PASS`, `BLOCKED` or `UNVERIFIED` instead of being forced into a visual success claim.

Published forward tests include failures and replay drift, which establishes the limits of reconstruction. The result is not mechanical, spectral or laser-safety certification.

- [Pinned repository](https://github.com/k-telux/OpticalModeler/tree/75d17cab642e9fb45cda449bd58087d2c13e0dc1)
- [Reconstruction skill](https://github.com/k-telux/OpticalModeler/blob/75d17cab642e9fb45cda449bd58087d2c13e0dc1/skills/thorlabs-blender-optical-path/SKILL.md)
- [Evidence contract](https://github.com/k-telux/OpticalModeler/blob/75d17cab642e9fb45cda449bd58087d2c13e0dc1/skills/thorlabs-blender-optical-path/references/evidence-contract.md)
- [Maintainer profile: Providence Rhode Island](https://github.com/k-telux)
