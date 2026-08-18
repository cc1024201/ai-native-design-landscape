# SDD-DE

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SDD-DE is a portable specification-driven development kit for design engineers. It turns Figma, component libraries, repositories, archives or Google Stitch output into a repeatable seven-step component and screen cycle.

## Specification branches before implementation

Figma extraction writes a token and component inventory. Each unit moves from an enriched brief to component, interaction and page specifications on a dedicated branch. Implementation advances one spec task at a time, followed by visual verification, adversarial review, token synchronization and a pull request whose description carries the spec.

`DESIGN.md`, component inventory and generated specs govern intent; code and Storybook become the executable projection. The explicit branch boundary makes change history part of the design handoff rather than a later engineering concern.

The toolkit supports many frameworks, but the repository proves the installer, skills and method—not equivalent end-to-end accuracy across every design source and frontend stack.

- [Pinned repository](https://github.com/royvillasana/SDD-DE/tree/9db9e1c6046ff0066791f269f27a847bc565f390)
- [Design-system extraction skill](https://github.com/royvillasana/SDD-DE/tree/9db9e1c6046ff0066791f269f27a847bc565f390/skills/extract-design-system)
- [Visual verification skill](https://github.com/royvillasana/SDD-DE/tree/9db9e1c6046ff0066791f269f27a847bc565f390/skills/visual-verify)
- [Maintainer profile checked; no location published](https://github.com/royvillasana)
