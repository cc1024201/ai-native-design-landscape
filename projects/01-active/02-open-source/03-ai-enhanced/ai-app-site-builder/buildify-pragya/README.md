# Buildify by Pragya Manna

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Buildify materializes a website as three familiar source layers. Its small Python backend is the artifact writer and its browser client is the inspection and delivery surface.

## Gemini calls are separated by source layer

[python.py](https://github.com/pragya-manna/Buildify--AI-Website-Builder/blob/48d270b5f7a0312c299513940a5ba7f7b6a88846/python.py) asks Gemini for HTML CSS and JavaScript and writes each response into the generated workspace. This creates an inspectable multi-file artifact rather than a screenshot or hosted opaque result.

## The browser works against generated files

[script.js](https://github.com/pragya-manna/Buildify--AI-Website-Builder/blob/48d270b5f7a0312c299513940a5ba7f7b6a88846/public/script.js) submits prompts then loads the generated result for preview and download. The code does not establish durable database versions or conversational modification; the current generated directory remains authority.

## Portable output is the explicit endpoint

The backend packages the three files as a ZIP. This delivery contract is why the project qualifies even though its correction and persistence model is much thinner than larger app-builder workspaces.

## Evidence

- [Canonical repository](https://github.com/pragya-manna/Buildify--AI-Website-Builder)
- [Inspected tree](https://github.com/pragya-manna/Buildify--AI-Website-Builder/tree/48d270b5f7a0312c299513940a5ba7f7b6a88846)
- Commit: 48d270b5f7a0312c299513940a5ba7f7b6a88846
