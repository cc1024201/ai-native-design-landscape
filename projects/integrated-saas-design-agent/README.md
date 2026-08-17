# Integrated SaaS Design Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Integrated SaaS Design Agent treats interface design as a search-and-selection problem. It does not begin with one canvas and polish it. It generates structurally different HTML wireframe candidates, renders evidence for each, rejects failures, compares survivors and optionally synthesizes the best directions.

## The run directory is a decision record

[`integrated_pipeline.py`](https://github.com/ashishbishnoi18/saas-design-agent-integrated/blob/943f9ec9fc7c343621132c9fb54887a022c277e0/integrated_pipeline.py) converts a raw brief into a schema-checked strategic diagnosis, runs deterministic and model validation with a repair pass, and forwards approved strategy seeds into the architect harness. Each run directory retains the diagnosis, gate result, per-strategy specification, HTML wireframe, viewport screenshots, check JSON, verdicts, tournaments and final ranking.

The authoritative artifact is therefore a candidate set plus its evaluation trail, not merely the top screenshot. A winning HTML file remains an architecture-grade gray-box wireframe; the repository explicitly does not call it production frontend code.

## Generation and observation use different agents

The [`architect evaluator harness`](https://github.com/ashishbishnoi18/saas-design-agent-integrated/blob/943f9ec9fc7c343621132c9fb54887a022c277e0/architect-evaluator/harness.py) launches isolated Claude Code architect runs that write specs and HTML into the run directory. Playwright then renders desktop, tablet and mobile evidence and deterministic checks can block a candidate before model scoring.

Gemini, OpenAI, Anthropic, Claude CLI or Codex CLI adapters can judge the spec, source, screenshots and check output. Optional specialist panels score different concerns; blind pairwise comparison withholds prior verdicts and source rationale so screenshot preference is tested separately. Pairwise tournaments and top-K synthesis turn evaluation into selection pressure rather than a single self-critique.

## Human ranking is calibration data

[`record_human_ranking.py`](https://github.com/ashishbishnoi18/saas-design-agent-integrated/blob/943f9ec9fc7c343621132c9fb54887a022c277e0/architect-evaluator/record_human_ranking.py) stores a human order beside the model order, rationale and failure tags. A separate exporter derives pairwise preference records. This is a feedback dataset contract, not evidence that the repository already fine-tunes a model.

## Boundary

Visual-design and frontend-implementation directories are downstream prompt scaffolds. The verified core ends at diagnosis-driven wireframe search, evidence capture, repair, ranking and optional synthesis. Runs are filesystem artifacts; there is no shared multi-user merge protocol or canonical native design graph.

## Evidence

- [Pinned repository](https://github.com/ashishbishnoi18/saas-design-agent-integrated/tree/943f9ec9fc7c343621132c9fb54887a022c277e0)
- [Programmatic visual-check contract](https://github.com/ashishbishnoi18/saas-design-agent-integrated/blob/943f9ec9fc7c343621132c9fb54887a022c277e0/frontend-implementer/verification/playwright_visual_checks.md)
