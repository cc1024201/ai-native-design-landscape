# Cadens

> Research status: **Architecture-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Cadens is presented as a self-hostable general agent for non-technical teams. It belongs in this landscape because its documented ordinary-user loop includes AI-created interactive HTML React charts and dashboards rather than stopping at chat text.

## The public artifact contract

The pinned [design document](https://github.com/Tofulabai/cadens/blob/50c526545ba483d698835b92d49c2394a202d51e/DESIGN.md) says the agent writes files under an output directory. HTML is rendered in a sandboxed iframe and JSX is transpiled in the browser before rendering. That makes generated files the handoff between agent execution and the visual result.

## What the product evidence establishes

The [README at the inspected commit](https://github.com/Tofulabai/cadens/blob/50c526545ba483d698835b92d49c2394a202d51e/README.md) shows a production-derived chat workspace with generated files and calls out interactive artifacts as a current product capability. It links the live Platon Agent product from which Cadens is said to be extracted.

## Release boundary

The repository contains documentation and screenshots but no application implementation. The same README says the complete four-service source and Compose setup are still being prepared. Cadens is therefore counted at architecture depth only: the artifact contract and operating product are evidenced but none of the claimed runtime can be independently traced to executable public source.

## Pinned evidence

- [Repository](https://github.com/Tofulabai/cadens)
- [Inspected tree](https://github.com/Tofulabai/cadens/tree/50c526545ba483d698835b92d49c2394a202d51e)
- [Artifact rendering section](https://github.com/Tofulabai/cadens/blob/50c526545ba483d698835b92d49c2394a202d51e/DESIGN.md#artifact-rendering)
