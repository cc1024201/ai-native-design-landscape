# pbi-cli

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

pbi-cli makes a Power BI project legible and writable to both people and coding agents. Its design surface is not a new canvas; it is the PBIP/PBIR/TMDL source package that Power BI Desktop can open and render.

## Report design becomes a typed file operation

At commit [`5a500f4`](https://github.com/MinaSaad1/pbi-cli/tree/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9) the [report command group](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/src/pbi_cli/commands/report.py) can create pages and visuals inspect report structure apply themes validate and package work. [`pbir_models.py`](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/src/pbi_cli/core/pbir_models.py) gives agents structured contracts instead of asking them to patch arbitrary JSON.

The bundled [Power BI report skill](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/src/pbi_cli/skills/power-bi-report/SKILL.md) is the AI interface. It directs an external agent through discovery mutation validation and handoff while the CLI performs deterministic changes.

```text
agent intent -> pbi-cli command -> PBIR/TMDL files -> validator -> Power BI render
                                      ^                  |
                                      +---- further edits+
```

Snapshots and restore commands make the source package recoverable. Rendered `.pbix` output is delivery material; the versionable project files are the authority. That distinction is why this is counted as code-to-visual authoring rather than a hosted image generator.

## Limits

The source proves command behavior and tests but a full visual acceptance still depends on Microsoft Power BI Desktop. The maintainer's first-party profile locates the team in Cairo Egypt.

## Pinned evidence

- [Report backend](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/src/pbi_cli/core/report_backend.py)
- [PBIR validators](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/src/pbi_cli/core/pbir_validators.py)
- [Repository README](https://github.com/MinaSaad1/pbi-cli/blob/5a500f4c89e1bfbd7bf9104e53fa9497ad4fa9e9/README.md)
