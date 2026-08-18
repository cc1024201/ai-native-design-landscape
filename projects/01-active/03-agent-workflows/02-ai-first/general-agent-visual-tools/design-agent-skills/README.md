# Design Agent Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Agent Skills is Wang Yiyang's current home for `yy-design`, a Chinese/English agent workflow that creates and reviews high-fidelity HTML prototypes, interactive demos, slides, motion pieces, infographics and social publishing artifacts. The earlier `yy-design` repository is archived and explicitly redirects installation and development here.

## A visual system is established before artifact production

The skill starts from real brand assets and existing design context, makes a visual-system decision, then authors runnable HTML. Browser rendering and dedicated verification scripts inspect the result; video and GIF renderers, editable PPTX routes and WeChat-specific output are downstream materializations rather than substitutes for the source artifact.

The repository is counted once even though it exposes several artifact routes. They share one skill router, one visual identity and one verification toolchain, while the archived predecessor is retained only as lineage evidence.

- [Pinned repository](https://github.com/wangyiyang/design-agent-skills/tree/7690d2437bc8762c73c92cfa18092d9dd1228195)
- [yy-design skill](https://github.com/wangyiyang/design-agent-skills/blob/7690d2437bc8762c73c92cfa18092d9dd1228195/skills/yy-design/SKILL.md)
- [Artifact verifier](https://github.com/wangyiyang/design-agent-skills/blob/7690d2437bc8762c73c92cfa18092d9dd1228195/skills/yy-design/scripts/verify.py)
- [Maintainer location evidence](https://github.com/wangyiyang)
