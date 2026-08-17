# Qwen3 Coder WebDev by Ethan Ng

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

The repository's inner application is a Gradio web-development assistant. Qwen may return several fenced files; the application extracts them and selects a renderable HTML or React entry rather than treating the whole answer as prose.

## One model response becomes a file set

[`app.py`](https://github.com/ethanng12345/GenAI-Website-Architect-Prompt-to-Website-Application-Personal-Project/blob/25605449a90a7fb0988ba6dccc751a234cf36cb3/Qwen3-Coder-WebDev/app.py) parses named code fences, tracks chat state and drives code, preview and download panels. [`config.py`](https://github.com/ethanng12345/GenAI-Website-Architect-Prompt-to-Website-Application-Personal-Project/blob/25605449a90a7fb0988ba6dccc751a234cf36cb3/Qwen3-Coder-WebDev/config.py) defines output and runtime restrictions used to keep generated pages compatible with the hosted preview.

The application does not establish a durable repository or branching version model. Its artifact is the current extracted file bundle in the Gradio session.

## Evidence lock

- [Canonical repository](https://github.com/ethanng12345/GenAI-Website-Architect-Prompt-to-Website-Application-Personal-Project)
- [Inspected tree](https://github.com/ethanng12345/GenAI-Website-Architect-Prompt-to-Website-Application-Personal-Project/tree/25605449a90a7fb0988ba6dccc751a234cf36cb3)
- Commit: `25605449a90a7fb0988ba6dccc751a234cf36cb3`
