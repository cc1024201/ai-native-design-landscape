# AI Website Builder by Shekh Basir

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This full-stack builder makes one complete HTML document the current project artifact, but surrounds it with durable identity, conversation and publication state.

## Generation creates a managed website record

[`website.js`](https://github.com/shekhbasir/AI-website-Builder-final-project/blob/e05b443a97286143bac99605ce87bf9156328308/Backend/controller/website.js) asks Groq for strict JSON containing a complete iframe-compatible HTML document. It writes that document into a Mongo website record with a title, owner, slug and conversation. A correction request includes `latestcode` and replaces it only after another valid full-document response.

## Editor reunites conversation and projection

[`WebEditor.jsx`](https://github.com/shekhbasir/AI-website-Builder-final-project/blob/e05b443a97286143bac99605ce87bf9156328308/Frontend/basir/src/pages/WebEditor.jsx) loads persisted code and conversation, sends follow-up instructions, and projects the current string in an iframe. Monaco can also change the local preview, although the pinned source does not post those direct manual edits back to Mongo.

## Publication is state on the project

The backend marks a website deployed and assigns a public slug URL rather than exporting an anonymous file. [`model/website.js`](https://github.com/shekhbasir/AI-website-Builder-final-project/blob/e05b443a97286143bac99605ce87bf9156328308/Backend/model/website.js) confirms that `latestcode`, conversation, deploy status and slug are co-owned by the record. No immutable version lineage is implemented.

## Pinned evidence

- [Canonical repository](https://github.com/shekhbasir/AI-website-Builder-final-project)
- [Inspected tree](https://github.com/shekhbasir/AI-website-Builder-final-project/tree/e05b443a97286143bac99605ce87bf9156328308)
- Commit: `e05b443a97286143bac99605ce87bf9156328308`
