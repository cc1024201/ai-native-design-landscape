# Mobirise AI

Mobirise AI defines design as **staying inside one managed site project** rather than producing a finished artifact at the end of a generation.

Its ordinary-user loop starts from a text or image brief, then keeps refining the same editable site — layout, palette, typography, imagery, content, SEO, commerce, forms — through conversational or manual edits until it converges. The authoritative object is the native site graph, not a sequence of disconnected AI outputs. Release notes expose project-level operations like new-page generation, block cloning, global CSS saving and a recent-generations list that make that managed-graph model concrete.

The implementation is a convergence of two lanes before delivery. AI generation establishes the initial structure and design, and the builder's normal block and style controls remain available for precise direct edits — chat requests and manual controls meet in the same editable project.

Publication can target Mobirise hosting and a connected domain. A second delivery path exports full HTML/CSS/JavaScript source. That export establishes delivery without proving the exported source is the internal authoring authority — the native Mobirise project stays the best-supported primary authority.

The evidence boundary is architectural rather than source-level. The public GitHub repository is a release-history and template surface, so the private mutation protocol, generation internals and persistence schema are not publicly established and are deliberately left open.

[Evidence: official AI website builder](https://mobirise.com/builder/ai-website-builder.html) · [help center](https://mobirise.com/help/) · [release-history repo at `0b7239f9`](https://github.com/Mobirise/Mobirise/tree/0b7239f92a58f78a0d69adfc08d2947cb403d3c9)
