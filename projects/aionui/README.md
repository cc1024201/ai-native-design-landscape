# AionUi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AionUi is a general Cowork desktop host with a concrete visual-delivery surface: built-in assistants can create presentations, documents, spreadsheets, images and web artifacts; the workspace preview follows generated files and exposes direct editing for HTML, Markdown and code.

## The host owns workspace continuity; OfficeCLI owns native mutation

AionUi's canonical assistant and skill definitions are maintained in the related AionCore project. The desktop repository supplies the user-facing integration: workspace selection and history, agent sessions, file watching, preview routing and editors. [`PreviewPanel.tsx`](https://github.com/iOfficeAI/AionUi/blob/71c466a7e61d82621da02fc010e662d9abaa033b/packages/desktop/src/renderer/pages/conversation/Preview/components/PreviewPanel/PreviewPanel.tsx) keeps file artifacts beside the conversation. HTML changes can move between rendered and code views without leaving the workspace.

```text
brief + selected assistant -> agent writes workspace artifact
-> live file watch -> HTML/code edit or Office preview
-> OfficeCLI creates/updates native PPTX/DOCX/XLSX
-> reopen workspace and continue with the same files
```

For Morph presentations, AionUi orchestrates and previews while the separately distributed OfficeCLI implements native PowerPoint structure. That dependency is why both products have records: AionUi defines the ordinary-user session and delivery experience; OfficeCLI defines the headless artifact mutation contract.

Workspace files are authoritative. AionUi does not turn a PPTX preview into its own slide graph, and its generic conversation “artifacts” API refers to UI cards such as skill suggestions rather than all produced design files. The project is Apache-2.0 licensed. No reliable organization-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/iOfficeAI/AionUi/tree/71c466a7e61d82621da02fc010e662d9abaa033b)
- [Workspace history](https://github.com/iOfficeAI/AionUi/blob/71c466a7e61d82621da02fc010e662d9abaa033b/packages/desktop/src/renderer/utils/workspace/workspaceHistory.ts)
- [HTML editor](https://github.com/iOfficeAI/AionUi/blob/71c466a7e61d82621da02fc010e662d9abaa033b/packages/desktop/src/renderer/pages/conversation/Preview/components/editors/HTMLEditor.tsx)
- [PowerPoint viewer](https://github.com/iOfficeAI/AionUi/blob/71c466a7e61d82621da02fc010e662d9abaa033b/packages/desktop/src/renderer/pages/conversation/Preview/components/viewers/PptViewer.tsx)
- [Apache-2.0 license](https://github.com/iOfficeAI/AionUi/blob/71c466a7e61d82621da02fc010e662d9abaa033b/LICENSE)
