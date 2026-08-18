# Workshop Buddy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Workshop Buddy turns a live discovery conversation into a governed solution-design project. Its defining artifact is not the decorative agent canvas: it is the linked set of accepted workshop evidence, generated solution artifacts and retained revisions.

## Intake has an explicit human commit boundary

[transcript-intake.ts](https://github.com/jamesbas/WorkshopBuddy/blob/43ae1da9fbfcfd2db9c8d39f13bdb50661b2b351/innovate-impact/src/lib/agents/transcript-intake.ts) converts pasted or uploaded transcripts into categorized candidate cards with quotes and confidence. Facilitators may edit and accept those cards; extraction does not silently write them into the workshop board.

## Eleven agents materialize a dependency-aware artifact pack

[orchestrator.ts](https://github.com/jamesbas/WorkshopBuddy/blob/43ae1da9fbfcfd2db9c8d39f13bdb50661b2b351/innovate-impact/src/lib/agents/orchestrator.ts) moves from pain points and business impact through architecture, KPIs, roadmap, executive story and an application specification. JSON schemas and prerequisite relationships constrain each stage, while custom instructions are shared deliberately across the run.

## Regeneration creates a new recoverable version

The [Prisma schema](https://github.com/jamesbas/WorkshopBuddy/blob/43ae1da9fbfcfd2db9c8d39f13bdb50661b2b351/innovate-impact/prisma/schema.prisma) persists projects, agent runs, artifacts and `ArtifactVersion` records. The regeneration route calls the same orchestrator and advances the artifact instead of overwriting history. Markdown, DOCX and PPTX renderers provide delivery from that authority.

## Product significance

This is delegated solution design with review gates: conversation evidence → accepted board state → coordinated agents → editable/versioned artifacts → developer and executive delivery. The dossier counts the product once, not each generated document type.

## Pinned evidence

- [Repository](https://github.com/jamesbas/WorkshopBuddy)
- [Inspected tree](https://github.com/jamesbas/WorkshopBuddy/tree/43ae1da9fbfcfd2db9c8d39f13bdb50661b2b351)
- [Artifact workspace](https://github.com/jamesbas/WorkshopBuddy/blob/43ae1da9fbfcfd2db9c8d39f13bdb50661b2b351/innovate-impact/src/components/artifact-workspace.tsx)
