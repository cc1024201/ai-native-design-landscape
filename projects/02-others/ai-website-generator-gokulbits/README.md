# AI Website Generator by GokulBits18

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This four-file repository establishes a complete but deliberately minimal ordinary-user loop: local model generation followed by direct visual projection. It does not claim editing, persistence or delivery mechanisms that are absent from source.

## A raw JSON contract connects model and browser

[`Backend/main.py`](https://github.com/GokulBits18/AI-Powered-Website-Generator/blob/0f04a56294257f615641812be2aa4894fd2dd7bf/Backend/main.py) calls a local Llama 3 model through Ollama and asks for a JSON object containing HTML, CSS and JavaScript. The route returns the model's raw message rather than validating a native artifact graph.

[`Frontend/index.html`](https://github.com/GokulBits18/AI-Powered-Website-Generator/blob/0f04a56294257f615641812be2aa4894fd2dd7bf/Frontend/index.html) parses that string, combines the three fields and assigns the document to a script-enabled sandbox iframe. The generated values exist only for the page session; there is no export, correction or recovery path.

## Evidence

- [Canonical repository](https://github.com/GokulBits18/AI-Powered-Website-Generator)
- [Inspected tree](https://github.com/GokulBits18/AI-Powered-Website-Generator/tree/0f04a56294257f615641812be2aa4894fd2dd7bf)
- Commit: `0f04a56294257f615641812be2aa4894fd2dd7bf`
