# WebAI by Sparsh Joshi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

WebAI is a Bolt-derived source workspace whose independent contribution sits at delivery. Users generate and repair project files in a browser workbench, run them through WebContainers, then create a GitHub repository and initiate Vercel deployment from the same product surface.

## The source tree crosses three authorities

Pinned revision: `9a0b5f7b8bd9130b3f2ce9688a7708c0bc0f5551`.

The editor's current file map drives WebContainer preview. Git integration materializes a repository copy, and the deploy service sends a selected source state to Vercel. Those are distinct authorities: a successful preview does not mean Git contains the same files, and a repository update does not by itself prove the deployed URL moved.

WebAI also exposes correction behavior around generation/runtime failures. That makes the preview an evidence-producing feedback loop rather than a decorative screenshot.

## Why shared UI does not make it a duplicate

The chat and editor retain recognizable Bolt ancestry, which the identity map records. The implemented GitHub creation, isomorphic-git flow and direct Vercel handoff change the ordinary user's completion path enough to retain WebAI as a derived canonical project.

## Recovery limit

No independently verified version ledger was found in the inspected tree. Git can become durable authority only after a successful push; before that, browser workspace state remains vulnerable to reload or runtime loss.

## Pinned evidence

- [Repository](https://github.com/Sparshjoshi-iit/WebAI)
- [Chat and file handoff](https://github.com/Sparshjoshi-iit/WebAI/blob/9a0b5f7b8bd9130b3f2ce9688a7708c0bc0f5551/frontend/src/components/chatPanel.tsx)
- [WebContainer hook](https://github.com/Sparshjoshi-iit/WebAI/blob/9a0b5f7b8bd9130b3f2ce9688a7708c0bc0f5551/frontend/src/hooks/useWebContainer.ts)
- [Deployment service](https://github.com/Sparshjoshi-iit/WebAI/blob/9a0b5f7b8bd9130b3f2ce9688a7708c0bc0f5551/frontend/src/services/deploy.ts)
