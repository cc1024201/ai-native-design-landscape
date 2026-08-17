# UIGen — Claude Code in Action sample

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UIGen is counted once as the runnable UI-generation sample used in Anthropic's **Claude Code in Action** course. It is not counted once per learner who republishes or renames it. The [official course page](https://anthropic.skilljar.com/claude-code-in-action) establishes the course boundary; the implementation below was inspected through a public course mirror because Anthropic does not expose an official public source repository for the exercise.

## The artifact is a serialized virtual filesystem

The sample does not make a chat message authoritative. Its [`file-system.ts`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/file-system.ts) models a project as named source files. The streamed model loop offers structured file-manager and string-replacement tools; [`file-system-context.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/contexts/file-system-context.tsx) applies those calls in the browser rather than accepting prose as a mutation.

Registered projects persist that file graph as project data in Prisma. The unusually specific migration [`20250619174322_remove_filesystem_add_data_to_project`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/prisma/migrations/20250619174322_remove_filesystem_add_data_to_project/migration.sql) is also a useful lineage fingerprint.

## Editor and preview are two projections of the same files

[`CodeEditor.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/components/editor/CodeEditor.tsx) edits selected files. [`PreviewFrame.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/components/preview/PreviewFrame.tsx) transforms the current JSX for browser execution. The ordinary loop is therefore prompt → tool mutation → source inspection or manual correction → live projection → another prompt.

## Why the learner repositories collapse to this record

GitHub code search finds the distinctive `buildStrReplaceTool` implementation in many repositories under paths that explicitly include `claude-code-in-action/uigen`, `anthropic-academy`, or similar course labels. Rebar7/ai-component-generator, Lucasdev90/AI-component-generator-mcp, Gorris17/MultiAI-TS, AymanGarz/ai-ui-generator, nocodeanish/react-ui-generator and nuhuabdulai/polymath-ai-builder retain the same core tools and project migration. Provider additions or branding changes do not establish six independently defined products.

## Evidence and limits

- [Official Anthropic course](https://anthropic.skilljar.com/claude-code-in-action)
- [Inspected public course mirror](https://github.com/danjarosz/anthropic-claude-code-course/tree/24ae039c27c35ea0766cd291800c2258118d4d6e)
- [Representative file tool](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/tools/str-replace.ts)
- Inspected mirror commit: `24ae039c27c35ea0766cd291800c2258118d4d6e`

The mirror proves the working source shape but is not represented as an official Anthropic repository. The specific course-author team location is not publicly established and remains `unknown`.
