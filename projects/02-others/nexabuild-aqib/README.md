# NexaBuild by Aqib Ahmed

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NexaBuild joins a Streamlit editing session to an actual GitHub Pages delivery path. The current artifact is a three-file website and every AI correction is expected to return the entire structured set.

## Gemini replaces a structured website

[utils.py](https://github.com/Aqibahmed12/Website-Builder-Ai/blob/df948fc8fd1867714643d7a44cc49609d5b744bf/ai/utils.py) asks Gemini for HTML, CSS and JavaScript and parses the JSON response. Follow-up chat includes current source so corrections replace rather than merely describe the project.

## Session versions are inspectable but not durable

[main.py](https://github.com/Aqibahmed12/Website-Builder-Ai/blob/df948fc8fd1867714643d7a44cc49609d5b744bf/main.py) keeps generation and edit versions in Streamlit session state. The code editor can directly change each layer and preview reassembles the selected state; a process or session loss removes history.

## Delivery is not a simulated success toast

[deploy.py](https://github.com/Aqibahmed12/Website-Builder-Ai/blob/df948fc8fd1867714643d7a44cc49609d5b744bf/ai/deploy.py) calls GitHub APIs to create or update repository files and enable Pages. ZIP export packages the same current source so local and hosted delivery have a traceable artifact origin.

## Evidence

- [Canonical repository](https://github.com/Aqibahmed12/Website-Builder-Ai)
- [Inspected tree](https://github.com/Aqibahmed12/Website-Builder-Ai/tree/df948fc8fd1867714643d7a44cc49609d5b744bf)
- Commit: df948fc8fd1867714643d7a44cc49609d5b744bf
