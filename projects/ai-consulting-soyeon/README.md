# AI Consulting Workflow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This repository defines Design as a staged consulting process that turns interviews and analysis into reviewable business-automation artifacts. Its most distinctive visual output is a Power Automate flow package rather than a freeform canvas.

## Confirmation gates organize the workflow

At [`ec01f4a`](https://github.com/SoyeonAhn3/AI_Consulting/tree/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd), phase documents require user confirmation before moving from requirements to core analysis, deliverable generation, quality verification and flow design.

## Several artifacts carry different authority

The workflow writes text and Excel reports, an ASCII process diagram, a Power Automate Copilot prompt and Blueprint JSON. The JSON is explicitly described as a design blueprint rather than guaranteed importable flow source; the recipient still builds or verifies the actual automation in Power Automate.

## Why this is not counted as a generic prompt pack

Templates, scripts and exception checklists form a repeatable delivery protocol with named review gates. The system governs a design handoff even though it does not provide its own runtime editor.

## Evidence

- [Pinned repository](https://github.com/SoyeonAhn3/AI_Consulting/tree/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd)
- [Workflow overview](https://github.com/SoyeonAhn3/AI_Consulting/blob/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd/README.md)
- [Deliverable phase](https://github.com/SoyeonAhn3/AI_Consulting/blob/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd/Phase/Phase3_%EC%82%B0%EC%B6%9C%EB%AC%BC%EC%83%9D%EC%84%B1.md)
- [Quality gate](https://github.com/SoyeonAhn3/AI_Consulting/blob/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd/Phase/Phase4_%ED%92%88%EC%A7%88%EA%B2%80%EC%A6%9D.md)
- [Power Automate design phase](https://github.com/SoyeonAhn3/AI_Consulting/blob/ec01f4af8b9510e3ee843ddf25fe6d405ade6ccd/Phase/Phase5_PA%ED%94%8C%EB%A1%9C%EC%9A%B0%EC%84%A4%EA%B3%84.md)
