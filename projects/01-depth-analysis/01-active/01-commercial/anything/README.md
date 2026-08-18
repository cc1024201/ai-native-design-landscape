# Anything

Anything treats design as inseparable from product delivery: prompts, screenshots, URLs and Figma frames are all entry points, and the destination is not a screen but a running, publishable application in which design, behavior, database state and release advance together under one hosted project group. It compresses "design" into agent reasoning fed by visual references — and its most honest move is that a `VALID` generation can contain zero file changes, a working Preview is not a deployment, and a web publish can omit the mobile backend.

The product, formerly Create, is a hosted full-stack builder whose ordinary working object is a **project group** containing web/mobile/backend/database modules, generation threads, revisions, files, preview endpoints and release state. Generated front ends are React (web) and Expo/React Native (mobile), delivered through a managed cloud sandbox with serverless functions, auth, uploads, integrations, payments, hosting and PostgreSQL via Neon.

## The decisive mechanism is many clocks, not one artifact

The project group is a control plane over parallel lanes — source files and modules, validation/threads, development and production databases, three secret environments, deployments and store submissions — each completing on its own clock. No public operation restores them as one transaction. Max extends authority from code to runtime: a real browser, a simulated iOS device, backend execution, visual diffing, logs and database branches let the agent observe and repair behavior after each change rather than only regenerate source. That is a stronger feedback loop, not a single source-of-truth commit.

## Design context is one-way grounding, not binding

URLs become screenshot references, screenshots and images supply pixels, and a Figma frame or page feeds the prompt as visual intent. But nothing in the contract carries a Figma node id, variable identity, revision pin or reverse-sync back to the origin — iteration continues in the Anything agent, not in the source tool. Visual references improve grounding; they do not preserve an addressable relation to their origin.

## Every receipt answers a different question

Generation completion, hosted file change, dev-runtime health, publish success and store availability are distinct identities exposed by the [live OpenAPI](https://api.anything.com/v0/api/openapi.json). The [`@anythingai/cli@1.0.0`](https://registry.npmjs.org/%40anythingai%2Fcli/1.0.0) tarball sharpens the picture with its own limits: it waits generically through WebSocket/polling, its `ship` guard is a regex over assistant-message serialization (not a diff/build receipt), `watch` infers events from a few polling fields, `pull` creates a read-only context fork, and the advertised `deployments rollback` endpoint answers only `501 Not implemented`. For the designer, this is the point: Anything is decisive not because it produces one authoritative artifact, but because it forces you to name which receipt proves which layer.

Evidence is architecture-level at the closed boundary: the live OpenAPI and MIT CLI distribution were inspected, while the builder UI, agent/model orchestration, project/version stores, code writer, v2 migration service, Max browser/simulator and merge system, collaboration, managed functions/auth/storage, deployment and app-store control planes all remain undisclosed. Project source ZIP, database SQL ZIP and read-only CLI/API file pull are the portable exits; GitHub synchronization is documented as "coming soon".

**Primary sources**

- [Anything launch](https://www.anything.com/blog/anything-launch) · [Agent](https://www.anything.com/docs/builder/agent) · [Design inputs and design reasoning](https://www.anything.com/docs/apps/design) · [Figma import](https://www.anything.com/docs/import/figma) · [Max product contract](https://www.anything.com/docs/builder/max) · [Building Max](https://www.anything.com/blog/building-max)
- [Web apps](https://www.anything.com/docs/apps/web) · [Mobile apps](https://www.anything.com/docs/apps/mobile) · [Databases](https://www.anything.com/docs/apps/databases) · [Upgrade to v2](https://www.anything.com/docs/builder/upgrade-to-v2) · [Web/mobile publish](https://www.anything.com/docs/launch/publish) · [Source export and GitHub status](https://www.anything.com/docs/share/export)
- [Anything API and CLI for agents](https://www.anything.com/docs/cli) · [Live OpenAPI `0.1.0`](https://api.anything.com/v0/api/openapi.json) · [`@anythingai/cli@1.0.0` published contents](https://unpkg.com/browse/@anythingai/cli@1.0.0/)
