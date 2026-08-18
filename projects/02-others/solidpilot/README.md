# SolidPilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SolidPilot is the product architecture in `eyfel/mcp-server-solidworks`. Its decisive contribution is a Feature Graph intermediate representation between an agent's engineering intent and the low-level SolidWorks automation API.

## The IR makes intent testable

[`ir_schema.py`](https://github.com/eyfel/mcp-server-solidworks/blob/a81d12ba3752d6282c42a4922e87db8dc26b3f69/compiler/solidworks/pycompiler/ir_schema.py) defines the semantic graph. [`compiler.py`](https://github.com/eyfel/mcp-server-solidworks/blob/a81d12ba3752d6282c42a4922e87db8dc26b3f69/compiler/solidworks/pycompiler/compiler.py) resolves and lowers it into an execution plan; a C# execution service runs that plan against SolidWorks. Low-level MCP calls still exist, but the IR path supports deterministic compilation and analysis before mutation.

Round-trip evaluation compares intended features and dimensions with measured SolidWorks state. That feedback is more important than the MCP transport: it detects when syntactically successful automation produced the wrong physical model. No reliable first-party location was found, so region remains unknown.

## Evidence

- [Pinned repository](https://github.com/eyfel/mcp-server-solidworks/tree/a81d12ba3752d6282c42a4922e87db8dc26b3f69)
- [Master architecture](https://github.com/eyfel/mcp-server-solidworks/blob/a81d12ba3752d6282c42a4922e87db8dc26b3f69/master-architecture.md)
- [Compiler architecture](https://github.com/eyfel/mcp-server-solidworks/blob/a81d12ba3752d6282c42a4922e87db8dc26b3f69/compiler/solidworks/architecture.md)
- [SolidWorks execution service](https://github.com/eyfel/mcp-server-solidworks/tree/a81d12ba3752d6282c42a4922e87db8dc26b3f69/execution/solidworks/SolidworksExecution)
