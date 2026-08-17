# Ian Nuttall's Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ian Nuttall's skill collection qualifies through `png2svg`, a measured workflow for reconstructing geometric PNG logos as small editable SVGs. Other release and URL skills share packaging but do not create separate Design products.

## A measurement model guides reconstruction

The skill analyzes the raster, builds measurement templates and asks the agent to express the geometry in compact paths. Conventions constrain canvas, fills, transparency and path complexity. Examples and tests compare the rendered vector with the supplied logo rather than approving an SVG because it opens.

The SVG is the durable artifact. PNG input and measurement templates are evidence that guides reconstruction. This is best suited to geometric logos; photographs and rich textures fall outside its intended model.

## Collection boundary

The repository versions the installable `png2svg` skill alongside unrelated operational skills. It is counted once as the maintained collection, not once per folder.

- [Pinned Ian Nuttall Skills revision](https://github.com/iannuttall/skills/tree/0a35cb006a1ee07999d4700ab88a6d0f0c7c9cbb)
- [png2svg skill](https://github.com/iannuttall/skills/blob/0a35cb006a1ee07999d4700ab88a6d0f0c7c9cbb/skills/png2svg/SKILL.md)
- [Raster analysis module](https://github.com/iannuttall/skills/blob/0a35cb006a1ee07999d4700ab88a6d0f0c7c9cbb/skills/png2svg/scripts/png2svg/analyse.py)
- [Measurement template builder](https://github.com/iannuttall/skills/blob/0a35cb006a1ee07999d4700ab88a6d0f0c7c9cbb/skills/png2svg/scripts/measure_template.py)
