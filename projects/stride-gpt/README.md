# STRIDE GPT

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

STRIDE GPT uses diagrams as threat-model evidence. The visual artifact is not decoration: saved structure becomes input to the security analysis that follows.

## Two diagram authorities

At commit [`536ee306`](https://github.com/mrwadams/stride-gpt/tree/536ee3064b782a8693d3b940a113bcf17b7622ce), the application can embed draw.io and retain its XML, or work with Mermaid source for a data-flow diagram. Each path remains editable in its native representation.

## Analysis consumes the model

The system parses diagram content into threat-model context and joins it with application details before STRIDE analysis. Diagram variants therefore change the reasoning substrate rather than merely the report layout.

## Product boundary

STRIDE GPT is counted as a visual decision and verification workspace: users build or revise a system representation to evaluate threats. It is not counted as an autonomous general-purpose diagram generator.

## Evidence

- [Pinned implementation](https://github.com/mrwadams/stride-gpt/tree/536ee3064b782a8693d3b940a113bcf17b7622ce)
- [Application entry and diagram workflow](https://github.com/mrwadams/stride-gpt/blob/536ee3064b782a8693d3b940a113bcf17b7622ce/main.py)
- [Threat-model persistence tests](https://github.com/mrwadams/stride-gpt/blob/536ee3064b782a8693d3b940a113bcf17b7622ce/tests/test_persistence.py)
- [Variant tests](https://github.com/mrwadams/stride-gpt/blob/536ee3064b782a8693d3b940a113bcf17b7622ce/tests/test_variants.py)
