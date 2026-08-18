# AI Website Generator by aifeifei798

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This command-line builder uses a plan-driven pipeline to keep independently generated sections visually coherent. A design document is not explanatory collateral; it becomes input to later CSS and template calls.

## Staged authority

[`generator.py`](https://github.com/aifeifei798/AI-Website-Generator/blob/84e291bd6a30e634ccf46529599234f730459c56/ai/generator.py) asks Gemini separately for the master plan, design document, CSS and section templates. [`prompts.py`](https://github.com/aifeifei798/AI-Website-Generator/blob/84e291bd6a30e634ccf46529599234f730459c56/ai/prompts.py) carries rules from planning into those specialized roles.

[`builder.py`](https://github.com/aifeifei798/AI-Website-Generator/blob/84e291bd6a30e634ccf46529599234f730459c56/builder.py) writes the plan and design records, assembles templates and materializes a website directory. [`main.py`](https://github.com/aifeifei798/AI-Website-Generator/blob/84e291bd6a30e634ccf46529599234f730459c56/main.py) accepts the user brief. Image generation remains a mock at this commit and is not counted as a working capability.

## Pinned evidence

- [Canonical repository](https://github.com/aifeifei798/AI-Website-Generator)
- [Inspected tree](https://github.com/aifeifei798/AI-Website-Generator/tree/84e291bd6a30e634ccf46529599234f730459c56)
- Commit: `84e291bd6a30e634ccf46529599234f730459c56`
