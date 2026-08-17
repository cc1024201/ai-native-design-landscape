# AI Workflow Builder by Syeda Tooba Hasnain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project turns an unstructured description of manual business work into an editable visual automation plan. Its product is the plan graph itself rather than an executable automation.

## From prose to six visible decisions

[server.js](https://github.com/toobahasnain/ai-workflow-builder/blob/6509579908f53bdf8d029c7cc286caaf1b614846/server/server.js) sends the description to Gemini with a strict six-line response contract. The client parses numbered lines into trigger action and output nodes and connects them in order in [App.js](https://github.com/toobahasnain/ai-workflow-builder/blob/6509579908f53bdf8d029c7cc286caaf1b614846/client/src/App.js).

## Human correction happens on the projection

The resulting React Flow nodes can be moved deleted added and edited in place. Those changes live in client state; editing mutates the displayed node label and no durable serialization boundary is implemented.

## Authority ceiling

Gemini proposes a plan but integrations in the sidebar are decorative and edges do not drive execution. There is no save load version history or export path. The project therefore demonstrates delegated visual planning and correction rather than workflow automation.

## Pinned evidence

- [Repository](https://github.com/toobahasnain/ai-workflow-builder)
- [Inspected tree](https://github.com/toobahasnain/ai-workflow-builder/tree/6509579908f53bdf8d029c7cc286caaf1b614846)
- [Editable node component](https://github.com/toobahasnain/ai-workflow-builder/blob/6509579908f53bdf8d029c7cc286caaf1b614846/client/src/CustomNode.js)
