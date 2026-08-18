# FusionMCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FusionMCP is a local assistant and service for Autodesk Fusion 360. A model proposes typed engineering actions, but a Fusion add-in—not the language model—executes them against the native parametric document.

## Structured actions cross the trust boundary

The server supports multiple model providers and validates responses with Pydantic schemas before returning a `FusionAction`. [`fusion_actions.py`](https://github.com/jaskirat1616/fusion360-mcp/blob/009c5b380157b3a94736c3d5ec3adb9f81565a2f/fusion_addin/fusion_actions.py) routes bounded operations such as boxes, cylinders, holes, extrudes, fillets and materials into Fusion's sketch and feature APIs. A context cache records design state, conversations and action outcomes.

```text
request + native design context -> provider fallback -> validated FusionAction
-> local add-in -> sketch/feature mutation in Fusion document -> action result
```

The current action vocabulary is limited and should not be mistaken for full Fusion automation. The maintainer reports Vancouver, Canada.

## Evidence

- [Pinned repository](https://github.com/jaskirat1616/fusion360-mcp/tree/009c5b380157b3a94736c3d5ec3adb9f81565a2f)
- [Architecture](https://github.com/jaskirat1616/fusion360-mcp/blob/009c5b380157b3a94736c3d5ec3adb9f81565a2f/ARCHITECTURE.md)
- [Native action executor](https://github.com/jaskirat1616/fusion360-mcp/blob/009c5b380157b3a94736c3d5ec3adb9f81565a2f/fusion_addin/fusion_actions.py)
- [Maintainer location evidence](https://github.com/jaskirat1616)
