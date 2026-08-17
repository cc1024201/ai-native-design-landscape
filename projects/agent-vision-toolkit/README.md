# Agent Vision Toolkit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Vision Toolkit gives text-oriented coding agents a measurable visual work surface. It covers UI and graphic restoration, diagram reconstruction, screenshot-based GUI operation and image comparison. Its product boundary is the repeatable visual evidence pipeline, not a general-purpose computer-use agent.

## Coordinates before correction

The toolkit turns screenshots into targetable regions, inventories and pixel coordinates. `pixel_diff.py` localizes changed regions; `html_shot.py` produces deterministic browser renders; restoration guides distinguish UI structure, graphic geometry and relationship diagrams. The agent is expected to inspect actual pixels after model localization because normalized boxes are not treated as pixel-exact.

For UI restoration, repository HTML/CSS/SVG remains authoritative and screenshots are projections used to find and verify defects. For graphic restoration, an editable SVG or structured diagram becomes the deliverable. The toolkit therefore supports both runtime correction and visual reconstruction without collapsing their authorities.

## Verification is a second pass

The skill explicitly routes comparison and re-checking after generation or interaction. Long screenshots are split and merged rather than downscaled into an unreviewable single model input. These are practical limits on visual evidence quality, not merely stylistic advice.

## Evidence boundary

The repository establishes tools, workflows and output contracts. Accuracy still depends on the selected vision model, browser/font environment and the agent's repair decisions; no claim of pixel-perfect autonomous restoration follows from the interface alone.

- [Pinned Agent Vision Toolkit revision](https://github.com/Anionex/agent-vision-toolkit/tree/7eafd51e7e62bd14f72627c69f2c11601c508f88)
- [Vision-tools skill contract](https://github.com/Anionex/agent-vision-toolkit/blob/7eafd51e7e62bd14f72627c69f2c11601c508f88/skills/vision-tools/SKILL.md)
- [UI restoration workflow](https://github.com/Anionex/agent-vision-toolkit/blob/7eafd51e7e62bd14f72627c69f2c11601c508f88/skills/vision-tools/references/restore-ui.md)
- [Pixel-diff helper](https://github.com/Anionex/agent-vision-toolkit/blob/7eafd51e7e62bd14f72627c69f2c11601c508f88/skills/vision-tools/scripts/pixel_diff.py)
