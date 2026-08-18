# Panth PageBuilder AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Panth PageBuilder AI is an extension of Magento's existing visual authority rather than a parallel AI site builder. Its output must enter PageBuilder as native editable markup, and governance around that write is as important as generation itself.

## Generation targets PageBuilder vocabulary

The admin [`pagebuilder-ai-toolbar.js`](https://github.com/mage2sk/module-pagebuilder-ai/blob/b23afcedc64fe56bed8bc63daaf654bf258c75e8/view/adminhtml/web/js/pagebuilder-ai-toolbar.js) collects a page type, prompt and optional reference image. The [`Generate` controller](https://github.com/mage2sk/module-pagebuilder-ai/blob/b23afcedc64fe56bed8bc63daaf654bf258c75e8/Controller/Adminhtml/Generate/Index.php) routes that context to the configured OpenAI or Anthropic provider and returns PageBuilder-compatible content. Once inserted, blocks can be edited, duplicated or removed through normal Magento operations.

## Governance is durable product state

Saved prompt templates and the knowledge base constrain repeated work across administrators. Bulk jobs use Magento's queue and land as drafts before approval. [`RequestLogger.php`](https://github.com/mage2sk/module-pagebuilder-ai/blob/b23afcedc64fe56bed8bc63daaf654bf258c75e8/Model/RequestLogger.php) records prompt, response, provider, model, tokens, latency, actor and target. Monthly budgets are enforced separately from the artifact.

## Authority judgment

Magento PageBuilder owns the published page graph; the model proposes native markup or field values. Prompt libraries, draft queues and logs govern how proposals cross that boundary but do not become the storefront artifact themselves.

## Pinned evidence

- [Canonical repository](https://github.com/mage2sk/module-pagebuilder-ai)
- [First-party product page](https://kishansavaliya.com/magento-2-pagebuilder-ai.html)
- [Inspected tree](https://github.com/mage2sk/module-pagebuilder-ai/tree/b23afcedc64fe56bed8bc63daaf654bf258c75e8)
- Commit: `b23afcedc64fe56bed8bc63daaf654bf258c75e8`
