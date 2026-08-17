# Prompt-to-App AI Code Generator by Pradeep

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This is a client-side generator, not the separately counted Prompt To App service at `prompttoapp.dev`. Its ordinary loop lives largely inside one React editor: choose an application class, prompt OpenAI, parse the returned file blocks, inspect or change them in Monaco, preview supported web output and download a ZIP.

## In-memory tabs are the working artifact

Pinned revision: `6137c008e013c61b004be9b9fde5659c9fed871c`.

`CodeEditor.tsx` holds generated files, open tabs, current source, recent conversational context, preview state and debug output in component state. The generator asks for a different file set for web, mobile, desktop, API and CLI targets. That is a real multi-file authority while the page is open, but no project database or durable version model is evidenced.

## Preview is target-dependent

Web files can be assembled into a browser projection. Other targets are source deliverables rather than equivalently executable previews. The code's deployment dialog enumerates destinations and logs UI state, but its action closes the dialog; it does not implement an authenticated cloud deployment. The reliable delivery path is ZIP download.

## Security and recovery boundary

The OpenAI client is instantiated in the browser. That keeps the architecture simple but places credential handling and request trust at the client boundary. Refresh recovery, team collaboration and historical restore are not present in the inspected source.

## Pinned evidence

- [Repository](https://github.com/pradeep9557/prompt-to-app)
- [Generator, file parser and Monaco workspace](https://github.com/pradeep9557/prompt-to-app/blob/6137c008e013c61b004be9b9fde5659c9fed871c/src/components/CodeEditor.tsx)
- [Deployment-choice UI](https://github.com/pradeep9557/prompt-to-app/blob/6137c008e013c61b004be9b9fde5659c9fed871c/src/components/DeployDialog.tsx)
