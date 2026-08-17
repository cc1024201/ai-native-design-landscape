# Vibra Code

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vibra Code is a mobile-app creation workspace whose artifact authority lives inside a remote development sandbox. The browser stores session metadata and conversation state, while the agent edits the runnable project and exposes it through a tunnel for web or device review.

## A durable session points at a sandboxed project

[`vibracode-backend/convex/schema.ts`](https://github.com/sa4hnd/vibra-code/blob/0a8524a68899e7d98bdd12787f624fdcd062c74c/vibracode-backend/convex/schema.ts) persists sessions, messages, files, tunnel URLs, selected agent type, cost state, and GitHub-push status. These records coordinate the product, but the actual app source is the filesystem in the referenced E2B sandbox.

[`vibracode-backend/app/actions/agents/run.ts`](https://github.com/sa4hnd/vibra-code/blob/0a8524a68899e7d98bdd12787f624fdcd062c74c/vibracode-backend/app/actions/agents/run.ts) records a user request and dispatches an Inngest job. [`vibracode-backend/lib/inngest/functions/run-agent.ts`](https://github.com/sa4hnd/vibra-code/blob/0a8524a68899e7d98bdd12787f624fdcd062c74c/vibracode-backend/lib/inngest/functions/run-agent.ts) reconnects to the existing sandbox, feeds the request and attached media to the coding agent, streams its activity, and preserves enough state to continue after an interrupted environment.

## Preview and delivery remain attached to source

[`vibracode-backend/components/mobile-preview.tsx`](https://github.com/sa4hnd/vibra-code/blob/0a8524a68899e7d98bdd12787f624fdcd062c74c/vibracode-backend/components/mobile-preview.tsx) renders the tunnel URL and a QR code for phone review. The session can also record a GitHub repository and push state, so delivery exports the sandbox-owned source rather than only a rendered image. The inspected code does not expose a separate design-node graph or first-class immutable visual version model.

## Evidence and location

- [Canonical repository](https://github.com/sa4hnd/vibra-code)
- [Inspected tree](https://github.com/sa4hnd/vibra-code/tree/0a8524a68899e7d98bdd12787f624fdcd062c74c)
- Commit: `0a8524a68899e7d98bdd12787f624fdcd062c74c`

The maintainer's [GitHub profile](https://github.com/sa4hnd) states Iraq; team region is recorded as Iraq.
