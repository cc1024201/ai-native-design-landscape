# Design Agents Flow

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Agents Flow packages UI implementation as a sequence of narrowly owned decisions. Its thesis is that agent handoffs become reliable when planning, discovery, execution, visual verification and completion each write durable context instead of relying on one long chat.

## The filesystem is the coordination surface

Ten role prompts cover quick changes, design refinement, planning, review, repository discovery, implementation, visual verification, completion, emergency fixes, motion and mobile. `status.md`, task folders and accumulated learnings preserve which decision was made and which component already exists.

Figma MCP can supply exact design specifications. The execution agent changes repository code, then a verification agent captures multiple breakpoints and compares them with the specification. Code remains authoritative; design-system files constrain it and screenshots expose drift. The system is primarily a method/prompt release rather than a new visual runtime, so architecture-level evidence is the appropriate ceiling.

- [Pinned repository](https://github.com/charlieellington/ai-vibe-design-code/tree/4d32091046cb97ea88356ca8a37e0e57a26345b3)
- [Planning agent](https://github.com/charlieellington/ai-vibe-design-code/blob/4d32091046cb97ea88356ca8a37e0e57a26345b3/design-1-planning.md)
- [Visual-verification agent](https://github.com/charlieellington/ai-vibe-design-code/blob/4d32091046cb97ea88356ca8a37e0e57a26345b3/design-5-visual-verification.md)
- [Maintainer profile checked; no location published](https://github.com/charlieellington)
