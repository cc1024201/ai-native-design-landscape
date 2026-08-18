# Prompt-to-Website Generator by Varun Padala

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Streamlit application keeps HTML, CSS and JavaScript as distinct generated artifacts while still joining them into one ordinary-user preview and download workflow.

## One module exposes the entire authority chain

[`app.py`](https://github.com/Padala-Varun/prompt-to-website/blob/f9515ecb98870e085706a9690a3344bbadfd0607/app.py) calls Gemini Flash with the brief, parses the response into the three web-file channels and retains them in the Streamlit session. The combined document is projected through `st.components.v1.html`, while separate views let the user inspect the generated source.

## Delivery preserves conventional web boundaries

Individual download buttons provide the HTML, CSS and JavaScript instead of hiding the result in a hosted project. No durable revision or correction protocol is implemented: another prompt creates another session result. The classification therefore records live source projection and delivery but not managed-project persistence.

## Pinned evidence

- [Canonical repository](https://github.com/Padala-Varun/prompt-to-website)
- [README workflow](https://github.com/Padala-Varun/prompt-to-website/blob/f9515ecb98870e085706a9690a3344bbadfd0607/README.md)
- [Inspected tree](https://github.com/Padala-Varun/prompt-to-website/tree/f9515ecb98870e085706a9690a3344bbadfd0607)
- Commit: `f9515ecb98870e085706a9690a3344bbadfd0607`
