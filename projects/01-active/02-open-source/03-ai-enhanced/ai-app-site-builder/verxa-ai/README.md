# VERXA AI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

VERXA does not begin with one unconstrained prompt. It collects type-specific business portfolio blog news article or event data plus a color scheme and uploaded assets before asking a coding model to create the page.

## Rich forms become a full-page code request

[`deepseekService.js`](https://github.com/CephasTechOrg/VERXA-AI-WEBSITE-BUILDER/blob/595936f59c0ea612b4fb37f50af30fbfa2e45240/server/services/deepseekService.js) combines a template selected by website type with structured user data and customization state. DeepSeek returns one complete HTML document. The service checks structural closure and can repair missing document wrappers; its final fallback is a fixed page rather than silently presenting incomplete source.

## Preview and download use asset-specific variants

[`websiteController.js`](https://github.com/CephasTechOrg/VERXA-AI-WEBSITE-BUILDER/blob/595936f59c0ea612b4fb37f50af30fbfa2e45240/server/controllers/websiteController.js) collects uploaded assets and asks the file service to produce an absolute-URL preview variant and a relative-path packaged variant. [`Preview.jsx`](https://github.com/CephasTechOrg/VERXA-AI-WEBSITE-BUILDER/blob/595936f59c0ea612b4fb37f50af30fbfa2e45240/client/src/components/Preview/Preview.jsx) projects the former in an iframe and opens the generated ZIP route for the latter. The inspected flow supports regeneration but no durable project or version store.

## Evidence

- [Canonical repository](https://github.com/CephasTechOrg/VERXA-AI-WEBSITE-BUILDER)
- [Inspected tree](https://github.com/CephasTechOrg/VERXA-AI-WEBSITE-BUILDER/tree/595936f59c0ea612b4fb37f50af30fbfa2e45240)
- Commit: `595936f59c0ea612b4fb37f50af30fbfa2e45240`
