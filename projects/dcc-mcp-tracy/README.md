# DCC-MCP Tracy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Tracy is a performance-evidence product for instrumented games, engines and creative runtimes. It controls Tracy's official capture and CSV export binaries; it does not inject instrumentation or claim that an uninstrumented application can be profiled.

## Trace authority and summary projection are separate

[`capture_trace.py`](https://github.com/dcc-mcp/dcc-mcp-tracy/blob/a5e29b7bcef28ccd6a2ee17667dbdbcb7c45b119/src/dcc_mcp_tracy/skills/tracy-capture/scripts/capture_trace.py) writes the durable `.tracy` artifact from a named client address. Analysis first exports official CSV and then computes bounded summaries such as high-variance zones. The raw trace remains available when a summary needs to be challenged or recalculated.

Subprocesses use `shell=False`, accepted extensions are validated and official Windows releases can be cached with an opt-out. This makes the adapter suitable for comparing revisions or acceptance runs without confusing profiler data with the source scene or game build that produced it.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-mcp-tracy/tree/a5e29b7bcef28ccd6a2ee17667dbdbcb7c45b119)
- [Capture Skill](https://github.com/dcc-mcp/dcc-mcp-tracy/blob/a5e29b7bcef28ccd6a2ee17667dbdbcb7c45b119/src/dcc_mcp_tracy/skills/tracy-capture/SKILL.md)
- [Analysis contract](https://github.com/dcc-mcp/dcc-mcp-tracy/blob/a5e29b7bcef28ccd6a2ee17667dbdbcb7c45b119/src/dcc_mcp_tracy/skills/tracy-analysis/SKILL.md)
