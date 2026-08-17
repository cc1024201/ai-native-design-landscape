# Homemaker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Homemaker is a browser-based 3D interior workspace where conventional scene editing and a Claude coding agent both mutate a project directory. Its unusual choice is to make room modules and JSON files—not a provider-owned canvas database—the shared authority.

## A project directory is the interior model

Each project contains `project.json`, room JavaScript modules, model assets and furniture state. [`projectLoader.js`](https://github.com/bayllama/homemaker/blob/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/js/projectLoader.js) loads that structure into the Three.js application, while [`app.js`](https://github.com/bayllama/homemaker/blob/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/js/app.js) coordinates the interactive editor.

Direct wall and furniture changes are written back to JSON. The browser hot-reloads changed project files, so human manipulation and filesystem edits converge on the same live scene.

## The agent edits the actual project, then looks at the result

[`claude_agent.py`](https://github.com/bayllama/homemaker/blob/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/claude_agent.py) runs the Claude Agent SDK against the selected project directory. The project-local [`CLAUDE.md`](https://github.com/bayllama/homemaker/blob/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/CLAUDE.md) describes the artifact grammar and editing rules instead of asking the agent to return detached advice.

The system offers plan and build modes. Screenshots, viewport captures and marked points can be supplied as evidence; after changing files, the agent can capture the rendered scene again for verification. This closes a filesystem-agent loop:

`intent + visual evidence → agent edits room source/state → hot reload → screenshot verification`

## Direct edit and delegated edit share authority

[`server.js`](https://github.com/bayllama/homemaker/blob/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/server.js) provides project APIs, file watching, screenshots and chat coordination. Because both UI handlers and agent tools write into the project directory, the design is not trapped in chat history and does not require a lossy image-to-scene conversion after every turn.

## Persistence boundary

Files are durable and naturally compatible with ordinary backup or Git. Chat sessions are archived with a small retention limit, while screenshots are derivative evidence. The implementation does not provide a transactional scene database, multi-user merge semantics or a constraint-solving CAD kernel; it is a source-driven interior scene authoring system.

## Evidence

- [Pinned repository](https://github.com/bayllama/homemaker/tree/93a0333522b59f8d26451b847ed3489a6ef8bb76)
- [Example project structure](https://github.com/bayllama/homemaker/tree/93a0333522b59f8d26451b847ed3489a6ef8bb76/homemaker/projects/ra)
