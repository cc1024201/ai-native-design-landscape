# AI Component Generator Sandbox

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project collapses the whole authoring loop into one browser page: a prompt becomes HTML and Tailwind source; that source is immediately installed into a sandbox document; the user can inspect and copy it.

## The browser owns the working artifact

[`script.ts`](https://github.com/DanielaVareiro/AI-Component-Generator-Sandbox/blob/31ca13f6e1462bb9761d8051281c555f19dfe749/ui-ai-generator/script.ts) sends the brief to Groq and extracts the model response as markup. It updates the code display and injects the same response into the preview rather than persisting a server-side project.

[`sandbox.html`](https://github.com/DanielaVareiro/AI-Component-Generator-Sandbox/blob/31ca13f6e1462bb9761d8051281c555f19dfe749/ui-ai-generator/sandbox.html) supplies the prompt form, loading state, generated-code panel and visual target. The model has broad HTML authority inside that client sandbox; the only delivery mechanism is copying the generated source.

## Practical boundary

There is no file tree, revision history, visual element mutation or deployment state. It qualifies as an independently runnable source-to-visual authoring product, but not as a managed app builder.

## Source record

- [Canonical repository](https://github.com/DanielaVareiro/AI-Component-Generator-Sandbox)
- [Inspected commit](https://github.com/DanielaVareiro/AI-Component-Generator-Sandbox/commit/31ca13f6e1462bb9761d8051281c555f19dfe749)
- [Maintainer region evidence](https://github.com/DanielaVareiro)
- Commit: `31ca13f6e1462bb9761d8051281c555f19dfe749`
