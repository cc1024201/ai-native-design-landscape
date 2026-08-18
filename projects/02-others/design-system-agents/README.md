# AI Design System Agents

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Design System Agents is a web workspace for three source transformations: generate a component from requirements, refactor an existing component against system and accessibility rules, or convert one implementation among React, Kotlin and Swift.

## Source is both input and result

Each tab sends explicit language and source context through a dedicated API route. [`system-prompts.ts`](https://github.com/kamilziemann/design-system-agents/blob/d01caf9af5981c856ca50334268b40511ab445fc/lib/system-prompts.ts) separates generation, conversion and refactoring behavior; [`validation-schemas.ts`](https://github.com/kamilziemann/design-system-agents/blob/d01caf9af5981c856ca50334268b40511ab445fc/lib/validation-schemas.ts) bounds request shape.

```text
requirements or component source + target platform
-> dedicated model route -> explicit code result
-> compare/copy into repository -> normal build and review
```

There is no native visual graph, bidirectional platform mapping or persistent project history. The product's design authority is the source the user submits and accepts. Cross-platform conversion is model-driven, so the common visual and behavioral semantics are requested rather than proven by a compiler or test suite. That makes this an early transformation workspace rather than a full multi-platform design-system synchronizer.

No license file or reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/kamilziemann/design-system-agents/tree/d01caf9af5981c856ca50334268b40511ab445fc)
- [Endpoint handler](https://github.com/kamilziemann/design-system-agents/blob/d01caf9af5981c856ca50334268b40511ab445fc/lib/ai-endpoint-handler.ts)
- [Conversion route](https://github.com/kamilziemann/design-system-agents/blob/d01caf9af5981c856ca50334268b40511ab445fc/app/api/convert/chat/route.ts)
- [Refactor workspace](https://github.com/kamilziemann/design-system-agents/blob/d01caf9af5981c856ca50334268b40511ab445fc/components/refactor-agent.tsx)
