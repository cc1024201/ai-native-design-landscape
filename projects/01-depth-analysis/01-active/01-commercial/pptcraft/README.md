# PPTCraft

**What is design.** PPTCraft treats design as a *checked* act rather than a generative one. Its ordinary job is to turn an outline, data and a brand into a deck that is verified before it is ever handed off. The sharpest clue to its definition is where authority finally lands: a native editable PPTX whose text boxes, shapes and charts become objects that PowerPoint, Keynote or Google Slides then own. PDF and image output are only delivery projections. Design, in PPTCraft's sense, is the internal vector geometry that survives validation and can be re-materialized by another tool.

**How it is implemented.** The mechanism is a deterministic validation loop wrapped around a redraw cycle. Slides are built as vector geometry, then run through overlap, clipping and dimension checks; data charts are plotted from supplied values rather than inferred from how an image happens to look. The deck is then rendered to actual pixels so a vision critique can inspect it, weak slides are redrawn, and the whole thing cycles back through the geometry checks before materializing to PPTX.

That staging of *opaque generation → pixel render → critique → recheck → editable file* is what distinguishes it from a prompt-to-slide generator: the product's confidence comes from measured properties (a chart plotted from numbers, no clipped overflow) plus a review pass, not from a single generation call.

There is an accompanying claim of whole-deck restyling and a saved brand kit, but this preview build publishes no internal version or persistence model, so how a brand restyle is retained and applied remains unstated. The landing page is explicit that the product is not yet launched and public signup is closed—this is a first-party preview with downloadable example artifacts and a described workflow, not a generally available incumbent.

[Evidence: PPTCraft preview workflow and validation loop](https://www.pptcraft.com/en/) · [Editable PowerPoint boundary](https://www.pptcraft.com/en/#editable-export)
