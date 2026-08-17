# Wasserman's Unofficial DaVinci MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Wasserman's Unofficial DaVinci MCP is an agent editing and finishing system with two honest authority modes. With Resolve Studio it inspects and mutates the open native project; without live scripting it materializes FCPXML, EDL, marker, LUT and mix artifacts for one-step import into the free editor.

## Creative engines produce inspectable plans before host mutation

[`tools_live.py`](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/davinci_mcp/tools_live.py) reaches media pools, timelines, markers, LUTs and render jobs through Resolve's scripting API. [`tools_interchange.py`](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/davinci_mcp/tools_interchange.py) keeps the fallback path explicit instead of claiming unavailable control. Mutating workflows return dry-run plans and require confirmation.

Deterministic engines handle facts an LLM should not invent: [`beat_grid.py`](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/engines/beat_grid.py), color transforms, dialogue keep ranges and loudness measurements. [`grade_timeline.py`](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/engines/grade_timeline.py) evaluates a reference match and lowers strength until gates pass or flags `needs_human`. Plans, previews and interchange files are evidence; the Resolve project remains the live edit authority.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/unofficial-davinci-mcp/tree/22580fb5b35c280aeac05923f6ca784c620a0dc2)
- [MCP server and tool schemas](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/davinci_mcp/server.py)
- [Reference color engine](https://github.com/wassermanproductions/unofficial-davinci-mcp/blob/22580fb5b35c280aeac05923f6ca784c620a0dc2/engines/color_match.py)
