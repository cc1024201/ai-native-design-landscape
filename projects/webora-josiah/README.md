# Webora by JOSIAHTHEPROGRAMMER

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Webora is a two-repository product whose backend makes complete HTML versions first-class records. It is separate from the unrelated keenoy009 Webora already present in the landscape.

## Creation and revision converge on current_code

[ProjectController.ts](https://github.com/JOSIAHTHEPROGRAMMER/Webora-backend-server/blob/cd6d25ac6afb09011fee2cf6eb530ec0d935b012/controllers/ProjectController.ts) sends the request and current HTML to OpenRouter. Every accepted revision creates a Version row and then changes the project's current_code and current_version_index.

## Rollback changes authority rather than just preview

[schema.prisma](https://github.com/JOSIAHTHEPROGRAMMER/Webora-backend-server/blob/cd6d25ac6afb09011fee2cf6eb530ec0d935b012/prisma/schema.prisma) separates Project, Version and conversation records. Rollback copies selected version code back into current_code and publication serves that current document. History is therefore operational project state.

## The frontend consumes the backend authority

[EditorPanel.tsx](https://github.com/JOSIAHTHEPROGRAMMER/Webora/blob/7f0509c17e01a77153c8bcf02106750a92b8b6d2/src/components/EditorPanel.tsx) exposes correction and source inspection while [ProjectPreview.tsx](https://github.com/JOSIAHTHEPROGRAMMER/Webora/blob/7f0509c17e01a77153c8bcf02106750a92b8b6d2/src/components/ProjectPreview.tsx) projects the returned HTML. Direct frontend state does not replace the persisted current_code contract.

## Evidence

- [Canonical frontend repository](https://github.com/JOSIAHTHEPROGRAMMER/Webora)
- [Canonical backend repository](https://github.com/JOSIAHTHEPROGRAMMER/Webora-backend-server)
- [Inspected frontend tree](https://github.com/JOSIAHTHEPROGRAMMER/Webora/tree/7f0509c17e01a77153c8bcf02106750a92b8b6d2)
- [Inspected backend tree](https://github.com/JOSIAHTHEPROGRAMMER/Webora-backend-server/tree/cd6d25ac6afb09011fee2cf6eb530ec0d935b012)
- Frontend commit: 7f0509c17e01a77153c8bcf02106750a92b8b6d2
- Backend commit: cd6d25ac6afb09011fee2cf6eb530ec0d935b012
