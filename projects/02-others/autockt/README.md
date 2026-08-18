# AutoCkt

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AutoCkt is an early machine-learning definition of circuit design: an RL policy chooses analog-device parameter moves and a SPICE simulator decides whether those choices satisfy sampled specifications.

## The artifact is a parameterized circuit under measured constraints

At commit [`a6c8a61`](https://github.com/ksettaluri6/AutoCkt/tree/a6c8a61d3dffb8b433f19251e135994a5b0f6ee4) YAML specification sets define target ranges parameter bounds and normalization. Jinja netlist templates materialize a candidate and ngspice returns measurements. The Gym environment converts the distance from target specifications into reward and the policy iterates until the circuit reaches the acceptance region.

```text
sampled specs -> RL action on W/L/passives -> rendered netlist -> ngspice
      ^                                                     |
      +---------------- reward from measurements -----------+
```

This is not conversational authoring and it has no production canvas. It is still a closed design loop because model action changes the authoritative parameter vector and deterministic simulation accepts or rejects it. Training checkpoints and validation rollouts are experiment state rather than user-facing version history.

## Evidence boundary

The repository is research code with environment-sensitive dependencies and checked-in example outputs. It proves the optimization mechanism but not foundry sign-off or a maintained commercial workflow. Public first-party material did not establish a current team region.

## Pinned sources

- [Repository guide](https://github.com/ksettaluri6/AutoCkt/blob/a6c8a61d3dffb8b433f19251e135994a5b0f6ee4/README.md)
- [Gym environments](https://github.com/ksettaluri6/AutoCkt/tree/a6c8a61d3dffb8b433f19251e135994a5b0f6ee4/autockt/envs)
- [Netlist evaluation engines](https://github.com/ksettaluri6/AutoCkt/tree/a6c8a61d3dffb8b433f19251e135994a5b0f6ee4/eval_engines)
