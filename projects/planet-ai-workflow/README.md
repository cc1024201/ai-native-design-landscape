# Planet AI Workflow Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Planet AI Workflow Builder is a two-repository learning prototype: a React Flow front end presents a fixed query → model → output diagram, and a FastAPI service executes one model request. Its most important finding is the distance between the editable-looking graph and the actual runtime contract.

## The visible graph is narrowly configurable

[WorkflowBuilder.js](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Frontend/blob/1b2ff6b76dc5511c33ad4284009ea34c09b2ce5c/src/WorkflowBuilder.js) initializes three fixed nodes. Users can reposition them, edit the query/model/API key and add connections, but pressing Run reconstructs a new payload containing only the fixed query and LLM nodes and sends `edges: []`.

## Backend execution ignores topology too

[workflow.py](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Backend/blob/2f0ab35245fa1d943c0bfbc31a6fbbfccabae149/app/services/workflow.py) scans the submitted node list for knowledge-base and LLM configuration, makes one model call and writes a chat log. It does not traverse edges or execute arbitrary canvas structure.

## Why it is still counted

The ordinary-user surface genuinely lets someone configure and run a visually represented AI pipeline, so it is a product-shaped artifact rather than a screenshot. Its evidence depth is prototype: editable topology, reusable persistence and general graph execution are not supported at these commits.

## One product, two components

The frontend and backend repositories implement one named assignment and one request contract. They are counted once; the backend is registered as a same-product component rather than a second product.

## Pinned evidence

- [Frontend repository](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Frontend)
- [Frontend tree](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Frontend/tree/1b2ff6b76dc5511c33ad4284009ea34c09b2ce5c)
- [Backend tree](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Backend/tree/2f0ab35245fa1d943c0bfbc31a6fbbfccabae149)
- [Request schema](https://github.com/Dhanu81-DEV/Planet-AI-Full-Stack-Engineering-Assignment-Backend/blob/2f0ab35245fa1d943c0bfbc31a6fbbfccabae149/app/models/schemas.py)
