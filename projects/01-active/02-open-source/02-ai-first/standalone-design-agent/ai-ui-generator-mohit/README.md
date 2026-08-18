# AI UI Generator by Mohit Aggarwal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mohit's implementation combines a Groq agent sequence with an explicit two-level history policy: MongoDB is the intended durable version authority while the browser keeps the product usable when that database path fails.

## Agent output is checked before it becomes UI

[planner.py](https://github.com/mohitagg07/ai-ui-generator/blob/262a954bcd382e38d1d4e4f147e39b54d6961347/backend/agents/planner.py) turns the request into a component plan and [generator.py](https://github.com/mohitagg07/ai-ui-generator/blob/262a954bcd382e38d1d4e4f147e39b54d6961347/backend/agents/generator.py) asks Groq for source. The backend registry and validator reject unsupported or malformed component structures before returning the artifact.

## Durable and fallback histories are intentionally different

[mongodb.py](https://github.com/mohitagg07/ai-ui-generator/blob/262a954bcd382e38d1d4e4f147e39b54d6961347/backend/database/mongodb.py) stores generated versions when the database is available. The frontend also retains version state locally and can continue when the backend signals persistence failure. That fallback is an availability mechanism rather than proof of server durability.

## Current source controls the visual proof

[App.jsx](https://github.com/mohitagg07/ai-ui-generator/blob/262a954bcd382e38d1d4e4f147e39b54d6961347/frontend/src/App.jsx) connects prompts, editable code, history selection and live preview. A selected prior version replaces current code before the same runtime projection is refreshed.

## Evidence

- [Canonical repository](https://github.com/mohitagg07/ai-ui-generator)
- [Inspected tree](https://github.com/mohitagg07/ai-ui-generator/tree/262a954bcd382e38d1d4e4f147e39b54d6961347)
- Commit: 262a954bcd382e38d1d4e4f147e39b54d6961347
