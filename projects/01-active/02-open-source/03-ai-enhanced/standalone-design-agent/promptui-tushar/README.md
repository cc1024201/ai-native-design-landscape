# PromptUI by Tushar Mokal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PromptUI is a deliberately small browser-only loop in which one React source string is generated, inspected, projected and downloaded.

[`openrouter.js`](https://github.com/TusharMokal01/prompt-ui/blob/95bcf998fed8b42e58749cee3654eb2536cc4ffb/src/services/openrouter.js) asks an OpenRouter-hosted model for a `GeneratedComponent` and removes response fences. [`App.jsx`](https://github.com/TusharMokal01/prompt-ui/blob/95bcf998fed8b42e58749cee3654eb2536cc4ffb/src/App.jsx) keeps the current source in memory and exposes prompt templates and regeneration. There is no hidden project record: the code string is the artifact.

## Preview is a lossy translation

[`Preview.jsx`](https://github.com/TusharMokal01/prompt-ui/blob/95bcf998fed8b42e58749cee3654eb2536cc4ffb/src/components/Preview.jsx) strips common JSX expressions and converts `className` before embedding the result with Tailwind in an iframe. Because loops and event handlers can be removed by that sanitizer, the code panel and download preserve more authority than the preview. No persistence beyond the current browser session is implemented.

## Evidence

- [Canonical repository](https://github.com/TusharMokal01/prompt-ui)
- [Inspected tree](https://github.com/TusharMokal01/prompt-ui/tree/95bcf998fed8b42e58749cee3654eb2536cc4ffb)
- [Live product](https://promptui.vercel.app)
- Commit: `95bcf998fed8b42e58749cee3654eb2536cc4ffb`
