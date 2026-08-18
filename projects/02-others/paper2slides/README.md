# paper2slides

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

paper2slides combines a deterministic scientific-figure extractor with an agent that reads a paper, selects evidence and authors a Reveal.js talk. It is narrower than Paper2Any: one PDF becomes one web-native academic deck plus speaker notes.

## Mechanical extraction and editorial judgment stay separate

[`extractor.py`](https://github.com/inhyeoklee/paper2slides-skill/blob/c30943902a6459645d894a81a6f3265861bfcb7f/library/src/paper2slides/extractor.py) renders paper figures at high resolution; [`segmenter.py`](https://github.com/inhyeoklee/paper2slides-skill/blob/c30943902a6459645d894a81a6f3265861bfcb7f/library/src/paper2slides/segmenter.py) splits panels. The agent then chooses panels, narrative, captions and notes rather than pretending panel selection is a deterministic transform.

The generated Reveal.js HTML remains editable in the browser: content and notes can be changed, autosaved, reset and downloaded as revised HTML. Settings alter theme, typography, figure scale and transitions. Browser verification closes the loop against the same source deck; PPTX is explicitly still a future direction.

The maintainer's first-party profile names the University of Chicago, supporting a United States team-region assignment.

## Evidence

- [Pinned repository](https://github.com/inhyeoklee/paper2slides-skill/tree/c30943902a6459645d894a81a6f3265861bfcb7f)
- [Agent workflow](https://github.com/inhyeoklee/paper2slides-skill/blob/c30943902a6459645d894a81a6f3265861bfcb7f/skill/SKILL.md)
- [HTML generator](https://github.com/inhyeoklee/paper2slides-skill/blob/c30943902a6459645d894a81a6f3265861bfcb7f/library/src/paper2slides/generator.py)
- [Maintainer profile](https://github.com/inhyeoklee)
