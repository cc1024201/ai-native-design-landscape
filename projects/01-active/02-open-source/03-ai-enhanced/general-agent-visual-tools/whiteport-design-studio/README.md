# Whiteport Design Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Whiteport Design Studio is a BMAD expansion that defines Design as a staged product-development discipline. Its agents do not begin at visual styling: they preserve the chain from business intent and user psychology to UX scenarios, specifications, native design tools, implementation and delivery evidence.

## Artifact folders expose the phase boundary

Saga produces the product brief and trigger map. Freya advances through UX scenarios and page specifications, design-system work, asset generation and product evolution; Mimir supports agentic building. Each phase writes to a named `design-artifacts/` subtree instead of hiding intermediate reasoning in chat.

The [UX design guide](https://github.com/bmad-code-org/bmad-method-wds-expansion/blob/cc16f09fcfab26d35635af1491f36a38a8431c8d/docs/method/phase-4-ux-design-guide.md) specifies page and interaction deliverables. The [design-system guide](https://github.com/bmad-code-org/bmad-method-wds-expansion/blob/cc16f09fcfab26d35635af1491f36a38a8431c8d/docs/method/phase-5-design-system-guide.md) creates governed tokens and component decisions. Tool guides connect those specifications to Figma MCP, Penpot, Stitch, Excalidraw or HTML import and bring the result back into delivery.

```text
alignment -> brief -> trigger map -> scenarios -> UX specifications
-> visual/native artifacts + design system -> source/test -> delivery package
```

Signoff separates intent changes from normal execution. Files and Git own recovery; external design tools retain their own native graphs. The method does not claim a single automatic round-trip across every supported tool.

The repository is MIT-licensed. The BMAD module and standalone Whiteport installer are one product distribution family. No reliable team-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/bmad-code-org/bmad-method-wds-expansion/tree/cc16f09fcfab26d35635af1491f36a38a8431c8d)
- [Freya skill](https://github.com/bmad-code-org/bmad-method-wds-expansion/blob/cc16f09fcfab26d35635af1491f36a38a8431c8d/src/agents/wds-agent-freya-ux/SKILL.md)
- [Delivery contract](https://github.com/bmad-code-org/bmad-method-wds-expansion/blob/cc16f09fcfab26d35635af1491f36a38a8431c8d/docs/deliverables/design-delivery-prd.md)
- [MIT license](https://github.com/bmad-code-org/bmad-method-wds-expansion/blob/cc16f09fcfab26d35635af1491f36a38a8431c8d/LICENSE)
