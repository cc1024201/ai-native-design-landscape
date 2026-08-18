# Redesignr AI

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Redesignr AI treats an existing page as input to a new editable website direction. A user can enter a URL or capture a page with the browser extension; the product then creates one or three alternatives instead of merely critiquing the source.

## One artifact crosses three editing modes

The first-party product page describes a generated design that can be changed through an AI chat editor or by clicking elements in a visual editor. That makes the working page—not the original screenshot and not a chat transcript—the observable authority. Multi-mode keeps three candidate designs available for comparison before the user continues with one.

## Delivery reveals the implementation boundary

Redesignr exports React and Tailwind rather than claiming that its internal editor graph is identical to the delivered source. Saved projects and multi-page editing remain provider-managed; code export is therefore a materialization boundary from the hosted artifact into a distinct implementation authority.

## What public evidence cannot establish

The browser-extension repository is claim-level and does not expose the hosted editor implementation. The exact internal page schema, revision model, selection protocol and mapping from visual edits to generated code remain unknown. This dossier consequently stops at architecture level.

## First-party evidence

- [Product and workflow](https://redesignr.ai/)
- [Saved-project and extension entry](https://redesignr.ai/login)
- [Browser-extension repository](https://github.com/web5lab/redesigner-ai-extension)
- [Team-region evidence](https://github.com/web5lab)
