# SenseNova Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SenseNova Skills is an office-production system whose modules compose research, spreadsheets, infographics and presentations into end-to-end agent workflows. It includes both filesystem skills and a visual PPT workbench where a user can inspect, select, resize and regenerate slide elements.

## Page HTML is retained as an editable intermediate

The [PPT generation contract](https://github.com/OpenSenseNova/SenseNova-Skills/blob/44537f9132ac9622fb1cda67e99672d1f2f495e3/docs/sn-ppt-generate.md) moves from style specification and outline to an asset plan, VLM quality checks, page HTML, per-page review and PPTX export. The [workbench contract](https://github.com/OpenSenseNova/SenseNova-Skills/blob/44537f9132ac9622fb1cda67e99672d1f2f495e3/docs/sn-ppt-workbench_en.md) reopens that material in a direct-manipulation surface.

Retained HTML is the re-editable page source during generation; the exported `.pptx` is the native delivery artifact. Spreadsheet and infographic skills share the same install and orchestration boundary, so the distribution is one canonical product.

## Evidence

- [Pinned repository](https://github.com/OpenSenseNova/SenseNova-Skills/tree/44537f9132ac9622fb1cda67e99672d1f2f495e3)
- [PPT workflow skill](https://github.com/OpenSenseNova/SenseNova-Skills/tree/44537f9132ac9622fb1cda67e99672d1f2f495e3/skills/sn-ppt-workflow)
- [Released editable deck example](https://github.com/OpenSenseNova/SenseNova-Skills/tree/44537f9132ac9622fb1cda67e99672d1f2f495e3/examples/generative-ai-revolution-ppt/result)
