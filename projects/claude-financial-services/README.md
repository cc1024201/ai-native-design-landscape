# Claude for Financial Services

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude for Financial Services is an official vertical agent distribution in which presentation and spreadsheet work are governed professional artifacts rather than incidental chat attachments. The suite installs in Cowork or deploys the same prompts and skills through Managed Agents.

## Analyst work product has explicit authoring and sign-off boundaries

The separately named Pitch Agent assembles comps, precedents and LBO analysis into a branded deck; the shared financial-analysis bundle supplies deck refresh, deck QC and headless PPTX authoring. Source skills are synchronized into self-contained agent packages, while [`agent.yaml`](https://github.com/anthropics/financial-services/blob/38652224c10610fa52eee2acee3ac712dcff01f2/managed-agent-cookbooks/market-researcher/agent.yaml) manifests bind workers into deployable workflows.

Native PowerPoint and Excel files are the durable work product. Agents stage them for qualified human review rather than claiming transaction or accounting authority. The repository is counted once at its shared product and release boundary, not once for every bundled analyst role.

## Evidence

- [Pinned official repository](https://github.com/anthropics/financial-services/tree/38652224c10610fa52eee2acee3ac712dcff01f2)
- [Pitch Agent package](https://github.com/anthropics/financial-services/tree/38652224c10610fa52eee2acee3ac712dcff01f2/plugins/agent-plugins/pitch-agent)
- [Financial-analysis skill bundle](https://github.com/anthropics/financial-services/tree/38652224c10610fa52eee2acee3ac712dcff01f2/plugins/vertical-plugins/financial-analysis)
- [Anthropic organization profile: United States](https://github.com/anthropics)
