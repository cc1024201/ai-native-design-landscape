# Resume Matcher

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Resume Matcher is a structured document-design workspace for tailoring a master resume to a job, reviewing the changes, directly editing layout and content, and producing a paginated PDF. The resume remains a typed artifact with lineage rather than collapsing into model-written prose.

## Master and tailored resumes have explicit lineage

The backend [`models.py`](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/backend/app/models.py) stores structured `processed_data` and a `parent_id` from a tailored resume back to its source. Improvement records link the original resume, tailored resume and job context. This separates a reusable master from job-specific candidates instead of destructively overwriting it.

## Tailoring is constrained by source facts

[`improver.py`](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/backend/app/services/improver.py) verifies proposed diffs, checks the original values being changed and validates the skill-target plan. The prompts require claims to remain grounded in the master resume. The UI's [`diff preview`](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/frontend/components/tailor/diff-preview-modal.tsx) exposes summaries, added or removed skills, modified descriptions and high-risk changes before adoption.

This makes the AI step a candidate transformation with a review gate, not unreviewed text replacement.

## The selected document remains directly editable

[`resume-builder.tsx`](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/frontend/components/builder/resume-builder.tsx) edits structured sections, template settings and layout while maintaining a live preview. Regeneration checks whether its source snapshot is stale before applying results.

The builder also distinguishes server state from local drafts. Debounced autosave, manual flush ordering and explicit draft recovery prevent an old placeholder or failed read from silently overwriting the user's resume. This persistence work is central to the ordinary editing loop, not incidental infrastructure.

## PDF is a verified derivative

Preview components paginate the structured document, and backend [`pdf.py`](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/backend/app/pdf.py) uses Playwright to open the print route, wait for the expected selector and fonts, then emit PDF. The PDF is delivery output; the database's structured resume remains the editable authority.

## Boundary

ATS feedback and generated wording are advisory and require user verification. Resume Matcher does not prove employer acceptance or factual accuracy merely because a diff passes schema checks. It qualifies because AI transformation, manual document Design, lineage, recovery and final rendering form one evidenced product loop.

## Evidence

- [Pinned repository](https://github.com/srbhr/Resume-Matcher/tree/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc)
- [Paginated preview](https://github.com/srbhr/Resume-Matcher/blob/116f9cc3b00e1ac91734a6c2679bf41ea64a0edc/apps/frontend/components/preview/paginated-preview.tsx)
