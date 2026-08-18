# Unkode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Unkode treats software architecture as a repository-resident model that agents and developers can inspect, compare, and update. Its differentiator is not diagram generation alone but preserving an explicit architectural contract near the code.

## YAML is the working authority

Architecture entities and relationships live in structured YAML. Visual diagrams and documentation are generated projections. This direction matters: a rendered view can be replaced without losing the model, while editing only an exported image would not update the architectural contract.

## Agent work is grounded by the contract

The agent reads repository context and the declared architecture, then uses that material for questions, analysis, and proposed updates. The same model can be checked for divergence as the implementation changes. In this definition of design, maintaining correspondence is as important as making the initial diagram.

## Drift is evidence, not automatic truth

Diffs can reveal that code and the declared model no longer agree, but they do not decide which side is correct. A developer still has to promote the intended change—update the model, update the code, or explain the exception.

## Pinned evidence

- Repository: [deepcodersinc/unkode](https://github.com/deepcodersinc/unkode)
- Inspected implementation: [`379f7005da89afb3c030ce019b92d12e1b93618b`](https://github.com/deepcodersinc/unkode/tree/379f7005da89afb3c030ce019b92d12e1b93618b)
- Immutable revision: [commit `379f700`](https://github.com/deepcodersinc/unkode/commit/379f7005da89afb3c030ce019b92d12e1b93618b)
