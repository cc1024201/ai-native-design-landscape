# Huashu Design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Huashu Design defines Design as an agent-operated production discipline rather than one application or one canvas. An installable skill routes a brief into artifact-specific workflows for prototypes, editable presentations, motion pieces and other visual deliverables, then requires comparison and verification before handoff.

## The artifact type changes the workflow

The root [`SKILL.md`](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/SKILL.md) first classifies the requested deliverable. An HTML prototype follows the browser-oriented [app prototype contract](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/app-prototype.md); editable slides use a structured PowerPoint workflow; motion output follows composition and render guidance. Huashu therefore has no universal internal scene graph. Each native source format is authoritative for its medium.

## Variation and critique are first-class stages

The shared [`workflow.md`](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/workflow.md) requires multiple directions before convergence. The agent presents alternatives, obtains a selection and refines the chosen direction instead of treating its first generation as delivery. The [critique guide](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/critique-guide.md) turns visual hierarchy, typography, spacing and medium-specific defects into an explicit review pass.

That creates a filesystem-native decision graph: sibling candidate files preserve alternatives; the selected editable source advances; previews and exports remain derived evidence.

## Verification is executable where the medium permits it

Repository scripts render videos, convert or inspect presentation files and verify output properties. [`verification.md`](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/verification.md) separates semantic review from mechanical checks. This is a useful boundary: successful rendering can prove that a deliverable opens and has the expected dimensions or frames but cannot by itself prove that the design is good.

## Runtime and persistence boundary

Huashu is agent-agnostic guidance and tooling, not a model host. The calling agent supplies reasoning and image-generation capabilities; local programs supply HTML, PPTX, SVG, PNG or video production. Filesystem and Git own persistence and recovery. No Huashu cloud workspace, proprietary canvas state or built-in version service is required.

## Evidence

- [Pinned repository](https://github.com/alchaincyf/huashu-design/tree/1572d431f1411c82ec0baea94dea6a45f6063b26)
- [Editable PPTX workflow](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/editable-pptx.md)
- [Animation workflow](https://github.com/alchaincyf/huashu-design/blob/1572d431f1411c82ec0baea94dea6a45f6063b26/references/animation-best-practices.md)
