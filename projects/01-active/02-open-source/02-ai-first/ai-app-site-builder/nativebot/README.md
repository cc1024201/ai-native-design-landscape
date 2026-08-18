# NativeBot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NativeBot defines mobile app generation as a local project that the user owns. Claude Agent SDK tools mutate an Expo/React Native and optional backend workspace; the same source can be previewed on a phone and taken through the ordinary Expo submission workflow.

## The filesystem is the durable artifact

[`src/nativebot/projects.py`](https://github.com/easonwang00/NativeBot/blob/e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8/src/nativebot/projects.py) creates projects under `~/.nativebot/projects/<name>`, copies the mobile/backend template, and stores metadata and conversation history under `.nativebot`. Source files remain ordinary local files, so an external editor and the agent operate on the same authority.

[`src/nativebot/agent.py`](https://github.com/easonwang00/NativeBot/blob/e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8/src/nativebot/agent.py) starts the Claude Agent SDK with the project directory as its working directory and a bounded tool set. Session continuation restores conversational context, but the filesystem—not the transcript—is what makes the app runnable.

## Device preview and store handoff are standard toolchains

[`src/nativebot/cli.py`](https://github.com/easonwang00/NativeBot/blob/e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8/src/nativebot/cli.py) implements `nativebot preview` by starting Expo and displaying its QR code. `nativebot export` provides the EAS build and submission handoff for App Store or Google Play. NativeBot does not replace Expo's release system; it delivers owned source into it.

## Evidence and location

- [Canonical repository](https://github.com/easonwang00/NativeBot)
- [Inspected tree](https://github.com/easonwang00/NativeBot/tree/e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8)
- [Product and command contract](https://github.com/easonwang00/NativeBot/blob/e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8/README.md)
- Commit: `e642ead761d7b6dd1cf1d7baa59ee99b69d07bd8`

The maintainer's [GitHub profile](https://github.com/easonwang00) states Canada; team region is recorded as Canada.
