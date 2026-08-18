# Agent Architecture by Shivraj

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Architecture is a GitHub Copilot workspace that designs a software-delivery organization as explicit roles, handoffs, retries, artifacts, and ticket-state transitions.

## Roles own bounded stages

Product Owner, Planner, Developer, Tester, Pre-PR Reviewer, and Documentation agents each have a defined responsibility. Jira and Confluence interactions connect requirements and delivery, while the developer/tester/reviewer loop is capped rather than allowed to recurse indefinitely.

## Durable context is the handoff contract

Agents append plans, development logs, test results, and review findings to `.github/agent-outputs/<TICKET-ID>.md`. This file makes state inspectable across role changes and process restarts. Branches, tests, and PRs remain external evidence of work, not just messages in an agent conversation.

## Diagrams document the organization

Mermaid and Excalidraw skills let the documentation role produce visual explanations of the pipeline and system. Here design means configuring the delivery organization itself; the visuals are maintained evidence over that workflow rather than its executable authority.

## Pinned evidence

- Repository: [shivraj10/agent-setup](https://github.com/shivraj10/agent-setup)
- Inspected agent definitions: [`42ede0f5295159618bec573534995462fe5e4198`](https://github.com/shivraj10/agent-setup/tree/42ede0f5295159618bec573534995462fe5e4198)
- Immutable revision: [commit `42ede0f`](https://github.com/shivraj10/agent-setup/commit/42ede0f5295159618bec573534995462fe5e4198)
