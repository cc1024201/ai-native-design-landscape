# ScriptBreak

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ScriptBreak makes screenplay analysis a governed pre-production artifact. A project joins the imported script to editable scenes, elements, characters, locations, bibles, shot lists, schedules, a timeline and a project look; multiple drafts can be compared without losing the production model built around them.

## The project file is the authority; AI is a portable export

The application in [`src/index.html`](https://github.com/wassermanproductions/scriptbreak/blob/ed9efb86125b713ce430b7337f27392adec071a9/src/index.html) persists `.scriptbreak` as readable JSON. Automated extraction supplies a starting breakdown, but every result can be corrected or cleared and explicit script shots retain their provenance. Visual DNA and bibles travel with later work as binding constraints rather than remaining prose in one chat.

Instead of holding a model credential, ScriptBreak compiles self-executing Markdown prompt packs containing the selected scene range, shot facts, characters and style contract. The [MCP server](https://github.com/wassermanproductions/scriptbreak/blob/ed9efb86125b713ce430b7337f27392adec071a9/mcp/scriptbreak-mcp.mjs) reads the saved project and reproduces those scoped exports, schedules and breakdown queries; its read-only project access prevents an agent from silently rewriting the editorial source.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/scriptbreak/tree/ed9efb86125b713ce430b7337f27392adec071a9)
- [Product and file-format contract](https://github.com/wassermanproductions/scriptbreak/blob/ed9efb86125b713ce430b7337f27392adec071a9/README.md)
- [Agent interface](https://github.com/wassermanproductions/scriptbreak/blob/ed9efb86125b713ce430b7337f27392adec071a9/mcp/README.md)
