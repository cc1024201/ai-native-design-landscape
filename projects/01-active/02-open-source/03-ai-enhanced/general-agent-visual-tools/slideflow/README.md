# SlideFlow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SlideFlow is a local presentation engine whose LangGraph state tracks outline, pages and workspace paths. Its distinctive delivery step reconstructs generated HTML into PowerPoint vector elements instead of inserting page screenshots.

## DOM is an intermediate layout representation

[`ppt_graph.py`](https://github.com/xiaoyesoso/SlideFlow/blob/47f9fe51d64bbaae10da9a9ba8e1853612af0be1/core/ppt_graph.py) drives parallel content and page generation over the explicit [`PPTState`](https://github.com/xiaoyesoso/SlideFlow/blob/47f9fe51d64bbaae10da9a9ba8e1853612af0be1/core/state.py). Playwright first renders the HTML for visual synthesis; [`html_to_ppt.py`](https://github.com/xiaoyesoso/SlideFlow/blob/47f9fe51d64bbaae10da9a9ba8e1853612af0be1/core/utils/html_to_ppt.py) reads DOM positions and computed styles and rebuilds text and shapes with `python-pptx`.

MCP tools expose workspace initialization, HTML page writes and final synthesis so an external agent can use the same file authority. The maintainer reports Guangzhou, China.

## Evidence

- [Pinned repository](https://github.com/xiaoyesoso/SlideFlow/tree/47f9fe51d64bbaae10da9a9ba8e1853612af0be1)
- [LangGraph workflow](https://github.com/xiaoyesoso/SlideFlow/blob/47f9fe51d64bbaae10da9a9ba8e1853612af0be1/core/ppt_graph.py)
- [HTML-to-vector PowerPoint bridge](https://github.com/xiaoyesoso/SlideFlow/blob/47f9fe51d64bbaae10da9a9ba8e1853612af0be1/core/utils/html_to_ppt.py)
- [Maintainer location evidence](https://github.com/xiaoyesoso)
