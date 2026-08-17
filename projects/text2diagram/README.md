# DiagramAI / text2diagram

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

text2diagram defines AI diagramming as a Mermaid micro-SaaS: source stays visible, the Mermaid runtime judges it, and export happens from the rendered result. Its commercial identity layer is more developed than its artifact storage layer, an important distinction hidden by the broad “Firebase backend” description.

## The ordinary product path has one browser-local source

At commit [`3edfbcd8`](https://github.com/Ad1tyaD/text2diagram/tree/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8), [`Editor.tsx`](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/components/editor/Editor.tsx) holds one Mermaid string. Typing, choosing the built-in starting example and accepting AI output all replace that same state. Every change is written to a single `diagram-code` local-storage key, so refresh recovery exists but named projects and revisions do not.

[`MermaidPreview.tsx`](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/components/editor/MermaidPreview.tsx) debounces edits, calls the real `mermaid.parse` gate, then renders SVG. Failed model syntax is corrected in the visible textarea. The renderer uses loose security and HTML labels, so pasted or generated source is also a browser rendering trust boundary.

## AI generation is server-side, but the UI has one active provider

[`generate/route.ts`](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/app/api/ai/generate/route.ts) contains OpenAI and Gemini branches and removes common code fences. The shipped [generation dialog](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/components/editor/AIGenerateDialog.tsx), however, always requests OpenAI. It sends a single prompt to GPT-4o mini and replaces the editor with the response; it does not pass current source for targeted revision or maintain a multi-turn diagram conversation.

The API credentials stay on the Next.js server. Access to the dialog is gated in the client by Firebase sign-in and a Firestore `subscription_status` check.

## Firebase identifies customers, not diagram projects

[`firebase-utils.ts`](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/lib/firebase-utils.ts) reads and creates only `users/{uid}` profile records with email and subscription status. No source path writes Mermaid, project metadata or revisions to Firestore. The actual diagram remains in local storage regardless of authentication.

This makes the persistence boundary precise:

- Firebase owns identity and the Pro entitlement used to unlock generation;
- the browser owns the current Mermaid source;
- the repository explicitly lists share links, version history, autosave and AI text-to-edit as future features.

## Exports are rendered derivatives

[`ExportToolbar.tsx`](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/components/editor/ExportToolbar.tsx) downloads a high-resolution PNG, serializes/downloads SVG, or copies PNG to the clipboard. It does not provide a Mermaid-source download. Those files faithfully derive from the currently rendered source, but they are delivery outputs rather than a portable editable project.

text2diagram contributes a familiar but useful definition: AI is a premium source bootstrap inside a conventional compiler-like editor. Its evidence also prevents a category error—having Firebase authentication does not make the diagram a cloud-managed artifact.

## Evidence

- [Pinned repository and stated roadmap](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/README.md)
- [Current-source lifecycle](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/components/editor/Editor.tsx)
- [Server AI provider boundary](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/app/api/ai/generate/route.ts)
- [Actual Firestore scope](https://github.com/Ad1tyaD/text2diagram/blob/3edfbcd8a27c5b0c19c437eabed0a8b7b218c3b8/lib/firebase-utils.ts)
