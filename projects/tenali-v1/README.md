# Tenali v-1

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Tenali v-1 is a deliberately bounded website workbench: Gemini produces exactly three logical files and the user can edit each one before previewing or exporting the result.

## Three state fields impersonate a file tree

Pinned revision: `09e81225a7d6eee6fa8e86352e30e8896bf38e3e`.

The Genkit flow returns typed `html`, `css` and `js` strings. File Explorer labels them `index.html`, `style.css` and `script.js`, but they remain React state rather than filesystem objects. The README correctly labels broader multi-file support as future work.

## Manual editing is authoritative within the session

Changing the active code textarea updates the same three-part object used to compose the iframe. ZIP export writes those values as real files. No project store or history exists, so download is the only durable recovery boundary.

## Pinned evidence

- [Repository](https://github.com/chatbca/Tenali-Version1)
- [Typed generation flow](https://github.com/chatbca/Tenali-Version1/blob/09e81225a7d6eee6fa8e86352e30e8896bf38e3e/src/ai/flows/generate-code-from-prompt.ts)
- [Authoring state](https://github.com/chatbca/Tenali-Version1/blob/09e81225a7d6eee6fa8e86352e30e8896bf38e3e/src/app/page.tsx)
- [Iframe composition](https://github.com/chatbca/Tenali-Version1/blob/09e81225a7d6eee6fa8e86352e30e8896bf38e3e/src/components/webgenius/LivePreview.tsx)
- [ZIP materialization](https://github.com/chatbca/Tenali-Version1/blob/09e81225a7d6eee6fa8e86352e30e8896bf38e3e/src/lib/exportUtils.ts)
