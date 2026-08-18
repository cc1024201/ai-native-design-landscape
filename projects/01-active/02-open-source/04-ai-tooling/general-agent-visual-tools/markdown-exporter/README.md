# Markdown Exporter

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Markdown Exporter is an Agent Skill, Dify plugin, CLI and Python package that materializes Markdown into DOCX, PPTX, XLSX, PDF, HTML and other delivery formats.

## Markdown content and native templates divide authority

Markdown holds the content structure. DOCX and PPTX templates supply styles, masters and brand presentation; the converter writes native files and exposes screenshots/examples for inspection. The same implementation is distributed across agent, marketplace and CLI surfaces rather than counted as separate products.

The source proves deterministic conversion and template application. It does not establish a conversational revision model or visual QA gate comparable to a full office editor, so layout quality remains dependent on input structure and templates.

- [Pinned repository](https://github.com/bowenliang123/markdown-exporter/tree/0676511bf9397093cee09c579ba60ad6c33005a0)
- [Agent skill](https://github.com/bowenliang123/markdown-exporter/blob/0676511bf9397093cee09c579ba60ad6c33005a0/SKILL.md)
- [Converter package](https://github.com/bowenliang123/markdown-exporter/tree/0676511bf9397093cee09c579ba60ad6c33005a0/md_exporter)
- [Maintainer profile: Guangzhou China](https://github.com/bowenliang123)
