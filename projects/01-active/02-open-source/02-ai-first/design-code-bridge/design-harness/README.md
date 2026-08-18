# Design Harness

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Harness defines the specification as the product and implementation code as compiled output. Two agents use Pencil as their visual work surface, then publish a three-file source of truth that another coding agent can implement without re-inventing design decisions.

## Three artifacts divide design authority

`DESIGN.md` owns primitive, semantic and component tokens. `components.json` owns component anatomy and behavior. `views.json` owns positions, spacing and breakpoints. JSON schemas make the latter two machine-checkable rather than prose-only handoffs.

The UI architect designs components in Pencil and commits approved specifications layer by layer. The UI composer builds wireframes and detailed views from those components. Human gates separate visual exploration from specification. A downstream design-QA skill checks the application, but application code does not silently replace the approved design source.

This is distinct from a Figma-to-code bridge: it first creates an agent-consumable design system and view graph. Pencil files are review projections; the three exported contracts are the portable authority.

- [Pinned repository](https://github.com/KnuppeArt/design-harness/tree/4f13ccde1360d992bc608a96c279b9f092c33a1d)
- [Component registry schema](https://github.com/KnuppeArt/design-harness/blob/4f13ccde1360d992bc608a96c279b9f092c33a1d/schemas/components-registry.v1.schema.json)
- [UI architect agent](https://github.com/KnuppeArt/design-harness/blob/4f13ccde1360d992bc608a96c279b9f092c33a1d/.claude/agents/ui-architect.md)
- [Maintainer profile checked; no location published](https://github.com/KnuppeArt)
