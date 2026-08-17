# Litho

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Litho, whose repository is still named `deepwiki-rs`, defines diagramming as one stage in an agentic code-documentation build. It researches a repository, composes durable pages and then repairs diagram output when needed.

## Research precedes rendering

At [`b73244a4`](https://github.com/sopaco/deepwiki-rs/tree/b73244a4520b19f28e275f27e5e234c5b6637e7d), specialized researchers inspect system context, workflows and key modules. Composer agents turn that evidence into architecture, database and workflow documentation.

## Diagram correction is a separate responsibility

C4 and Mermaid source are written into the documentation output. A dedicated outlet fixer reviews and revises generated content rather than treating model text as automatically valid. The filesystem remains the authority throughout.

## Product identity and scope

The current product name is Litho; `deepwiki-rs` is retained as a repository alias. This record covers the documentation-generation system once and does not count each specialist agent as a separate product.

## Evidence

- [Pinned source](https://github.com/sopaco/deepwiki-rs/tree/b73244a4520b19f28e275f27e5e234c5b6637e7d)
- [Generation workflow](https://github.com/sopaco/deepwiki-rs/blob/b73244a4520b19f28e275f27e5e234c5b6637e7d/src/generator/workflow.rs)
- [Architecture composer](https://github.com/sopaco/deepwiki-rs/blob/b73244a4520b19f28e275f27e5e234c5b6637e7d/src/generator/compose/agents/architecture_editor.rs)
- [Output fixer](https://github.com/sopaco/deepwiki-rs/blob/b73244a4520b19f28e275f27e5e234c5b6637e7d/src/generator/outlet/fixer.rs)
