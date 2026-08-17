# GPT-4 Landing Page Creator

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This 2023 PHP application is an early but complete prompt-to-page loop. Its durable unit is a generated page file exposed simultaneously as editable code and iframe output.

## Request becomes a stored page

[`request.php`](https://github.com/RenzoNogueira/ai-webpage-generator/blob/3622bc18815f239e28f3bd5b2f25399c7d0d9433/requests/request.php) sends the user prompt to GPT-4 and processes the resulting page source. The generated result is stored under the application rather than remaining only in a chat response.

## CodeMirror and iframe share the page

[`src/index.php`](https://github.com/RenzoNogueira/ai-webpage-generator/blob/3622bc18815f239e28f3bd5b2f25399c7d0d9433/src/index.php) joins prompt submission, a CodeMirror source surface, iframe rendering, refresh and download. The artifact loop is consequently source-owned: a person can see and edit the page that will be delivered.

## Historical cutoff

The pinned public history ends in 2023 and supplies no first-party evidence of a current service or maintained successor. The record preserves a materially independent implementation lineage without implying current operation.

## Pinned evidence

- [Canonical repository](https://github.com/RenzoNogueira/ai-webpage-generator)
- [Inspected tree](https://github.com/RenzoNogueira/ai-webpage-generator/tree/3622bc18815f239e28f3bd5b2f25399c7d0d9433)
- Commit: `3622bc18815f239e28f3bd5b2f25399c7d0d9433`
