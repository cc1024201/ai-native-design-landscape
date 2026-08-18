# Prompt-UI by Ayesha and Mahek

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Prompt-UI is a minimal prompt-to-HTML workspace. A FastAPI endpoint asks GPT for HTML/CSS-only output and a static browser client displays the exact returned string as code and as an iframe document.

## One response has two projections

[`main.py`](https://github.com/ayesha25-mahek/prompt-to-UI-generator/blob/ad3713d227ebe8c0f8bb3daed385d7997c4534db/main.py) sends the user's description to an OpenAI chat-completions model under a front-end-only system instruction and returns `ui_code`. [`generate.html`](https://github.com/ayesha25-mahek/prompt-to-UI-generator/blob/ad3713d227ebe8c0f8bb3daed385d7997c4534db/generate.html) assigns that string both to a code pane and to `iframe.srcdoc` then offers copy-to-clipboard.

## The authority is explicit but transient

There is no intermediary component graph model-driven patch protocol or server-side project record. The returned HTML string owns the current result and the iframe is a deterministic visual projection. A new prompt replaces it; copying the code is the only delivery path evidenced in source.

## Operational limits

The inspected revision ships a placeholder API key and a permissive development CORS policy. Those details make it a runnable prototype after configuration rather than a hosted production service and are not treated as product maturity evidence.

## Pinned evidence

- [Repository](https://github.com/ayesha25-mahek/prompt-to-UI-generator)
- [Inspected tree](https://github.com/ayesha25-mahek/prompt-to-UI-generator/tree/ad3713d227ebe8c0f8bb3daed385d7997c4534db)
- [Maintainer profile checked; no location published](https://github.com/ayesha25-mahek)
- Commit: `ad3713d227ebe8c0f8bb3daed385d7997c4534db`
