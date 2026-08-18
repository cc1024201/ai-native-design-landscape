# Scientific Illustrator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Scientific Illustrator reconstructs reference scientific figures as editable objects in Microsoft PowerPoint, WPS Presentation or Draw.io. It is the current integrated successor to the maintainer's earlier `drawio-scientific-illustrator`; that older repository is folded into this record.

## The target application—not an intermediate bitmap—owns the result

The skills require the agent to inspect the host connection, draw objects incrementally, compare the whole result with the reference, correct defects and finally save both the editable artifact and a preview. PowerPoint and WPS use editable PPTX objects; Draw.io uses native graph objects and `.drawio` XML. Only irreducible texture regions may be embedded as images, while labels, arrows and borders remain editable.

Host-specific bridges distinguish background file editing from live application control and report uncertainty instead of claiming a connection that cannot be verified. This makes application state and exported source explicit, a crucial boundary for a visual reconstruction agent.

## Evidence

- [Pinned repository](https://github.com/icebird1998/scientific-illustrator/tree/3a44435da8715b7d380d5b594259e3f495c5b336)
- [Draw.io reconstruction skill](https://github.com/icebird1998/scientific-illustrator/blob/3a44435da8715b7d380d5b594259e3f495c5b336/plugins/scientific-illustrator/skills/recreate-scientific-figure-in-drawio/SKILL.md)
- [Live PowerPoint skill](https://github.com/icebird1998/scientific-illustrator/blob/3a44435da8715b7d380d5b594259e3f495c5b336/plugins/scientific-illustrator/skills/edit-powerpoint-live/SKILL.md)
- [Host MCP server](https://github.com/icebird1998/scientific-illustrator/blob/3a44435da8715b7d380d5b594259e3f495c5b336/plugins/scientific-illustrator/scripts/server.mjs)
