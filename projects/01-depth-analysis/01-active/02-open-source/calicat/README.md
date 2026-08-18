# Calicat

Calicat treats design not as a single mockup but as a product iteration that must hold prototype, requirements and delivery tracking together. Its file contract recommends a [file per major product iteration](https://help.calicat.cn/quickStart/createFile), with smaller iterations split across canvases inside that same file — so the unit of design is the whole connected workspace, and the AI is expected to work inside it rather than return a flat screenshot.

## The AI has a graph, not just a prompt box

The [AI assistant](https://help.calicat.cn/aiAssistant/aiAssistant) is tooled to the canvas's own structure — layers, requirement lists, requirement-card content, interaction data — and can attach a selected layer, an image, or an extracted webpage as scope. It then draws frames, edits a target layer, creates requirement cards, and wires prototype interactions. Two control loops share that graph: a foreground assistant that mutates the live canvas under undo/redo, and background **Agents** invoked by `@Calicat AI` in an anchored comment that can run in parallel after the editor closes. Large work tends to produce a candidate copy for one-click apply rather than overwriting directly; the [pricing guide](https://help.calicat.cn/) prices exactly that multi-step tool sequence.

## Native layers hold authority; exports are projections

AI output lands as editable auto-layout containers obeying the same clipping and layout rules as human content ([prototype guide](https://help.calicat.cn/quickStart/quickDesignAPrototype)). Page designs export as raster, never as HTML or another tool format, and developer handoff flows through the Calicat [MCP server](https://help.calicat.cn/frequentlyAskedQuestions) — so the file graph is the working authority and bitmap/MCP are outward representations. Recovery is layered: undo/redo for live edits, copied pages and cloned canvases as coarse branches, and a durable historical-snapshot system that release notes keep repairing ([release notes](https://help.calicat.cn/releaseNote)).

## The changelog draws the acceptance boundary

Calicat's release notes are unusually candid: AI has used wrong ids, emitted invalid data, partially failed multi-tool calls, moved objects into frames where they disappeared, and been truncated by an external agent's output limit. The lesson drawn is that "design done" cannot mean "chat reported success" — the resulting layers, hierarchy, interactions, requirement links and export/MCP handoff must each be inspected. Deletion behavior confirms the coupling is real but not atomic: deleting a canvas used to strand its linked requirement cards, now relocated to the first canvas.

## Team boundary without a guessed squad

Calicat and ProcessOn are the same Beijing company's separate products ([ProcessOn about](https://www.processon.com/about)); the record names the company umbrella but not a precise internal squad, headcount, or shared infrastructure.

- **Established:** AI reads and mutates structured canvas objects; background agents run asynchronously; layers stay editable; undo/copies/snapshots/exports/MCP all exist.
- **Unknown:** renderer and collaboration internals, storage schema, snapshot retention, tool authorization, exact one-click-apply merge semantics.

Key sources: [Calicat product page](https://www.calicat.cn/) · [AI design assistant and background Agents](https://help.calicat.cn/aiAssistant/aiAssistant) · [File and canvas model](https://help.calicat.cn/quickStart/createFile) · [Prototype components and auto layout](https://help.calicat.cn/quickStart/quickDesignAPrototype) · [FAQ, export and MCP boundaries](https://help.calicat.cn/frequentlyAskedQuestions) · [Release notes](https://help.calicat.cn/releaseNote) · [ProcessOn company attribution](https://www.processon.com/about)
