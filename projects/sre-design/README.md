# SRE Design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SRE Design treats reliability architecture as a provenance-bound knowledge system. LLMs can propose gaps and operations, but deterministic re-grounding decides whether those changes become accepted topology evidence.

## YAML carries evidence and identity

At commit [`1713dc5f`](https://github.com/latent-sre/sre-design/tree/1713dc5f64d293c0e3b8a4bccf56809eecdd8406), schema-governed records describe services, interfaces, risks and source pointers. Collectors derive facts from code and operational files rather than asking the model to invent the estate.

## The model proposes pointers, not final truth

Draft prompts and gap finders return constrained changes. The pipeline re-resolves pointers against current evidence and applies trust and substance gates before persistence and publication.

## Diagrams are governed projections

Mermaid topology renderers and narration operate after the knowledge base passes its checks. This makes the visual output auditable: a node can be traced to a governed record and its evidence rather than only to a prompt.

## Evidence

- [Pinned source](https://github.com/latent-sre/sre-design/tree/1713dc5f64d293c0e3b8a4bccf56809eecdd8406)
- [Architecture pipeline](https://github.com/latent-sre/sre-design/blob/1713dc5f64d293c0e3b8a4bccf56809eecdd8406/src/sre_kb/pipeline/architecture.py)
- [LLM draft contract](https://github.com/latent-sre/sre-design/blob/1713dc5f64d293c0e3b8a4bccf56809eecdd8406/src/sre_kb/synth/draft_prompts.py)
- [Diagram renderer](https://github.com/latent-sre/sre-design/blob/1713dc5f64d293c0e3b8a4bccf56809eecdd8406/src/sre_kb/render/diagrams.py)
- [Schema registry](https://github.com/latent-sre/sre-design/blob/1713dc5f64d293c0e3b8a4bccf56809eecdd8406/src/sre_kb/schemas/registry.yaml)
