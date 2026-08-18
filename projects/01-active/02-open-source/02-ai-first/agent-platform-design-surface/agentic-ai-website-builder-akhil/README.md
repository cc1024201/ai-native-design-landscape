# Agentic AI Website Builder by Akhil Maratha

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Akhil's repository contains both a deterministic agent-pipeline experiment and a real OpenRouter chat workspace. Inclusion rests on the ordinary-user chat route whose structured model response becomes editable project files and complete Mongo versions.

## The live chat path requires a provider

[chat/route.ts](https://github.com/akhilmaratha/Agentic-AI-Website-Builder/blob/c1a99293469ab566ace71aecfc2fbcf197211ed8/app/api/chat/route.ts) calls an OpenAI-compatible endpoint and parses a JSON response containing files and reply text. With no key it returns an error; deterministic local templates are used only behind an explicit fallback switch after provider failure.

## Preview is constructed from accepted source

The same route builds an HTML or Babel-wrapped React preview from the returned main file. [PreviewPanel.tsx](https://github.com/akhilmaratha/Agentic-AI-Website-Builder/blob/c1a99293469ab566ace71aecfc2fbcf197211ed8/components/PreviewPanel.tsx) displays that output beside the source workspace.

## Project files and versions have separate records

[models/index.ts](https://github.com/akhilmaratha/Agentic-AI-Website-Builder/blob/c1a99293469ab566ace71aecfc2fbcf197211ed8/server/models/index.ts) defines current files, chat and Version snapshots. [versions/restore/route.ts](https://github.com/akhilmaratha/Agentic-AI-Website-Builder/blob/c1a99293469ab566ace71aecfc2fbcf197211ed8/app/api/projects/%5BprojectId%5D/versions/restore/route.ts) writes a selected complete snapshot back into current project state.

## Evidence

- [Canonical repository](https://github.com/akhilmaratha/Agentic-AI-Website-Builder)
- [Inspected tree](https://github.com/akhilmaratha/Agentic-AI-Website-Builder/tree/c1a99293469ab566ace71aecfc2fbcf197211ed8)
- Commit: c1a99293469ab566ace71aecfc2fbcf197211ed8
