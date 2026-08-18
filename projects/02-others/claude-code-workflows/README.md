# OneRedOak Claude Code Workflows

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OneRedOak Claude Code Workflows includes a concrete design-review workflow for front-end changes. It makes a running application—not a textual style checklist—the evidence surface for an agent's UI/UX review.

## Responsive browser evidence becomes a triaged review artifact

The design-review agent opens the application with Playwright MCP, interacts with real flows and captures desktop, tablet and mobile evidence at defined viewports. It compares observations with a repository-local design-principles contract, then reports prioritized findings with locations and remediation guidance. The slash command makes the same loop repeatable on demand.

The reviewed application source remains authoritative. Screenshots and the report coordinate correction; this workflow does not claim to own a second design document or directly mutate the UI without a subsequent coding step.

## Evidence

- [Pinned repository](https://github.com/OneRedOak/claude-code-workflows/tree/6a653445125da828f31af473fcdd3cf29f99be82)
- [Design-review agent](https://github.com/OneRedOak/claude-code-workflows/blob/6a653445125da828f31af473fcdd3cf29f99be82/design-review/design-review-agent.md)
- [Slash-command workflow](https://github.com/OneRedOak/claude-code-workflows/blob/6a653445125da828f31af473fcdd3cf29f99be82/design-review/design-review-slash-command.md)
- [Design-principles example](https://github.com/OneRedOak/claude-code-workflows/blob/6a653445125da828f31af473fcdd3cf29f99be82/design-review/design-principles-example.md)
