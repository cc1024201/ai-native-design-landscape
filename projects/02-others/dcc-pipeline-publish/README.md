# DCC Pipeline Publish

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC Pipeline Publish is a four-Skill delivery product: publish manifests, game release packaging, runtime acceptance and gameplay PV capture. It starts after a DCC or engine has produced an export and makes the handoff verifiable without pretending to be the source authoring tool.

## Hashes connect otherwise separate production systems

[`create_publish_manifest.py`](https://github.com/dcc-mcp/dcc-pipeline-publish/blob/085202c7685399779fa1dbbb5a6af43fbb7bd316/skill/pipeline-publish/scripts/create_publish_manifest.py) records immutable files, hashes, entity identity, version and optional farm job. OpenUSD, a render farm and Flow Production Tracking can consume that same manifest without the Skill reimplementing any of them.

Game-release packaging works from an already exported Windows directory and carries license provenance. Runtime acceptance launches or validates the built game against milestones and thresholds. PV capture plans exact-window shots and preserves hash-verified recordings before editing. These contracts share one release because they govern the same transition from approved output to delivery evidence.

## Evidence

- [Pinned workflow package](https://github.com/dcc-mcp/dcc-pipeline-publish/tree/085202c7685399779fa1dbbb5a6af43fbb7bd316)
- [Publish Skill](https://github.com/dcc-mcp/dcc-pipeline-publish/blob/085202c7685399779fa1dbbb5a6af43fbb7bd316/skill/pipeline-publish/SKILL.md)
- [Runtime acceptance](https://github.com/dcc-mcp/dcc-pipeline-publish/blob/085202c7685399779fa1dbbb5a6af43fbb7bd316/skill/game-runtime-acceptance/SKILL.md)
- [Final capture evidence](https://github.com/dcc-mcp/dcc-pipeline-publish/blob/085202c7685399779fa1dbbb5a6af43fbb7bd316/skill/game-pv-capture/scripts/finalize_game_pv_capture.py)
