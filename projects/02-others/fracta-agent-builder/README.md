# FRACTA Visual Agent Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FRACTA embeds a domain-specific visual agent specification inside an intelligence and governance dashboard. The source distinguishes a useful editable graph from the stronger claims of durable orchestration: current runs are simulations and current agent storage is browser-session state.

## The artifact is an agent-shaped node graph

[`Canvas.jsx`](https://github.com/asheesh109/FRACTA-GOV/blob/d653f0d241b57e58ac7e4d953ea65b99d70711b0/src/components/AgentBuilder/Canvas.jsx) and its SVG connection layer edit nodes positions and connections without relying on React Flow. Saving places that graph inside an agent object. This establishes a real visual specification even though it is not yet a production runtime definition.

## Simulation respects order but synthesizes outcomes

[`SimulationPanel.jsx`](https://github.com/asheesh109/FRACTA-GOV/blob/d653f0d241b57e58ac7e4d953ea65b99d70711b0/src/components/AgentBuilder/SimulationPanel.jsx) computes topological order from connections and visits nodes accordingly. Its `simulateNode` branch returns delayed and partly random result objects rather than invoking model tool or governance services. The edges therefore drive a demonstration sequence but not external agent execution.

## Declared database and current storage diverge

The Supabase schema declares agent and execution tables. The application context is more decisive for the pinned build: it explicitly says the backend has no agents table and stores `fracta_agents` in `sessionStorage`. Browser closure can therefore erase the authored graph. We record the currently wired path rather than elevating an unused schema into a persistence claim.

## Why it is still included

The builder lets a user create change connect save and simulate a domain artifact. It crosses the inclusion boundary as a visual specification product while remaining clearly labeled as a prototype whose execution and durability are incomplete.

## Evidence

- [Repository](https://github.com/asheesh109/FRACTA-GOV)
- [Pinned source](https://github.com/asheesh109/FRACTA-GOV/tree/d653f0d241b57e58ac7e4d953ea65b99d70711b0)
- [Current storage path](https://github.com/asheesh109/FRACTA-GOV/blob/d653f0d241b57e58ac7e4d953ea65b99d70711b0/src/context/AppContext.jsx)
