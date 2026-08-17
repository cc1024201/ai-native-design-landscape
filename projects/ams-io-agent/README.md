# AMS-IO-Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AMS-IO-Agent specializes the broad Virtuoso-agent idea into IO-ring design. A model plans pad topology and tool actions while Cadence SKILL generation DRC LVS PEX and intent-graph checks constrain the result.

## An intent graph precedes native EDA materialization

At commit [`046a2e3`](https://github.com/Arcadia-1/AMS-IO-Agent/tree/046a2e3edccd76322ab3e47c4dd9a5a1eded1e8a) benchmark cases pair an [`io_ring_intent_graph.json`](https://github.com/Arcadia-1/AMS-IO-Agent/blob/046a2e3edccd76322ab3e47c4dd9a5a1eded1e8a/AMS-IO-Bench/28nm_wirebonding/golden_output/IO_28nm_10x10_double_ring_multi_voltage_domain/io_ring_intent_graph.json) with generated SKILL and a schematic screenshot. The graph preserves requirements such as ring geometry voltage domains and pad relationships before layout commands execute.

Multi-provider agents can reason over knowledge bases and screenshots and query task history. Native Cadence objects plus verification reports are the engineering authority; screenshots are review evidence and the intent graph is the replayable design contract.

A licensed Virtuoso/PDK environment is needed for full execution. Public source proves golden cases and orchestration but not production sign-off. The owner profile supplies Beijing coordinates and supports a China region attribution.

## Pinned sources

- [Main agent entry](https://github.com/Arcadia-1/AMS-IO-Agent/blob/046a2e3edccd76322ab3e47c4dd9a5a1eded1e8a/main.py)
- [Benchmark suite](https://github.com/Arcadia-1/AMS-IO-Agent/tree/046a2e3edccd76322ab3e47c4dd9a5a1eded1e8a/AMS-IO-Bench)
- [Pinned README](https://github.com/Arcadia-1/AMS-IO-Agent/blob/046a2e3edccd76322ab3e47c4dd9a5a1eded1e8a/README.md)
