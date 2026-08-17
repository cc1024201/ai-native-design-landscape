# SimpleCORE Wireframe Boards

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SimpleCORE Wireframe Boards creates a single offline HTML board containing low-fidelity phone, tablet and desktop frames, flow connectors and annotation callouts. Its purpose is specification and handoff, not a polished mockup that developers imitate pixel for pixel.

## Every frame carries a durable identity

Phone and tablet frames use fixed viewports; desktop frames expose a fold marker and fluid height. Frames wrap vertically instead of creating an unreadable horizontal strip, and each keeps both a permanent ID and current board position. A CSS-only viewport toggle lets reviewers compare narrow and wide states without a runtime service.

The HTML board and its implementation contract are the source authority. The contract explains how structure, states and flow should be read so greybox styling is not mistaken for final visual design. Output hooks check offline rendering, labels, pairing and limited accent usage.

- [Pinned skill directory](https://github.com/simplecore-inc/simplecore-skills/tree/0c45b550b4f59620e406f1e8e84ab714f34b3c1c/plugins/simplecore/skills/wireframe-boards)
- [Agent skill](https://github.com/simplecore-inc/simplecore-skills/blob/0c45b550b4f59620e406f1e8e84ab714f34b3c1c/plugins/simplecore/skills/wireframe-boards/SKILL.md)
- [Pinned marketplace source](https://github.com/simplecore-inc/simplecore-skills/tree/0c45b550b4f59620e406f1e8e84ab714f34b3c1c)
- [Organization location evidence](https://github.com/simplecore-inc)
