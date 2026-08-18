# Bridge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Bridge defines AI-native Figma work as compilation against a synchronized design-system knowledge base. Its central claim is architectural: token and component compliance should be guaranteed by deterministic resolution and lint rules before execution, not requested from a model and judged afterward.

## CSpec is compiled rather than interpreted directly

A design request becomes a YAML CSpec referencing known components, variables and text styles. The [compiler schema](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/lib/compiler/schema.ts) validates structure; the resolver checks references against registries; the planner creates a scene graph; code generation emits constrained Figma Plugin API operations. Built-in lint rules reject hard-coded values, stale references and workflow violations.

```text
Figma REST sync -> repository knowledge-base registries
natural language -> CSpec -> resolve + lint -> scene graph
-> compiled plugin code -> MCP execution in Figma
-> manual correction -> captured learning/recipe -> archive
```

The knowledge base is a versionable mirror, not a replacement for the Figma library. A scheduled sync can open a pull request when the host system changes. `fix` turns a bounded correction into a new compile; `done` preserves CSpec, snapshots, history and reusable recipes. This creates traceability across intent, compiler output and native graph.

The npm surface is also called `bridge-ds`; it is the same product lineage. The project is MIT-licensed. The maintainer profile reports Paris, France.

## Decisive evidence

- [Pinned repository](https://github.com/noemuch/bridge/tree/414977f08a11c49c3f9b13a6cee0f3318d513fb2)
- [Compiler](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/lib/compiler/compile.ts)
- [Figma REST extractor](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/lib/extractors/figma-rest.ts)
- [Learning workflow](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/skills/learning-from-corrections/SKILL.md)
- [Shipping and archive workflow](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/skills/shipping-and-archiving/SKILL.md)
- [MIT license](https://github.com/noemuch/bridge/blob/414977f08a11c49c3f9b13a6cee0f3318d513fb2/LICENSE)
