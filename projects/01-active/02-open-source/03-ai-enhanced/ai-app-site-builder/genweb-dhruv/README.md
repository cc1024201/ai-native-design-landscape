# GenWeb by Dhruv Pansuriya

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

GenWeb is a Kriti text-to-website project whose central artifact is a generated project file map persisted behind project routes and updated through follow-up prompts.

## The model produces a project-oriented response

[`genaimodel.js`](https://github.com/DhruvPansuriya/Product_Dev_Kriti-25/blob/9deff8487b7bf1bef921b1a34f96f9b4d84bf599/server/config/genaimodel.js) configures the generation provider, while [`promptHandler.js`](https://github.com/DhruvPansuriya/Product_Dev_Kriti-25/blob/9deff8487b7bf1bef921b1a34f96f9b4d84bf599/server/promptHandler.js) interprets model output into the current project structure.

## Project persistence outlives the request

[`Project.js`](https://github.com/DhruvPansuriya/Product_Dev_Kriti-25/blob/9deff8487b7bf1bef921b1a34f96f9b4d84bf599/server/Controller/Project.js) creates and retrieves user projects. The client builder projects the resulting files and supports further prompts against the same workspace.

## Maturity boundary

The source contains multiple experimental server paths and generated defaults, and the precise version/release semantics remain weak. It nevertheless implements model-to-project-to-preview rather than stopping at a product claim.

## Pinned evidence

- [Repository](https://github.com/DhruvPansuriya/Product_Dev_Kriti-25)
- [Inspected tree](https://github.com/DhruvPansuriya/Product_Dev_Kriti-25/tree/9deff8487b7bf1bef921b1a34f96f9b4d84bf599)
- Commit: `9deff8487b7bf1bef921b1a34f96f9b4d84bf599`
