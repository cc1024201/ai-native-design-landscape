# CRIMETRYX AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CRIMETRYX AI is a forensic decision workspace, not a general workflow builder. A case, its spatial evidence and accumulated hypotheses are the durable authority; a fixed visual sequence of specialist agents helps an investigator turn that authority into competing interpretations and a report.

## The canvas coordinates analysis rather than authoring topology

[WorkflowCanvasPage.jsx](https://github.com/AR-droid/CRIMETRYX-AI/blob/9644ad19932ceba53899f4dab0bf5082ba4ee257/frontend/src/pages/WorkflowCanvasPage.jsx) places four predefined agents—scene interpreter, evidence reasoner, timeline builder and hypothesis challenger—on an inspectable graph. Users can run them individually or in order and open each structured result, but cannot add or reconnect agents.

## Model output is grounded in case state

[agents.py](https://github.com/AR-droid/CRIMETRYX-AI/blob/9644ad19932ceba53899f4dab0bf5082ba4ee257/backend/agents.py) sends case geometry, evidence and prior agent results to Groq with per-stage JSON contracts. The challenger consumes generated scenarios instead of producing an unrelated chat answer.

## Persistence follows forensic objects

[app.py](https://github.com/AR-droid/CRIMETRYX-AI/blob/9644ad19932ceba53899f4dab0bf5082ba4ee257/backend/app.py) stores cases, evidence, agent logs and hypotheses, supports rerunning individual agents and generates a PDF case report. The working artifact is therefore a reviewable case record, while the graph is its coordination projection.

## Evidence ceiling

The topology and agent roles are product-defined, and model output is not itself verified forensic truth. Inclusion establishes a visual AI decision and coordination loop, not an end-user programmable agent platform.

## Pinned evidence

- [Repository](https://github.com/AR-droid/CRIMETRYX-AI)
- [Inspected tree](https://github.com/AR-droid/CRIMETRYX-AI/tree/9644ad19932ceba53899f4dab0bf5082ba4ee257)
- [Case models](https://github.com/AR-droid/CRIMETRYX-AI/blob/9644ad19932ceba53899f4dab0bf5082ba4ee257/backend/models.py)
