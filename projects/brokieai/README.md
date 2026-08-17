# BrokieAI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

BrokieAI is a Solana-oriented visual agent builder. Its strongest implemented loop is narrower than the product language: a user edits an in-memory React Flow graph, supplies an Eliza character definition, then deploys that definition and turns selected graph nodes into prompts sent to the created agent.

## What the canvas actually controls

[react-flow-sample.tsx](https://github.com/Magicred-1/brokieai/blob/4dfc37b10ec05b048d45f567cc37be94299ec000/components/reactflow/react-flow-sample.tsx) owns nodes and edges, accepts dragged Solana operations and submits the current node array with the character form. The default graph connects agent creation, token deployment, Raydium pool creation and a launch output.

## Deployment crosses a real backend boundary

[the Eliza route](https://github.com/Magicred-1/brokieai/blob/4dfc37b10ec05b048d45f567cc37be94299ec000/app/api/eliza/route.ts) authenticates the wallet, generates a Solana keypair, builds an Eliza character, persists its configuration in Supabase and waits for the agent runtime to expose it. Recognized canvas nodes are then translated into operation prompts and sent to that agent.

## Authority is split, not end-to-end

Supabase retains the deployed character configuration, but the route does not persist the submitted graph or traverse its edges. Execution iterates recognized nodes rather than compiling graph order, and several toolbox entries have no matching backend operation. The visual artifact is therefore a deploy-time instruction surface, not yet a durable workflow authority.

## Identity and lineage

The later `shreyaspapi/brokieai` repository is tracked as a source duplicate. This earlier Magicred tree is the canonical counted implementation.

## Pinned evidence

- [Repository](https://github.com/Magicred-1/brokieai)
- [Inspected tree](https://github.com/Magicred-1/brokieai/tree/4dfc37b10ec05b048d45f567cc37be94299ec000)
- [Supabase client boundary](https://github.com/Magicred-1/brokieai/blob/4dfc37b10ec05b048d45f567cc37be94299ec000/utils/supabase.ts)
