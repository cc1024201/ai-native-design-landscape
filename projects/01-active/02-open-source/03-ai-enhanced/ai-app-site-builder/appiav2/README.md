# AppiaV2

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

AppiaV2 retains Bolt's generated-file protocol but turns it into a broader managed project: users can build web or React Native artifacts inspect and edit files run a live browser or Expo projection reopen saved projects and deliver them. It is counted as a material derivative because persistence and release authority extend beyond a renamed Bolt clone.

## The inherited protocol is explicit

[`api/_lib/prompts.ts`](https://github.com/morningstar-code/AppiaV2/blob/898eff2d41b039b11063ef1ad34176673e40087b/api/_lib/prompts.ts) still identifies the assistant as Bolt and requires structured artifact and file actions for WebContainer. This anchors the ancestry and prevents an unsupported independent-from-scratch claim.

Appia's product layer changes the scope of that protocol. [`BoltBuilder.tsx`](https://github.com/morningstar-code/AppiaV2/blob/898eff2d41b039b11063ef1ad34176673e40087b/Frontend/src/pages/BoltBuilder.tsx) owns a multi-file workspace chat and build logs restores saved projects and projects either through WebContainer or an Expo Snack path. The user's accepted source files remain authoritative while preview is a live projection.

## A saved project crosses sessions

[`api/projects.ts`](https://github.com/morningstar-code/AppiaV2/blob/898eff2d41b039b11063ef1ad34176673e40087b/api/projects.ts) reads and writes project code file maps and chat history in PostgreSQL. [`prisma/schema.prisma`](https://github.com/morningstar-code/AppiaV2/blob/898eff2d41b039b11063ef1ad34176673e40087b/prisma/schema.prisma) independently confirms users projects saved prompts usage and subscriptions.

This is durable current-project state rather than a version graph. Updates replace the stored project record and no immutable revision or promotion model is evidenced.

## Delivery belongs to the product loop

[`api/vercel/deploy.ts`](https://github.com/morningstar-code/AppiaV2/blob/898eff2d41b039b11063ef1ad34176673e40087b/api/vercel/deploy.ts) converts the accepted file map into a Vercel deployment and persists the resulting release URL. The builder also constructs Expo Snack artifacts for native projects. Generation correction preview recovery and delivery therefore operate on the same project authority.

## Evidence boundary

- [Canonical repository](https://github.com/morningstar-code/AppiaV2)
- [Inspected tree](https://github.com/morningstar-code/AppiaV2/tree/898eff2d41b039b11063ef1ad34176673e40087b)
- Commit: `898eff2d41b039b11063ef1ad34176673e40087b`

The maintainer profile exposes no location so team region remains unknown. Source establishes the implementation contract but this review did not treat README claims as proof that every external deployment integration is presently operational.
