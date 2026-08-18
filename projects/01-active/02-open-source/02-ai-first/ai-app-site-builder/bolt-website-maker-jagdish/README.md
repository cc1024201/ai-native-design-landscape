# BOLT AI Website Builder by Jagdish Suthar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This BOLT is an independently implemented Gemini website builder, not another copy of StackBlitz's Bolt source. Its frontend and backend are published as companion repositories: one generates an XML action stream, while the other persists and runs the resulting project.

## Two repositories share one product protocol

Pinned frontend revision: `905d02477b5ce71aec3a56e97f29373a618b9a73`.

Pinned backend revision: `387d889e4ed3b9b9a2b3f98de258225401b2881f`.

The backend turns the first prompt into a template choice and Gemini-generated file instructions. Follow-up prompts include the last serialized project and use Pinecone-supported context before returning a replacement action stream. The frontend parses that XML-like stream into a file tree. Because neither repository alone exposes the full user loop, they are consolidated into this one product record.

## Mongo owns the recoverable project string

Prisma stores users, chats and user/AI messages plus one `WebContainerState` per chat. That state is a serialized project string, not a normalized file table. A follow-up replaces the saved state, while messages preserve the displayed conversational response. The code viewer is read-only in this revision, so manual source editing is not a competing authority.

This persistence model restores the latest project and conversation after login, but it has no first-class version or rollback graph. Earlier message payloads may contain prior generated structures, yet the product does not expose them as selectable source snapshots.

## Runtime projection is real and deliberately browser-local

The frontend converts the saved state into a WebContainer `FileSystemTree`, mounts it, installs dependencies and runs the declared development server. `server-ready` supplies the iframe URL. Subsequent generation remounts the replacement tree into the same browser runtime. Mongo remains the durable source representation; WebContainer is an executable projection that can be recreated.

The repository does not implement a publication adapter despite README language extending the loop “from prompt to deployment.” Its evidenced handoff ends at persisted source and live preview.

## Pinned evidence

- [Frontend repository](https://github.com/JagdishSuthar1/bolt-website-maker)
- [Backend repository](https://github.com/JagdishSuthar1/bolt-website-maker-be)
- [Saved source and WebContainer projection](https://github.com/JagdishSuthar1/bolt-website-maker/blob/905d02477b5ce71aec3a56e97f29373a618b9a73/src/components/webContainerPage/index.tsx)
- [Mongo project and conversation schema](https://github.com/JagdishSuthar1/bolt-website-maker/blob/905d02477b5ce71aec3a56e97f29373a618b9a73/prisma/schema.prisma)
- [Follow-up replacement and state persistence](https://github.com/JagdishSuthar1/bolt-website-maker/blob/905d02477b5ce71aec3a56e97f29373a618b9a73/src/components/user-chat-page/user.tsx)
- [Initial Gemini generation route](https://github.com/JagdishSuthar1/bolt-website-maker-be/blob/387d889e4ed3b9b9a2b3f98de258225401b2881f/src/routes/prompt.ts)
- [Contextual follow-up route](https://github.com/JagdishSuthar1/bolt-website-maker-be/blob/387d889e4ed3b9b9a2b3f98de258225401b2881f/src/routes/follow-back-prompt.ts)
