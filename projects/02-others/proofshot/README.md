# ProofShot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ProofShot is an agent-agnostic visual verification CLI for UI work. It wraps browser control in a start-test-stop session that records video, screenshots, action timing, console/server errors and a human-reviewable report.

## Proof artifacts are the product boundary

`proofshot start` launches or observes the application and begins synchronized recording. An agent drives the browser and captures key screenshots. `proofshot stop` trims and bundles the run into an interactive viewer where video, action markers and logs share a timeline. `proofshot diff` compares visual evidence, and `proofshot pr` can attach the bundle to a pull request.

Application source and Git remain authoritative. ProofShot artifacts support a human promotion decision; they do not mutate the application or declare that a visually similar screen is behaviorally correct.

## Distinction from browser automation

The project uses `agent-browser` for primitives but adds session state, error collection, synchronized evidence and delivery. This is why the general Playwright skill was excluded while ProofShot is an independently usable visual review workspace.

- [Pinned ProofShot revision](https://github.com/AmElmo/proofshot/tree/963aa67949ad8e82810135e0a7cfce4827fd4686)
- [Verification workflow](https://github.com/AmElmo/proofshot/blob/963aa67949ad8e82810135e0a7cfce4827fd4686/README.md)
- [Visual diff command](https://github.com/AmElmo/proofshot/blob/963aa67949ad8e82810135e0a7cfce4827fd4686/src/commands/diff.ts)
- [Codex skill contract](https://github.com/AmElmo/proofshot/blob/963aa67949ad8e82810135e0a7cfce4827fd4686/skills/codex/SKILL.md)
