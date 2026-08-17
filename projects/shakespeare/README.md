# Shakespeare

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Shakespeare defines app design as a browser-owned source repository. The ordinary user starts from a template or Git repository, asks an agent to change the project, sees an in-browser build, and can synchronize or publish the same files without transferring artifact authority to a hosted workspace.

## The browser filesystem is the project boundary

Pinned revision: `5d02627cff750bc3fd7a9a77861687abdd316bf6`.

`ProjectsManager` creates each project under the persistent virtual filesystem, initializes an isomorphic-git repository, stages the template and makes an initial commit. The session tools read, write, edit, search and run commands against that same project path. Conversation history, finish state and accumulated cost are written into the project's `.ai` records, so agent context travels with the source rather than living only in React state.

This is not a WebContainer product. LightningFS supplies IndexedDB-backed files, the custom JavaScript runtime supplies shell and filesystem operations, and `esbuild-wasm` compiles compatible React projects. The preview is a projection of generated `dist` output; unsupported repositories remain editable even when they cannot be rendered.

## Git is both recovery mechanism and cross-device transport

Every project is a real browser-side repository. Local commits preserve source checkpoints, while push and pull are the synchronization path across devices. AI and Git provider settings stay local, so synchronizing code does not automatically synchronize provider credentials. This split is an explicit privacy choice but also means a recovered repository may need its local configuration rebuilt.

## Publication consumes the build instead of redefining it

Provider adapters collect the compiled `dist` tree and send it to Vercel, Netlify, Railway, Shakespeare hosting or Nostr-native nsite delivery. Deployment metadata does not become a second editable artifact. The source repository remains canonical before and after publication, and the build must contain a usable entry point before an adapter will accept it.

## Pinned evidence

- [Repository](https://github.com/soapbox-pub/shakespeare)
- [Browser project and Git lifecycle](https://github.com/soapbox-pub/shakespeare/blob/5d02627cff750bc3fd7a9a77861687abdd316bf6/src/lib/ProjectsManager.ts)
- [Agent sessions and project-local history](https://github.com/soapbox-pub/shakespeare/blob/5d02627cff750bc3fd7a9a77861687abdd316bf6/src/lib/SessionManager.ts)
- [In-browser compiler and output authority](https://github.com/soapbox-pub/shakespeare/blob/5d02627cff750bc3fd7a9a77861687abdd316bf6/src/lib/build/index.ts)
- [Vercel adapter over compiled files](https://github.com/soapbox-pub/shakespeare/blob/5d02627cff750bc3fd7a9a77861687abdd316bf6/src/lib/deploy/VercelAdapter.ts)
- [Nostr-native nsite publication](https://github.com/soapbox-pub/shakespeare/blob/5d02627cff750bc3fd7a9a77861687abdd316bf6/src/lib/deploy/NsiteAdapter.ts)
