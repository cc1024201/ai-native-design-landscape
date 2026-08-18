# Varbase AI Figma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Varbase AI Figma turns Figma context into Drupal Canvas pages while forcing generation through the components that a live Drupal theme can actually supply.

## A deterministic resolver sits between Figma and Canvas

The module inventories available theme components, reads Figma structure through the upstream AI Figma connection, and scores candidates as `REUSE`, `ADAPT`, or `CREATE`. The resolver and its audit output are conventional code, not a hidden model judgment.

## Agents receive bounded page operations

Drupal AI Agent functions can inspect, create, and edit Canvas pages using resolved layouts and real component props. The model proposes composition, but component schemas and the resolver constrain what becomes a valid page.

## Drupal owns the artifact and revisions

Canvas page entities and Drupal revisions remain authoritative. Varbase supplies the translation and orchestration layer; it does not replace the host editor or create a parallel Figma-derived document format.

## Pinned evidence

- Repository: [Vardot/varbase_ai_figma](https://github.com/Vardot/varbase_ai_figma)
- Inspected Figma context integration, component inventory, resolver scoring, agent functions, and Canvas entity writes: [`e688eb4bee05b9b89c95681462244621bb96159a`](https://github.com/Vardot/varbase_ai_figma/tree/e688eb4bee05b9b89c95681462244621bb96159a)
- Immutable revision: [commit `e688eb4`](https://github.com/Vardot/varbase_ai_figma/commit/e688eb4bee05b9b89c95681462244621bb96159a)
