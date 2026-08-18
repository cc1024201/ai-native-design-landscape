# Naano WP AI Website Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Naano treats a WordPress page as an ordered set of independently generated sections. This is not a one-shot HTML response: long work is split into provider calls and the user can replace reorder or directly edit each section before publishing.

## Section records are the editable authority

[`class-section-manager.php`](https://github.com/Pispros/naano-wp-ai-website-builder/blob/f6e478352f2b78577297d04a55d7efe2fef3a8be/includes/class-section-manager.php) stores section id type HTML order and timestamps in page post metadata. It can insert update delete and reorder sections and assembles the current list into a complete document. Global CSS is stored separately so it can override the assembled page without asking the model to rewrite every section.

## Provider routing is explicit

[`class-llm-router.php`](https://github.com/Pispros/naano-wp-ai-website-builder/blob/f6e478352f2b78577297d04a55d7efe2fef3a8be/includes/class-llm-router.php) selects dedicated Claude Gemini Kimi OpenAI or DeepSeek adapters. [`class-job-runner.php`](https://github.com/Pispros/naano-wp-ai-website-builder/blob/f6e478352f2b78577297d04a55d7efe2fef3a8be/includes/jobs/class-job-runner.php) deliberately performs one LLM round trip per WordPress cron tick. A multi-section build therefore survives shared-host execution limits and exposes per-section failure rather than losing the whole page.

## Preview and publication are different states

[`assets/js/preview.js`](https://github.com/Pispros/naano-wp-ai-website-builder/blob/f6e478352f2b78577297d04a55d7efe2fef3a8be/assets/js/preview.js) renders the assembled draft for visual inspection. Builder AJAX handlers mutate section metadata. Saving those working sections does not automatically replace the live post; explicit publication advances the accepted assembly into WordPress's public authority.

## Recovery model

Naano records current sections and failed-section metadata but does not expose a named immutable version graph of its own. WordPress revisions may protect the published post outside this plugin; they should not be confused with native Naano design candidates.

## Evidence

- [Canonical repository](https://github.com/Pispros/naano-wp-ai-website-builder)
- [Inspected tree](https://github.com/Pispros/naano-wp-ai-website-builder/tree/f6e478352f2b78577297d04a55d7efe2fef3a8be)
- [AJAX mutation boundary](https://github.com/Pispros/naano-wp-ai-website-builder/blob/f6e478352f2b78577297d04a55d7efe2fef3a8be/includes/class-ajax-handler.php)
- Commit: `f6e478352f2b78577297d04a55d7efe2fef3a8be`

The maintainer profile's location value is not a usable geographic statement; region remains `unknown`.
