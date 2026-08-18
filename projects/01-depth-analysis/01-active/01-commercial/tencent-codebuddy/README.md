# Tencent CodeBuddy IDE

CodeBuddy's definition of design is not one thing but three handoffs that all end the same way: in project files. The IDE's core question is not "can I turn a design into code" but "which state is only visual context and which state becomes the durable implementation." Its answer is blunt — only the project-file mutation closes the loop, and every visual input is an intermediate, bounded context bundle.

## Three different visual inputs, one durable destination

**Figma** is an external native document. CodeBuddy runs it in an isolated persistent webview, polls `figma.currentPage.selection`, converts the selection with `@tencent/design-to-code`, and writes HTML, an asset cache and an optional screenshot into `.codebuddy/figma/<node-id>/`. What crosses into the conversation is `figmaInfo` — exported material, not a live document handle. Re-export can therefore go stale: the HTML overwrites while the screenshot is only written when absent. [Figma workflow](https://www.codebuddy.ai/docs/ide/User-guide/Figma)

**Preview** is the project's own runtime. Selecting an element collects `outerHTML`, computed styles and a synthetic `lineInfo` (positions against a serialized page, not authored file lines), and any DOM-Editor change first mutates the running element's inline style — a temporary experiment — then asks the Agent to implement it in source via a `webSelection` mention. A lagging reload or a wrong shared-component edit can leave the Preview correct while the durable change is absent. [Preview guide](https://www.codebuddy.ai/docs/ide/User-guide/preview)

**Miora** is a file-export bridge: the page behind `miora.design` exposes `window.mioraIDEBridge`, and selected items become ordinary downloaded files in chat under `.codebuddy/miora/`.

## Agent turns context into source; the runtime verifies it

All three paths converge on the same Agent over the opened project. Result panes — Artifacts, All Files, Changes, Preview — are four observations over one task, not four copies of a versioned object. Automatic checkpoints restore pre-conversation file state but not the Figma/Miora caches, chat, memory or deployment. Delivery is provider-specific (EdgeOne Pages, CloudBase, Cloud Studio, Lighthouse). [Agent quickstart](https://www.codebuddy.ai/docs/ide/User-guide/Agent-Mode/Quickstart) · [Checkpoint](https://www.codebuddy.ai/docs/ide/User-guide/Checkpoint)

The IDE implementation is closed; the evidence here comes from official docs, release notes, and a read-only extraction of the pinned Windows installer (4.11.0.35330129), which established the Figma webview bridge, Preview packet, and Miora bridge without an authenticated task or source maps. Deterministic DOM-to-file mapping, Figma reverse-sync, and Miora's upstream model remain unknowns ([pinned installer](https://download.codebuddy.cn/aiide/win32-x64-user/CodeBuddy-win32-x64-user-4.11.0.35330129-a64e0542-cn.exe) · [release notes](https://www.codebuddy.ai/docs/ide/release-notes/release-notes) · [CNB repo](https://cnb.cool/codebuddy/codebuddy-code)).
