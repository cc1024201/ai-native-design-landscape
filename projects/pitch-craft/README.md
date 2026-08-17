# Pitch Craft

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pitch Craft makes the assistant's complete HTML response the site artifact and organizes those responses inside authenticated chat sessions.

## Chat and website source are the same record

[`useChatEngine.js`](https://github.com/NOMANRAHIM77/AI-websiteGenerator/blob/05bde5660208314af4944d100cbfa2c874c4ef69/src/hooks/useChatEngine.js) supplies prior messages to Gemini and requires complete HTML. [`Home.jsx`](https://github.com/NOMANRAHIM77/AI-websiteGenerator/blob/05bde5660208314af4944d100cbfa2c874c4ef69/src/pages/Home.jsx) extracts that HTML, sends it to the preview and writes the unchanged assistant response into the active Firestore chat. A later correction therefore sees the earlier source as conversation history rather than a separate VFS snapshot.

[`PreviewArea.jsx`](https://github.com/NOMANRAHIM77/AI-websiteGenerator/blob/05bde5660208314af4944d100cbfa2c874c4ef69/src/components/PreviewArea.jsx) is a direct `srcDoc` projection. Firebase Authentication scopes chats by user and Firestore retains chat and message ordering, but the inspected source has no separate version entity or deployment record.

## Evidence

- [Canonical repository](https://github.com/NOMANRAHIM77/AI-websiteGenerator)
- [Inspected tree](https://github.com/NOMANRAHIM77/AI-websiteGenerator/tree/05bde5660208314af4944d100cbfa2c874c4ef69)
- Commit: `05bde5660208314af4944d100cbfa2c874c4ef69`
