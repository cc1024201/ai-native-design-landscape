# GNR8

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GNR8 carries a website through a comparatively complete small-product loop: multi-agent generation, feedback-aware regeneration, file inspection, preview, ZIP export, and GitHub Pages publication.

## Agents divide the initial site work

[`pipeline.py`](https://github.com/Srayash/GNR8/blob/2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4/Model/pipeline.py) uses CrewAI roles for prompt and website construction. [`pipeline_followup.py`](https://github.com/Srayash/GNR8/blob/2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4/Model/pipeline_followup.py) turns feedback into a structured change request and asks another agent to revise the full existing code.

## Parsed files own the user surface

[`ResultPage.jsx`](https://github.com/Srayash/GNR8/blob/2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4/FE/src/pages/ResultPage.jsx) converts model output into files, switches between website preview and file/code inspection, and packages those files into a ZIP.

## Publishing uses the same file set

[`deploy.js`](https://github.com/Srayash/GNR8/blob/2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4/BE/routes/deploy.js) creates a repository, pushes each current file, and enables GitHub Pages. Credentials and deployment policy in this hackathon-style source need hardening, but delivery is implemented rather than claimed.

## Pinned evidence

- [Repository](https://github.com/Srayash/GNR8)
- [Inspected tree](https://github.com/Srayash/GNR8/tree/2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4)
- Commit: `2bd0f69d48b69b56996dfdc5cecb66f99f8b70f4`
