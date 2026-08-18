# WebAgent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WebAgent makes a local React project directory authoritative. Text prompts or design imagery can start generation; streamed model file blocks are written into that project; and a running Vite server or Sandpack surface projects the result.

## Model output is parsed as files

[`website_generator.py`](https://github.com/ragultv/WebAgent/blob/094d90ef2ab71331d41f4d72a5cc3b79895979a1/backend/services/website_generator.py) defines the streamed React-file response contract. [`image_to_website.py`](https://github.com/ragultv/WebAgent/blob/094d90ef2ab71331d41f4d72a5cc3b79895979a1/backend/services/image_to_website.py) adds design-image interpretation.

## The project manager owns durable local authority

[`project_manager.py`](https://github.com/ragultv/WebAgent/blob/094d90ef2ab71331d41f4d72a5cc3b79895979a1/backend/services/project_manager.py) scaffolds Vite projects, writes model files, exposes a file tree, reads and writes individual files, and controls their dev servers.

## Generation and correction share endpoints

[`project.py`](https://github.com/ragultv/WebAgent/blob/094d90ef2ab71331d41f4d72a5cc3b79895979a1/backend/routes/project.py) writes each completed streamed file immediately, then starts the preview. The same router exposes file reads and direct writes, so correction returns to filesystem authority rather than remaining a UI-only overlay.

## Pinned evidence

- [Repository](https://github.com/ragultv/WebAgent)
- [Inspected tree](https://github.com/ragultv/WebAgent/tree/094d90ef2ab71331d41f4d72a5cc3b79895979a1)
- Commit: `094d90ef2ab71331d41f4d72a5cc3b79895979a1`
