# Gemini Resume Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Gemini Resume Builder defines design as controlled transformation of a typed resume rather than free-form document generation. It keeps the accepted resume separate from an AI candidate until the user explicitly applies or discards the proposal.

## Resume JSON is the durable authority

[`resume.ts`](https://github.com/OmKshirsagar/AI-Resume-Builder/blob/56a5b7d567212019dc5f0eb8392518697cf70673/src/schemas/resume.ts) provides the Zod contract for identity experience skills and presentation fields. [`useResumeStore.ts`](https://github.com/OmKshirsagar/AI-Resume-Builder/blob/56a5b7d567212019dc5f0eb8392518697cf70673/src/store/useResumeStore.ts) persists both the original state and a candidate draft. PDF import extracts structured data into that same model rather than treating the uploaded PDF as the only editable artifact.

## Four roles make transformation inspectable

The Mastra workflow separates Audit Architect Fabricator and Stylist responsibilities. Audit identifies weaknesses; Architect allocates a change budget and plan; Fabricator produces a schema-valid candidate; Stylist adjusts visual presentation. [`fabricator.ts`](https://github.com/OmKshirsagar/AI-Resume-Builder/blob/56a5b7d567212019dc5f0eb8392518697cf70673/src/mastra/workflows/fabricator.ts) implements the staged handoff instead of hiding every decision inside one prompt.

## Promotion is explicit

The UI previews the candidate alongside editable form fields. Apply promotes it into accepted state; Discard restores the prior authority. This preserves user intent and makes AI output reversible before it changes the deliverable.

## A4 rendering is downstream of structured state

The preview components render live pages from resume JSON and React PDF produces the delivered file. PDF output is not round-tripped as the editing model. This keeps content and layout choices revisable while accepting that arbitrary PDF typography and geometry are outside the schema.

## Evidence

- [Repository](https://github.com/OmKshirsagar/AI-Resume-Builder)
- [Pinned tree](https://github.com/OmKshirsagar/AI-Resume-Builder/tree/56a5b7d567212019dc5f0eb8392518697cf70673)
- [Resume builder interface](https://github.com/OmKshirsagar/AI-Resume-Builder/blob/56a5b7d567212019dc5f0eb8392518697cf70673/src/components/ResumeBuilder.tsx)
