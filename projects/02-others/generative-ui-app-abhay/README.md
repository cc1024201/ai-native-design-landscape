# Generative UI App by Abhay

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Streamlit project makes constrained JSON the authority for an AI-composed dashboard. Text, a dataset or a reference image can change what the model proposes; a fixed renderer decides what can actually appear.

## Multimodal input converges on one schema

[`openai_client.py`](https://github.com/abhay-beinex/generative-ui-app/blob/2fd9751da8762dd85af58acc3d3346845b9dac2b/utils/openai_client.py) sends text and processed files through the Responses API and can attach an image as multimodal input. [`prompt_builder.py`](https://github.com/abhay-beinex/generative-ui-app/blob/2fd9751da8762dd85af58acc3d3346845b9dac2b/utils/prompt_builder.py) restricts output to headers, text, metrics, tables, bar or line charts and forms with explicit field requirements.

## Renderer is the execution boundary

[`renderer.py`](https://github.com/abhay-beinex/generative-ui-app/blob/2fd9751da8762dd85af58acc3d3346845b9dac2b/utils/renderer.py) interprets the parsed component list into Streamlit and Plotly widgets. Unknown or malformed structures are skipped rather than executed. The model therefore authors a bounded dashboard graph rather than arbitrary frontend source.

## JSON can leave the session

[`app.py`](https://github.com/abhay-beinex/generative-ui-app/blob/2fd9751da8762dd85af58acc3d3346845b9dac2b/app.py) keeps raw and parsed responses in session state, shows the generated dashboard and offers the raw JSON for download. It has no direct component editing, persistent project store or revision graph.

## Pinned evidence

- [Canonical repository](https://github.com/abhay-beinex/generative-ui-app)
- [Inspected tree](https://github.com/abhay-beinex/generative-ui-app/tree/2fd9751da8762dd85af58acc3d3346845b9dac2b)
- Commit: `2fd9751da8762dd85af58acc3d3346845b9dac2b`
