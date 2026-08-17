# Maintainer handoff

This repository is ready to hand to another maintainer as an internally consistent research snapshot. It is not a claim that the global field has been completely enumerated.

## Snapshot at handoff

- Data cutoff: 2026-08-13.
- Verified canonical records and project dossiers: 1,504.
- Candidate-register rows: 2,402.
- Candidate decisions: 1,504 included, 262 duplicate, 636 excluded and 0 pending.
- Reproducible discovery batches: 146, covering 6,801 reviewed result cards.
- Evidence depth: 1,219 source-level and 285 architecture-level dossiers.
- Declared saturation frame: 27 strata, of which 26 are active, 1 is paused and 0 are blocked.
- Team-region evidence: 742 candidate rows known and 1,660 unknown.

These counts describe the repository's observable sample and decision ledger. They are not estimates of the total number of products, teams, Design definitions or technical approaches worldwide.

## Where to start

1. Read [`README.md`](README.md) for the current field-level synthesis and full verified registry.
2. Read [`DISCOVERY.md`](DISCOVERY.md) before adding or excluding a candidate; it defines the units, evidence boundary and stopping rules.
3. Read [`CONTRIBUTING.md`](CONTRIBUTING.md) before changing a dossier, identity or taxonomy assignment.
4. Use [`data/saturation-strata.csv`](data/saturation-strata.csv) to select the next active search stratum instead of assuming the current sample is complete.

The most recent UI/app/site comparable run ends at `SAT-DOM-UI-026`. It remains nonqualifying: 23 of 58 reviewed cards were first-seen candidates and only 35 of 58 retained mentions resolved to known candidates. The Figma Forum surface is the only paused stratum, based on `SAT-EN-FIGMA-005` through `SAT-EN-FIGMA-007`; that pause applies only to that search surface.

## Safe update sequence

1. Append an immutable discovery-batch row with exact queries and the reviewed-card denominator.
2. Record every retained candidate or repeat reference in the candidate ledger.
3. Resolve identity, scope and negative decisions before inclusion.
4. For an included candidate, add the census, organization, identity and verification rows together with one project-specific dossier.
5. Structure the dossier around that project's decisive artifact and mutation path. The research lenses are not a mandatory ten-section template.
6. Change the root taxonomy only when verified project evidence shows that an existing family erases a consequential difference.
7. Synchronize the derived report and then run the integrity check:

```powershell
./scripts/sync-readme-derived.ps1
./scripts/verify-census.ps1 -Json
```

The second command must exit successfully before publishing. Do not edit the generated registry or derived counts in `README.md` by hand; update the ledgers and synchronization script instead.

## Highest-value continuation work

- Continue comparable batches in the 26 active strata until each either earns three consecutive qualifying batches or exposes a new search vocabulary that reopens the frame.
- Audit the 1,660 candidate rows whose team region remains unknown using first-party organization or maintainer evidence; never infer geography from query language or localized marketing.
- Revisit the 285 architecture-level dossiers when new protocols, distributions or source become public, while preserving explicit unknowns for closed internals.
- Keep recursive companion, fork, migration and lineage checks attached to discovery. Repository count must not be mistaken for product or team count.
- Prefer work that changes or tests a field-level claim. More profile pages alone are not progress.

## Non-negotiable interpretation boundary

The repository's value is the inspectable observation system: reproducible discovery, explicit negative decisions, canonical identities, product-specific mechanism evidence and revisable cross-project synthesis. It must not become an encyclopedia of disconnected product descriptions, and it must never present the current 1,504 records or 10/12/10 taxonomy as a global total.
