# notebooklm-py

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

notebooklm-py is an unofficial agent, CLI and Python control surface for Google's Gemini Notebook service. Its Design relevance is not the generic research chat: it can request slide decks, infographics, videos, mind maps and tables, wait for generation, validate them and download durable files in bulk.

## The adapter orchestrates; the hosted notebook owns generation

[`generation.py`](https://github.com/teng-lin/notebooklm-py/blob/f5ab3fb312f2752aa0c092004880c640e9ab6f08/src/notebooklm/_artifact/generation.py) and [`polling.py`](https://github.com/teng-lin/notebooklm-py/blob/f5ab3fb312f2752aa0c092004880c640e9ab6f08/src/notebooklm/_artifact/polling.py) expose the hosted artifact lifecycle. [`downloads.py`](https://github.com/teng-lin/notebooklm-py/blob/f5ab3fb312f2752aa0c092004880c640e9ab6f08/src/notebooklm/_artifact/downloads.py) brings generated MP4, PDF, PNG, CSV, JSON or Markdown files into a local workflow, while the root [`SKILL.md`](https://github.com/teng-lin/notebooklm-py/blob/f5ab3fb312f2752aa0c092004880c640e9ab6f08/SKILL.md) packages that lifecycle for agents.

Google's service remains the generation and notebook authority. This project is counted independently because it adds a released, scriptable orchestration and export boundary; it is not presented as Google's source or an official API.

## Evidence

- [Pinned repository](https://github.com/teng-lin/notebooklm-py/tree/f5ab3fb312f2752aa0c092004880c640e9ab6f08)
- [Artifact validation](https://github.com/teng-lin/notebooklm-py/blob/f5ab3fb312f2752aa0c092004880c640e9ab6f08/src/notebooklm/_artifact/validation.py)
- [Maintainer profile: United States](https://github.com/teng-lin)
