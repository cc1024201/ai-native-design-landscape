# AI Website Builder by Krishna Paralkar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Krishna's implementation is a single-document website generator with account and project recovery. It is deliberately simpler than its roadmap: current source and preview exist now while export and version history do not.

## OpenRouter returns one complete document

[server.js](https://github.com/KrishnaParalkar-5034/Ai_Website_Builder/blob/e0e69cbe082c8667011f7599186235ee1e31be03/server.js) calls OpenRouter for complete HTML with embedded style and behavior and writes accepted output as a SQLite project associated with the authenticated user.

## SQLite recovers projects but not prior states

The same server exposes project list and load routes around the current stored code. There is no version table or restoration endpoint. The README's export and version-history items are explicitly future enhancements and are not counted as implemented evidence.

## Browser projection and delivery stop at copy

[index.html](https://github.com/KrishnaParalkar-5034/Ai_Website_Builder/blob/e0e69cbe082c8667011f7599186235ee1e31be03/index.html) places current source in an iframe and offers code viewing and clipboard copy. This closes a real visual loop but not a file-package or hosted-deploy loop.

## Evidence

- [Canonical repository](https://github.com/KrishnaParalkar-5034/Ai_Website_Builder)
- [Inspected tree](https://github.com/KrishnaParalkar-5034/Ai_Website_Builder/tree/e0e69cbe082c8667011f7599186235ee1e31be03)
- Commit: e0e69cbe082c8667011f7599186235ee1e31be03
