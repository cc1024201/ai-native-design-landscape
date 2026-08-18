# AI Voice Page Builder

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This project tests one unusual interface boundary: voice is the only design brief, and the application surface is replaced by the generated webpage when the external studio returns.

## Audio URL is the agent handoff

[`App.jsx`](https://github.com/Graeberj/AIVoicePageBuilder/blob/927a79e4c44cc534e967ce19a1fde8ba1d7d486b/src/App.jsx) records browser audio, uploads the blob to Firebase Storage and sends its public URL as `voice_prompt` to a Relevance AI studio endpoint. The returned `output.answer` is treated as HTML.

## Projection is terminal for the session

The HTML is installed with `dangerouslySetInnerHTML` and replaces the recording interface. Public source shows no code editor, correction request, export or project persistence. Firebase stores the input recording but is not an artifact-version store for the generated page.

## Historical cutoff and opaque dependency

The repository's public history ends in 2024. The external studio hides transcription, model choice and HTML-generation logic and cannot establish current service continuity. The record preserves the working integration pattern at source level while marking the product historical.

## Pinned evidence

- [Canonical repository](https://github.com/Graeberj/AIVoicePageBuilder)
- [Firebase handoff configuration](https://github.com/Graeberj/AIVoicePageBuilder/blob/927a79e4c44cc534e967ce19a1fde8ba1d7d486b/firebase.js)
- [Inspected tree](https://github.com/Graeberj/AIVoicePageBuilder/tree/927a79e4c44cc534e967ce19a1fde8ba1d7d486b)
- Commit: `927a79e4c44cc534e967ce19a1fde8ba1d7d486b`
