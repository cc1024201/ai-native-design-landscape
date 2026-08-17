# Nyno

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Nyno is a local-first visual AI workflow engine whose canvas and executable form meet in a .nyno YAML document. The important technical claim is not its provider positioning; it is that layout, node parameters and ordered outgoing links survive a reversible canvas-to-runtime conversion.

## React Flow compiles into a portable workflow

[reactFlowToYaml.js](https://github.com/flowagi-eu/nyno/blob/6672e1239bd9b82d793ce7aeccc6ec8b9f572851/src/functions/reactFlowToYaml.js) serializes node IDs, labels, positions, parsed configuration and position-ordered outgoing edges into the versioned Nyno YAML shape. [yamlToReactFlow.js](https://github.com/flowagi-eu/nyno/blob/6672e1239bd9b82d793ce7aeccc6ec8b9f572851/src/functions/yamlToReactFlow.js) reconstructs the editable graph.

The file is therefore both portable source and saved visual authority; it is not an image export of the canvas.

## Execution consumes the same YAML

[run-nyno-http.js](https://github.com/flowagi-eu/nyno/blob/6672e1239bd9b82d793ce7aeccc6ec8b9f572851/src/api/run-nyno-http.js) passes YAML into runYamlString, exposes synchronous and asynchronous flow routes and records task state. The GUI run control sends the current YAML rather than translating it into a separate hand-written program.

## Persistence is file-oriented

The save and load endpoints operate .nyno files by path. This provides a clear round trip and a portable artifact but no repository-level evidence of collaborative branching or rich semantic version history. That ceiling is part of the classification.

## Discovery boundary

awesome-mistral-python-nyno is an examples-and-links repository. It led to the upstream Nyno product but is not counted as an additional team or authoring system.

## Pinned evidence

- [Canonical repository](https://github.com/flowagi-eu/nyno)
- [Inspected tree](https://github.com/flowagi-eu/nyno/tree/6672e1239bd9b82d793ce7aeccc6ec8b9f572851)
- [Workflow canvas](https://github.com/flowagi-eu/nyno/blob/6672e1239bd9b82d793ce7aeccc6ec8b9f572851/src/components/WorkflowCanvas.jsx)
