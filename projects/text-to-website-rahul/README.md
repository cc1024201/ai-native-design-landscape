# TextToWebsite

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

TextToWebsite is a March 2023 hackathon product that used GPT-4, LangChain, and Streamlit to turn a short prompt into a standalone browser artifact. It is retained as a historical product lineage, not described as a current platform.

## The ordinary-user surface is Streamlit

[`ui.py`](https://github.com/rahulamlekar/TextToWebsite/blob/7f74e461396158d419250351725e052a15f5ae2d/src/ui.py) collects the brief and displays the result. [`oai.py`](https://github.com/rahulamlekar/TextToWebsite/blob/7f74e461396158d419250351725e052a15f5ae2d/src/oai.py) provides the GPT/LangChain generation path.

## Outputs are complete web artifacts

The repository preserves generated examples such as [`landing.html`](https://github.com/rahulamlekar/TextToWebsite/blob/7f74e461396158d419250351725e052a15f5ae2d/samples/landing.html) and `workout.html`, establishing that the output was executable HTML rather than a mock screenshot. The product lacks a durable project or revision model and its pinned activity ends in 2023.

## Pinned evidence

- [Repository](https://github.com/rahulamlekar/TextToWebsite)
- [Inspected tree](https://github.com/rahulamlekar/TextToWebsite/tree/7f74e461396158d419250351725e052a15f5ae2d)
- Commit: `7f74e461396158d419250351725e052a15f5ae2d`
