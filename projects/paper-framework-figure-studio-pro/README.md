# Paper Framework Figure Studio Pro

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Paper Framework Figure Studio Pro is a packaged ChatGPT workflow for turning a paper's facts into reviewed framework-figure candidates. It defines Design primarily as staged direction selection under an auditable prompt contract, not as native vector editing.

## S0–S5 moves review before image generation

S0 extracts the paper foundation. S1 defines reader path, semantic graph, render graph, visible-text rules, line-carried variables and negative constraints before S2 generates exploratory candidates. S3 records issues and selects a direction. S4 prepares and audits the final candidate briefs; S5 generates the final candidate images.

The two candidate sets (`C01–C04`, then `F01–F02`) make alternatives coexist and preserve a human choice between exploration and convergence. The assistant explicitly stops at S5; final selection and manual completion remain human work.

## Artifact authority and honest ceiling

Prompt packages, issue ledgers and checkpoints carry the decision trail. Generated images are review candidates, not an editable graph. The project notes that prompts can later inform manual SVG or PowerPoint reconstruction, but it does not claim that the default output is editable SVG/PPTX.

## Evidence boundary

The repository publishes architecture, examples and versioned skill archives rather than browsable extracted implementation files. The workflow can therefore be verified at its documented stage and artifact boundary, while private ChatGPT image-generation behavior and the archive's executed runtime remain outside source-level inspection.

- [Pinned project revision](https://github.com/c-narcissus/paper-framework-figure-studio-pro/tree/77557418b4ca8c24fa8961206bf9b8f7f6d030e1)
- [S0–S5 workflow and artifact contract](https://github.com/c-narcissus/paper-framework-figure-studio-pro/blob/77557418b4ca8c24fa8961206bf9b8f7f6d030e1/README.md)
- [Published workflow architecture image](https://github.com/c-narcissus/paper-framework-figure-studio-pro/blob/77557418b4ca8c24fa8961206bf9b8f7f6d030e1/3.2.15b_figure/paper-figure-studio-skill-workflow-architecture_v3.2.15b_en.png)
