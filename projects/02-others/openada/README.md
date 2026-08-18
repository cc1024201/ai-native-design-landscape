# OpenADA

> Research status: **Source-level** · Lifecycle: **active early preview** · Last reviewed: **2026-08-12**

OpenADA defines a semantic boundary between design agents and deterministic electronic-design-automation tools. An agent submits versioned engineering intent; native drivers execute it; compact evidence and provenance return for the next design decision while native files remain authoritative.

## A narrow contract prevents plausible summaries from becoming evidence

The [`semantic model`](https://github.com/simra-tech/OpenADA/blob/d4298edce1164e5cb87558a366fcbf7057e8e989/docs/SEMANTIC_MODEL.md) separates operation, assertion, capability, result and artifact lineage. Schemas distinguish process completion from engineering pass status. Drivers for ngspice, Xyce, KLayout, Netgen, Yosys, OpenROAD and related tools translate the shared intent into native commands and outputs.

The implemented CLI chain can simulate, extract exact series, measure spectral or transfer properties and evaluate a specification without stripping provenance. Experimental engineering skills compose those operations but cannot convert unavailable evidence into a pass. MCP and remote sessions are explicitly future adapters and are not reported as implemented.

The organization profile identifies Germany.

## Evidence

- [Pinned repository](https://github.com/simra-tech/OpenADA/tree/d4298edce1164e5cb87558a366fcbf7057e8e989)
- [Result schemas](https://github.com/simra-tech/OpenADA/tree/d4298edce1164e5cb87558a366fcbf7057e8e989/schemas)
- [Driver providers](https://github.com/simra-tech/OpenADA/tree/d4298edce1164e5cb87558a366fcbf7057e8e989/providers)
- [Organization profile](https://github.com/simra-tech)
