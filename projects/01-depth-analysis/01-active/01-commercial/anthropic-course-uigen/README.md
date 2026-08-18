# UIGen — Claude Code in Action sample

UIGen is counted once as the runnable UI-generation sample used in Anthropic's **Claude Code in Action** course — not once per learner who republishes or renames it. The [official course page](https://anthropic.skilljar.com/claude-code-in-action) sets the boundary; the implementation was inspected through a public course mirror since Anthropic exposes no official source repo for the exercise.

## Design is a serialized virtual filesystem, not a message

The sample refuses to treat a chat reply as authoritative. Its [`file-system.ts`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/file-system.ts) models a project as named source files, and the streamed model loop exposes structured file-manager and string-replacement tools; [`file-system-context.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/contexts/file-system-context.tsx) applies those calls in the browser rather than accepting prose as a mutation. Registered projects persist that file graph as project data in Prisma — the migration `20250619174322_remove_filesystem_add_data_to_project` is a useful lineage fingerprint.

## Editor and preview are two views of the same files

[`CodeEditor.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/components/editor/CodeEditor.tsx) edits a selected file while [`PreviewFrame.tsx`](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/components/preview/PreviewFrame.tsx) transforms the current JSX for browser execution. The loop is prompt → tool mutation → source inspection or manual correction → live projection → another prompt.

## Why learner repos collapse to this record

GitHub code search finds the distinctive `buildStrReplaceTool` in many repositories under `claude-code-in-action/uigen`, `anthropic-academy` or similar labels — e.g. Rebar7/ai-component-generator, Lucasdev90/AI-component-generator-mcp, AymanGarz/ai-ui-generator, nocodeanish/react-ui-generator. Provider or branding changes don't create six independently defined products.

**Evidence** and limits

- [Official Anthropic course](https://anthropic.skilljar.com/claude-code-in-action)
- [Inspected public course mirror](https://github.com/danjarosz/anthropic-claude-code-course/tree/24ae039c27c35ea0766cd291800c2258118d4d6e)
- [Representative file tool](https://github.com/danjarosz/anthropic-claude-code-course/blob/24ae039c27c35ea0766cd291800c2258118d4d6e/src/lib/tools/str-replace.ts)
- Inspected mirror commit: `24ae039c27c35ea0766cd291800c2258118d4d6e`

The mirror proves the working source shape but isn't an official Anthropic repository; the course-author team location is not publicly established and remains `unknown`.
