# AI Shortfilm Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Shortfilm Studio is a full production pipeline whose editable artifact moves from storyboards and generated media to an assembled film and multimodal review.

## Stages retain versioned artifacts

Projects hold storyboard and media versions, uploaded clips, generation tasks, dependency state, and review results. Changing an upstream stage invalidates dependent outputs rather than pretending the old film is still current.

## The agent canvas is a control projection

A React Flow graph exposes existing production stages and validated connections. It configures and runs the pipeline, while artifact snapshots—not canvas pixels—remain the durable production record.

## Delivery and critique are executable stages

Adapters call real language, video, and multimodal providers; missing credentials fail instead of silently substituting fake output. FFmpeg materializes `final.mp4`, after which review can create explicit regeneration tasks. Test adapters are limited to declared test paths.

## Pinned evidence

- Repository: [dcongthinh0-ship-it/AI-video](https://github.com/dcongthinh0-ship-it/AI-video)
- Inspected project models, versioned artifacts, React Flow canvas, dependency invalidation, provider adapters, FFmpeg assembly, and review loop: [`3272ed111a50463aa6af3c2cc9c02e2fdc16e918`](https://github.com/dcongthinh0-ship-it/AI-video/tree/3272ed111a50463aa6af3c2cc9c02e2fdc16e918)
- Immutable revision: [commit `3272ed1`](https://github.com/dcongthinh0-ship-it/AI-video/commit/3272ed111a50463aa6af3c2cc9c02e2fdc16e918)
