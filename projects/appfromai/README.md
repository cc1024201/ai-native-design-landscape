# AppFromAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AppFromAI is an on-device mobile module factory rather than a conventional code-hosting IDE. A selected provider returns a constrained generated module; the app normalizes and stores that structure locally, renders it through a controlled native component runtime, and lets the user alter visual styles without another model call.

## Provider output is normalized before adoption

[`src/ai/normalizeGeneratedModule.ts`](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/ai/normalizeGeneratedModule.ts) converts variable model output into the product's canonical module shape. Provider settings support OpenAI, Claude, and Ollama, but provider choice does not change the artifact contract.

[`src/modules/moduleStore.ts`](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/modules/moduleStore.ts) persists modules on the device. [`src/modules/moduleRunner.ts`](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/modules/moduleRunner.ts) validates and executes the selected module through the product's renderer rather than evaluating an unrestricted native application bundle.

## Direct style editing returns to the same artifact

[`src/components/StyleEditorSheet.tsx`](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/components/StyleEditorSheet.tsx) exposes selected-node styling. [`src/modules/styleEditor.ts`](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/modules/styleEditor.ts) applies the patch back to the module tree, so manual correction and AI generation converge on one structured authority. Camera, location, storage, notifications, and similar device capabilities pass through an explicit permission gate before the module can invoke them.

## Evidence and location

- [Canonical repository](https://github.com/BiosBrick/AppFromAI)
- [Inspected tree](https://github.com/BiosBrick/AppFromAI/tree/2eaeb01ce3808161e22e54730f79c260081670a4)
- [Runtime permission gate](https://github.com/BiosBrick/AppFromAI/blob/2eaeb01ce3808161e22e54730f79c260081670a4/src/renderer/ModulePermissionGate.tsx)
- Commit: `2eaeb01ce3808161e22e54730f79c260081670a4`

No reliable public location was found for the maintainer; team region remains unknown.
