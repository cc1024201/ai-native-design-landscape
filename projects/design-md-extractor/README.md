# DESIGN.md Extractor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DESIGN.md Extractor turns observable website behavior into a portable evidence bundle for later agents. It deliberately does not call an AI model during extraction, which keeps measured browser facts distinguishable from any downstream design inference.

## A browser session produces more than one markdown file

The extractor loads real pages at desktop, tablet and mobile dimensions, scrolls to reveal lazy content and captures computed styles plus hover and focus behavior. [`collectPageEvidence.ts`](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/extract/collectPageEvidence.ts) and [`captureInteractions.ts`](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/extract/captureInteractions.ts) establish that evidence layer.

Normalization then feeds independent generators for:

- `DESIGN.md` and an AI-ready prompt;
- JSON, CSS and Tailwind token forms;
- a standalone HTML preview;
- screenshots and coverage metadata.

[`writeArtifacts.ts`](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/io/writeArtifacts.ts) writes the run bundle. The CLI, local GUI and [`mcp.ts`](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/mcp.ts) are three entry surfaces over that same extraction authority.

## Correction means rerunning against evidence

```text
URL/session settings -> responsive browser capture -> normalized evidence
-> generated artifact bundle -> inspect preview and coverage
-> adjust scope or target -> rerun -> replace/version files
```

The tool does not write back to the source website. Files are the persistent result and Git can version them; the preview is a diagnostic projection. The project is MIT-licensed. The maintainer profile reports Spain.

## Decisive sources

- [Pinned repository](https://github.com/jpoindexter/design-md-extractor/tree/6cb4230b41f0687bce0caccbe4d33f796e28e30e)
- [DESIGN.md generator](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/generate/generateDesignMd.ts)
- [Preview generator](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/src/generate/generatePreviewHtml.ts)
- [MIT license](https://github.com/jpoindexter/design-md-extractor/blob/6cb4230b41f0687bce0caccbe4d33f796e28e30e/LICENSE)
