# SimCorrect

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SimCorrect detects and repairs mismatches between a robot simulation model and observed ground truth. It runs paired simulations under identical commands, measures end-effector and joint divergence, identifies a responsible geometric or dynamic parameter, rebuilds the model and accepts the change only after the task succeeds again.

## Corrections return as named parameter patches

Five public scenarios cover link length, wrist offset, friction, encoder zero and tool mass. Sensitivity-based diagnostics distinguish Cartesian faults invisible to joint telemetry from dynamic faults that create joint error. The correction engine writes MJCF changes and reloads MuJoCo for programmatic validation.

With OpenCAD, a versioned CAID artifact supplies company-facing parameter names and simulation tags. SimCorrect emits structured JSON patches against that contract, preserving a path back to the parametric design instead of making a corrected simulation file an opaque fork.

- [Pinned repository](https://github.com/caid-technologies/Sim-Correct/tree/d2870e93ab7369e7b6f31e50d6bcc3ac9133850d)
- [CAID contract](https://github.com/caid-technologies/Sim-Correct/blob/d2870e93ab7369e7b6f31e50d6bcc3ac9133850d/docs/CAID_ARTIFACT_CONTRACT.md)
- [Parameter correction implementation](https://github.com/caid-technologies/Sim-Correct/blob/d2870e93ab7369e7b6f31e50d6bcc3ac9133850d/mjcf_correction.py)
- [Organization profile checked; no location published](https://github.com/caid-technologies)
