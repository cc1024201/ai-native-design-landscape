# AI Website Generator by Shaxxshankari

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator accepts three grounding modes—plain brief, reference screenshot and Figma-derived context—but converges all of them on website source before preview and deployment.

## Input adapters do not own the artifact

[`figmaMCP.js`](https://github.com/Shaxxshankari/ai_website_generator_gs/blob/7298bfd0eba3ea9df58fa3bb1592a68a05adb479/figmaMCP.js) extracts design context for the Figma path. [`groqGenerate.js`](https://github.com/Shaxxshankari/ai_website_generator_gs/blob/7298bfd0eba3ea9df58fa3bb1592a68a05adb479/groqGenerate.js) turns the selected context into generated website code. The screenshot or Figma source grounds generation but does not remain the editable authority.

## Browser review precedes release

[`index.html`](https://github.com/Shaxxshankari/ai_website_generator_gs/blob/7298bfd0eba3ea9df58fa3bb1592a68a05adb479/public/index.html) exposes mode selection, result and preview controls. [`netlifyDeploy.js`](https://github.com/Shaxxshankari/ai_website_generator_gs/blob/7298bfd0eba3ea9df58fa3bb1592a68a05adb479/netlifyDeploy.js) moves accepted source into Netlify delivery.

## Pinned evidence

- [Canonical repository](https://github.com/Shaxxshankari/ai_website_generator_gs)
- [Inspected tree](https://github.com/Shaxxshankari/ai_website_generator_gs/tree/7298bfd0eba3ea9df58fa3bb1592a68a05adb479)
- Commit: `7298bfd0eba3ea9df58fa3bb1592a68a05adb479`
