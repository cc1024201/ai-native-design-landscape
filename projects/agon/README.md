# Agon

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agon uses multiple agents to negotiate a structured decision model called the Truth Map. Architecture diagrams are outputs of that governed consensus state rather than the primary database.

## Truth Map operations are validated

At [`e6495efa`](https://github.com/simonholmes001/agon/tree/e6495efae5f7eae140eba62c69661c4b90a9c84d), claims, evidence, assumptions, risks and decisions form typed domain entities. Agents return patches; a validator checks those patches before repository persistence.

## Consensus has durable infrastructure

PostgreSQL repositories retain sessions and Truth Maps while Redis supports snapshots and SignalR broadcasts events. Convergence evaluation determines when the council has reached a usable result.

## Current visual boundary

The verified product generates architecture Mermaid and related documents from the result. The README's richer browser Truth Map explorer is still described as coming soon, so this dossier does not treat it as a shipped visual editor.

## Evidence

- [Pinned repository](https://github.com/simonholmes001/agon/tree/e6495efae5f7eae140eba62c69661c4b90a9c84d)
- [Truth Map model](https://github.com/simonholmes001/agon/blob/e6495efae5f7eae140eba62c69661c4b90a9c84d/backend/src/Agon.Domain/TruthMap/TruthMap.cs)
- [Patch validator](https://github.com/simonholmes001/agon/blob/e6495efae5f7eae140eba62c69661c4b90a9c84d/backend/src/Agon.Domain/TruthMap/PatchValidator.cs)
- [Persistence repository](https://github.com/simonholmes001/agon/blob/e6495efae5f7eae140eba62c69661c4b90a9c84d/backend/src/Agon.Infrastructure/Persistence/PostgreSQL/TruthMapRepository.cs)
- [Published scope and diagram claims](https://github.com/simonholmes001/agon/blob/e6495efae5f7eae140eba62c69661c4b90a9c84d/README.md)
