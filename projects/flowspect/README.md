# FlowSpect

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FlowSpect treats an exported visual-agent graph as a governable engineering artifact. It is not another canvas and it never runs the agent; its product loop is export → normalize → inspect paths → return actionable findings before deployment.

## The artifact boundary is deliberately outside the builder

The four importers read Langflow, Dify, Flowise and n8n exports and translate them into one typed graph. [ir.py](https://github.com/Lonkins/flowspect/blob/83e1d4694eb7b9f95a9f350eb8e4b10017fefe49/src/flowspect/ir.py) preserves nodes, ports, edge kinds, capabilities and source format, so the reviewed object is the workflow topology rather than screenshots or builder metadata.

## Governance is path-sensitive

[engine.py](https://github.com/Lonkins/flowspect/blob/83e1d4694eb7b9f95a9f350eb8e4b10017fefe49/src/flowspect/engine.py) propagates taint through data and tool edges, stops at sanitizers and reconstructs canonical source-to-sink paths. YAML rules can therefore express constraints such as untrusted input reaching code execution, credential-bearing nodes feeding outbound requests, or unauthenticated triggers reaching state-changing actions.

## The decision artifact is portable

The CLI emits terminal, JSON or SARIF results with the offending node path and remediation. This makes the same graph review usable by a person, a CI gate or GitHub code scanning without requiring model credentials or the original builder runtime.

## Evidence ceiling

FlowSpect qualifies as a visual-agent verification workspace, not as an AI runtime or visual authoring environment. Its design contribution is the common IR and enforceable constraint layer around artifacts authored elsewhere.

## Pinned evidence

- [Repository](https://github.com/Lonkins/flowspect)
- [Inspected tree](https://github.com/Lonkins/flowspect/tree/83e1d4694eb7b9f95a9f350eb8e4b10017fefe49)
- [CLI and output contract](https://github.com/Lonkins/flowspect/blob/83e1d4694eb7b9f95a9f350eb8e4b10017fefe49/src/flowspect/cli.py)
