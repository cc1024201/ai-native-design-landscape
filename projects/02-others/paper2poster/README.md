# Paper2Poster

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Paper2Poster is a multi-agent scientific-poster system whose output remains an editable PowerPoint artifact. It parses a paper into structured content and assets, plans a spatial hierarchy, paints the poster and sends visual defects back through a critic/correction loop.

## Layout planning precedes visual correction

[`parse_raw.py`](https://github.com/Paper2Poster/Paper2Poster/blob/623d042f283acee782b2644d6abd63f75eccfa1f/PosterAgent/parse_raw.py) establishes the content inventory. [`tree_split_layout.py`](https://github.com/Paper2Poster/Paper2Poster/blob/623d042f283acee782b2644d6abd63f75eccfa1f/PosterAgent/tree_split_layout.py) converts it into a binary spatial plan, while [`poster_gen_pipeline.py`](https://github.com/Paper2Poster/Paper2Poster/blob/623d042f283acee782b2644d6abd63f75eccfa1f/PosterAgent/poster_gen_pipeline.py) coordinates generation and repair. [`gen_pptx_code.py`](https://github.com/Paper2Poster/Paper2Poster/blob/623d042f283acee782b2644d6abd63f75eccfa1f/PosterAgent/gen_pptx_code.py) materializes native PowerPoint objects.

The parsed content/layout state is the agent's planning authority; the resulting `.pptx` is the user's durable editing and delivery authority. Evaluation code and released examples make the visual loop inspectable rather than merely claimed.

## Evidence

- [Pinned repository](https://github.com/Paper2Poster/Paper2Poster/tree/623d042f283acee782b2644d6abd63f75eccfa1f)
- [Poster evaluation pipeline](https://github.com/Paper2Poster/Paper2Poster/blob/623d042f283acee782b2644d6abd63f75eccfa1f/Paper2Poster-eval/eval_poster_pipeline.py)
