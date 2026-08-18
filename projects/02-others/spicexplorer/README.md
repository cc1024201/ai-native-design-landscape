# SpiceXplorer

> Research status: **Source-level with successor access gap** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

SpiceXplorer turns a declarative analog-circuit project into a reproducible SPICE-in-the-loop optimization. A Studio UI and Python library share the same typed YAML engine checkpoints and reports.

## Specifications shape the search rather than hiding inside a reward function

At commit [`58a6248`](https://github.com/MacAnalog/SpiceXplorer/tree/58a6248070e5d37bc53f284e774c7f89f055b60e) `project_setup.yaml` records circuit technology testbenches targets tolerances weights and error modes. An optimizer proposes device parameters; ngspice measures the candidate; scoring converts measurements into constraint-aware objectives; autosave checkpoints and Plotly reports preserve convergence.

```text
typed project YAML -> optimizer candidate -> SPICE testbenches -> score/constraints
       ^                                                       |
       +------------ checkpoint and next candidate ------------+
```

The web Studio supports guided setup live runs history replay comparison and schematic browsing but calls the same orchestrator as scripts. Replay-only mode remains useful without a PDK and correctly refuses to imply that a real simulation ran.

The repository is archived and names four successor repositories. On the review date all four linked GitHub targets returned not found to an authenticated client. The last public source therefore supports the mechanism while current split-repository implementation remains an explicit access gap. The MacAnalog organization profile lists Canada.

## Pinned evidence

- [Pinned README and archive notice](https://github.com/MacAnalog/SpiceXplorer/blob/58a6248070e5d37bc53f284e774c7f89f055b60e/README.md)
- [Optimization source](https://github.com/MacAnalog/SpiceXplorer/tree/58a6248070e5d37bc53f284e774c7f89f055b60e/src/spicexplorer/optimization)
- [Studio UI](https://github.com/MacAnalog/SpiceXplorer/tree/58a6248070e5d37bc53f284e774c7f89f055b60e/ui)
