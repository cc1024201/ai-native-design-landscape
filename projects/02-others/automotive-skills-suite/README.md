# Automotive Skills Suite

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Automotive Skills Suite is a chain of installable Claude skills that defines engineering design as the production and review of standards-bound artifacts across automotive safety, cybersecurity, systems, quality, calibration, and verification.

## File contracts form the system graph

Each builder emits a structured XLSX or related artifact whose sheets and fields become inputs to downstream skills. Traceability IDs, schemas, and tab names are operational interfaces: breaking them can invalidate an analysis chain even when the prose still looks plausible.

## Every builder has a reviewer

A matching confirmation skill reopens the artifact, checks required structure and domain rules, and produces findings plus a visual dashboard. Fault trees, GSN arguments, charts, and Mermaid views are derived evidence, not substitutes for the structured workbook authority.

## Standards shape rather than merely label output

ISO 26262, SOTIF, ASPICE, AUTOSAR, ASAM, cybersecurity, and quality practices impose different required records and review logic. The suite is therefore intentionally heterogeneous; it does not pretend one universal template can represent every engineering deliverable.

## Pinned evidence

- Repository: [jherrodthomas/automotive-skills-suite](https://github.com/jherrodthomas/automotive-skills-suite)
- Inspected builder/reviewer pairs, schemas, samples, renderers, and validation scripts: [`386191efc25c71d28fe3692ae29123affe015645`](https://github.com/jherrodthomas/automotive-skills-suite/tree/386191efc25c71d28fe3692ae29123affe015645)
- Immutable revision: [commit `386191e`](https://github.com/jherrodthomas/automotive-skills-suite/commit/386191efc25c71d28fe3692ae29123affe015645)
