# SVG Icon Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SVG Icon Skills is a paired agent-skill workflow: `create-svg-icon` generates and reviews icon directions, while `png-to-svg` reconstructs approved raster candidates as transparent editable SVG.

## Candidate creation and artifact construction are separate

The creation skill first defines style and icon-system constraints, then uses image generation to make a raster sheet and slices it into candidates. The conversion skill analyzes the background and rebuilds each selected icon with compact geometry. The final SVG is audited for embedded bitmaps, external references and unsafe elements.

This makes the generated PNG a decision artifact, not the delivered authority. Editable SVG plus its style specification carries the reusable icon system. Cross-platform CI and regression fixtures validate the skill metadata and both successful and failing SVG cases.

## Evidence boundary

Automatic slicing and structural audit cannot establish recognition or optical balance at every size. The executing agent and user still review actual renders before accepting a set.

- [Pinned SVG Icon Skills revision](https://github.com/muxia0396/svg-icon-skills/tree/ec58871cb9be9311b274b4663411853e160dc7cc)
- [Icon creation skill](https://github.com/muxia0396/svg-icon-skills/blob/ec58871cb9be9311b274b4663411853e160dc7cc/skills/create-svg-icon/SKILL.md)
- [PNG-to-SVG skill](https://github.com/muxia0396/svg-icon-skills/blob/ec58871cb9be9311b274b4663411853e160dc7cc/skills/png-to-svg/SKILL.md)
- [SVG audit implementation](https://github.com/muxia0396/svg-icon-skills/blob/ec58871cb9be9311b274b4663411853e160dc7cc/skills/png-to-svg/scripts/svg_audit.py)
