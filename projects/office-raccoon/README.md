# Office Raccoon

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Office Raccoon (`办公小浣熊`) is SenseTime's office agent for documents, data analysis, knowledge work and presentation production. Its first-party web application exposes PPT as a dedicated operation mode alongside planning and analysis rather than treating slides as a generic file download.

## The hosted workspace and open skills are related but not identical

The [product page](https://office.xiaohuanxiong.com/home) describes a combined creation platform and knowledge-management space, while [SenseTime's product directory](https://www.sensetime.com/cn/) identifies it as the company's AI office agent. Public application contracts expose sessions, stored assets, template and audience configuration, outline confirmation, rendering and a presentation workbench.

The separately released [SenseNova PPT workflow](https://github.com/OpenSenseNova/SenseNova-Skills/blob/44537f9132ac9622fb1cda67e99672d1f2f495e3/docs/sn-ppt-generate.md) explains the artifact pattern: style and outline lead to an asset plan, VLM review, retained page HTML and PPTX export. Its [workbench specification](https://github.com/OpenSenseNova/SenseNova-Skills/blob/44537f9132ac9622fb1cda67e99672d1f2f495e3/docs/sn-ppt-workbench_en.md) adds direct selection, movement, resizing and regeneration. Those sources evidence the bundled workflow but are not claimed as the closed application's full source. The hosted product is counted separately because it owns sessions, assets and the ordinary-user workspace; the installable skill distribution keeps its own release boundary.

## Evidence

- [Office Raccoon](https://office.xiaohuanxiong.com/home)
- [SenseNova Skills pinned source](https://github.com/OpenSenseNova/SenseNova-Skills/tree/44537f9132ac9622fb1cda67e99672d1f2f495e3)
