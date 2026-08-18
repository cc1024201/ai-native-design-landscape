# Strands Agents Diagram Tool

> Research status: **Source-level** · Lifecycle: **sunsetting** · Last reviewed: **2026-08-12**

The Strands Agents diagram tool is a structured callable that lets a general agent produce several diagram families through deterministic Python libraries. It is technically real and simultaneously being retired.

## One tool, several renderer contracts

At commit [`bddfd3aa`](https://github.com/strands-agents/tools/tree/bddfd3aac2bf1f43022d54019ca38a19306aa279), typed arguments select AWS architecture, basic graph, network, UML and related modes. The implementation delegates to `diagrams`, Graphviz or Matplotlib and writes file outputs.

## Artifact authority is downstream

The agent supplies structured intent and renderer-specific code constructs; the resulting file is the handoff. There is no native editing canvas or project-level diagram history in this tool.

## Lifecycle evidence changes the map

Release deprecation metadata marks the tool deprecated in 0.8.6 and scheduled for removal in 0.9.0 without a stated replacement. The census keeps it as sunsetting instead of silently presenting a historical implementation as current direction.

## Evidence

- [Pinned tools repository](https://github.com/strands-agents/tools/tree/bddfd3aac2bf1f43022d54019ca38a19306aa279)
- [Diagram implementation](https://github.com/strands-agents/tools/blob/bddfd3aac2bf1f43022d54019ca38a19306aa279/src/strands_tools/diagram.py)
- [Behavior tests](https://github.com/strands-agents/tools/blob/bddfd3aac2bf1f43022d54019ca38a19306aa279/tests/test_diagram.py)
- [Deprecation tests](https://github.com/strands-agents/tools/blob/bddfd3aac2bf1f43022d54019ca38a19306aa279/tests/test_deprecations.py)
