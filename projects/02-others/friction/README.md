# Friction

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

Friction is a synthetic usability-research workspace. It evaluates a Figma prototype or live URL with several AI personas and retains a session containing behavioral traces heatmaps scores and findings. It does not own the source design.

## A task controls the tested journey

The user can supply a task that spans several pages. Friction assigns two to five personas and records step-by-step behavior instead of producing only a generic visual critique. Results are scored across clarity flow accessibility feedback and emotional fit and then summarized as prioritized findings.

| Authority | Role |
|---|---|
| Figma prototype or live site | test target and navigation surface |
| task plus personas | study configuration |
| session traces and heatmaps | synthetic observations |
| scores and findings | model-mediated interpretation |
| original design or code | remains the artifact that must be changed |

The distinction between observation and interpretation matters. A heatmap derived from simulated agents is not measured human gaze and a persona is not a recruited participant. Friction can surface hypotheses quickly but cannot establish population validity.

## Privacy and persistence boundary

First-party material says sessions are stored in the browser for up to ten days and that only the analysis data sent to the Claude API leaves that local boundary. The exact payload redaction caching and deletion confirmation are not public. Clearing browser storage or moving devices can therefore break recovery even if the target prototype still exists.

The closed product does not expose its crawler interaction policy prompt model version sampling controls or Figma parser. It also does not publish a writeback path. Findings become durable design changes only when a person or another tool applies them to the authoritative artifact.

Team region remains unknown in the current first-party evidence.

## Primary evidence

- [Friction product and workflow](https://www.frictionux.com/)
- [Friction privacy boundary](https://www.frictionux.com/)
