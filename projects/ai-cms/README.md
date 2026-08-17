# AI CMS

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI CMS couples a GrapesJS page graph with “surgical” generation scoped to the selected component. The important mechanism is selection context: a prompt can replace or restyle one node without asking the model to regenerate the entire page.

## GrapesJS project JSON is recovery state

The editor loads saved `json_content` into GrapesJS and saves the current project data together with rendered HTML and CSS. [`EditorController.php`](https://github.com/iam-saksham-tyagi/ai-cms/blob/aab2eda461aae31755d14b8f612b1914b1bb78dc/app/Http/Controllers/EditorController.php) accepts generation requests, constructs context from the selected component and applies guards before returning replacement markup.

```text
template/page -> GrapesJS project JSON -> select component + prompt
-> generated HTML candidate -> DOM safety checks -> canvas replacement
-> save JSON + HTML + CSS -> public page
```

The [page migration](https://github.com/iam-saksham-tyagi/ai-cms/blob/aab2eda461aae31755d14b8f612b1914b1bb78dc/database/migrations/2026_02_28_103009_create_pages_table.php) makes the distinction explicit: editor JSON and delivery markup are stored separately. GrapesJS's undo manager covers in-session corrections; durable named versions are not implemented at the pinned commit. This is why the lifecycle is `active-transition`.

No license file or reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/iam-saksham-tyagi/ai-cms/tree/aab2eda461aae31755d14b8f612b1914b1bb78dc)
- [Editor view](https://github.com/iam-saksham-tyagi/ai-cms/blob/aab2eda461aae31755d14b8f612b1914b1bb78dc/resources/views/editor.blade.php)
- [Page model](https://github.com/iam-saksham-tyagi/ai-cms/blob/aab2eda461aae31755d14b8f612b1914b1bb78dc/app/Models/Page.php)
