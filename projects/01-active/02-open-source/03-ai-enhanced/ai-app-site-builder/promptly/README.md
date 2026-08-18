# Promptly

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Promptly is a small prompt-to-site builder that uses the Cursor Agent SDK as a text generator while deliberately denying it host filesystem tools. The browser—not the local agent workspace—owns the generated application.

## Cursor is constrained to emit an artifact program

Pinned revision: `9988aac34cba6ac077d8f604f7dc2cb7399f5784`.

The backend launches Cursor Composer in an isolated temporary directory, but prepends a directive forbidding write, edit, delete and shell tools. The only accepted result is plain text containing a `<boltArtifact>` block. This is an unusual safety boundary: the SDK supplies the model, while an application-specific string protocol supplies authority.

The backend formats the complete conversation into each request. Refinement can therefore see earlier artifact text, but there is no durable agent thread or repository checkout in the scratch directory.

## Artifact actions become a browser file graph

The frontend parses `boltAction` file entries into ordered steps and reduces them into a nested file tree. Later actions for an existing path overwrite that path while unrelated files survive. Shell actions are displayed as steps, but the file graph—not arbitrary host execution—is what feeds the workbench.

The code pane is read-only in this revision. Ordinary correction is prompt-driven rather than a merge between manual Monaco edits and agent writes.

## WebContainer is a projection of React state

The generated tree is mounted into a singleton WebContainer, dependencies are installed with a retry path, and a development-server event supplies the iframe URL. Changes to the file signature rebuild that projection. A successful preview establishes that this browser state runs; it does not make the runtime filesystem durable.

## Refinement is overwrite history, not version history

Conversation messages and generated steps live in component state. There is no project database, browser persistence, named version or restore operation. The only explicit durable exit is a client-generated ZIP containing the current reduced file tree.

Promptly therefore demonstrates a clean ephemeral creation loop—intent → artifact program → files → preview → prompt refinement → ZIP—while making no stronger persistence claim.

## Pinned evidence

- [Repository](https://github.com/Simran903/bolt.new)
- [Cursor Agent isolation and text-only directive](https://github.com/Simran903/bolt.new/blob/9988aac34cba6ac077d8f604f7dc2cb7399f5784/backend/src/client.ts)
- [Artifact parser and path overwrite semantics](https://github.com/Simran903/bolt.new/blob/9988aac34cba6ac077d8f604f7dc2cb7399f5784/frontend/lib/parse.ts)
- [Generation, refinement and ZIP delivery](https://github.com/Simran903/bolt.new/blob/9988aac34cba6ac077d8f604f7dc2cb7399f5784/frontend/components/builder/BuilderPage.tsx)
- [WebContainer mount and preview lifecycle](https://github.com/Simran903/bolt.new/blob/9988aac34cba6ac077d8f604f7dc2cb7399f5784/frontend/hooks/useProjectRunner.ts)
