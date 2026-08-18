# UI from References

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UI from References is an agent skill for producing React and Tailwind interfaces without using Figma as an intermediate. It locks a design language from supplied references, inventories assets, writes source and verifies the running UI.

## Lock before code

Phase 1 writes `design-tokens.json` and `design-dna.md`, records uncertain fields as `null`, and requires user confirmation. Phase 2 writes `asset-manifest.json` and confirms required generated imagery and icons. Only then does Phase 3 create Tailwind configuration and screens.

In Phase 4 Playwright screenshots the running source and the agent iterates on code. Tokens are the only allowed source for visual constants; reference pixels express layout and mood but cannot silently inject guessed colors or dimensions. Repository source, locked tokens and the asset manifest jointly own the product.

## Verification boundary

Screenshot comparison can reveal drift but does not create stable identity between a reference element and a React component. The skill's user gates make ambiguity explicit before implementation rather than hiding it in model state.

- [Pinned UI from References revision](https://github.com/jetray33/ui-from-references/tree/f6394c012bbe42d6fc293312a464405e8a7e9072)
- [Four-phase workflow](https://github.com/jetray33/ui-from-references/blob/f6394c012bbe42d6fc293312a464405e8a7e9072/SKILL.md)
- [Token schema](https://github.com/jetray33/ui-from-references/blob/f6394c012bbe42d6fc293312a464405e8a7e9072/templates/design-tokens.json)
- [Example asset authority](https://github.com/jetray33/ui-from-references/blob/f6394c012bbe42d6fc293312a464405e8a7e9072/examples/pokerhouse/asset-manifest.json)
