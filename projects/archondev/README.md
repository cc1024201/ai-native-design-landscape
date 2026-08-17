# ArchonDev

> Research status: **Architecture-level / packaged-source boundary** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ArchonDev is a local development-governance product for AI coding agents. Its Design-relevant contract makes `DESIGN.md` the declared visual source of truth, runs headless-browser QA against changed pages and gates ambiguous or high-blast-radius changes through checkpoints and review.

## Design truth and runtime evidence govern code changes

The CLI/extension loads the supplied architecture and design files before work. `archon qa` performs diff-aware browser health checks; design-review and UX-review skills produce severity-graded findings. Automatic checkpoints, file limits and a ship pipeline connect review, tests, versioning, changelog and PR delivery. A separate truth-layer file tracks claims and evidence.

The public repository contains documentation, a truth-layer artifact and a packaged VSIX rather than the unpacked implementation source, so this dossier stops at architecture evidence. Repository code remains the product artifact authority; runtime captures and review records gate its promotion.

## Evidence

- [Pinned repository](https://github.com/archondevio/archondev/tree/aa55198b33f1955ead944a1474613196b9cd8e15)
- [Product and command contract](https://github.com/archondevio/archondev/blob/aa55198b33f1955ead944a1474613196b9cd8e15/README.md)
- [Truth-layer artifact](https://github.com/archondevio/archondev/blob/aa55198b33f1955ead944a1474613196b9cd8e15/.archon/truth-layer.md)
- [Packaged VSIX at reviewed revision](https://github.com/archondevio/archondev/blob/aa55198b33f1955ead944a1474613196b9cd8e15/archondev-0.2.0.vsix)
