# AI Website Generator by Jordan D'Souza

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project uses a local language model as a schema generator rather than asking it to write final page source. The bounded schema is the design authority and deterministic templates perform materialization.

## TinyLlama chooses content and theme

[`llm.py`](https://github.com/jordan-dsouza/AI_Website_Generator/blob/5d83644d6e5247e517b9d9a96946f0f154f51537/BackEnd/llm.py) runs TinyLlama locally and extracts a JSON object containing site type, theme, metadata and named components. An invalid response falls back to a minimal schema rather than untrusted free-form markup.

[`main.py`](https://github.com/jordan-dsouza/AI_Website_Generator/blob/5d83644d6e5247e517b9d9a96946f0f154f51537/BackEnd/main.py) passes that schema to [`templates.py`](https://github.com/jordan-dsouza/AI_Website_Generator/blob/5d83644d6e5247e517b9d9a96946f0f154f51537/BackEnd/templates.py), which selects known HTML sections and theme colors. [`script.js`](https://github.com/jordan-dsouza/AI_Website_Generator/blob/5d83644d6e5247e517b9d9a96946f0f154f51537/FrontEnd/script.js) projects the returned HTML and CSS through an iframe and retains them for separate downloads. The implementation has no project history or iterative correction protocol.

## Evidence

- [Canonical repository](https://github.com/jordan-dsouza/AI_Website_Generator)
- [Inspected tree](https://github.com/jordan-dsouza/AI_Website_Generator/tree/5d83644d6e5247e517b9d9a96946f0f154f51537)
- Commit: `5d83644d6e5247e517b9d9a96946f0f154f51537`
