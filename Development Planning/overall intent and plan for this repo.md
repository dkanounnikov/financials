# Financials Repo: Working Intent And Initial Plan

## Purpose

This repo will become a small local application for loading financial statement files from banks and credit cards into a local Postgres database, then producing downstream outputs such as CSV files for spreadsheet/accounting workflows.

The goal is to replace the current PDI-based process with Python scripts and thin shell wrappers that can be run locally on the Mac after statement files are downloaded.

## Current Workflow

Today the process is roughly:

1. CSV files are downloaded manually from bank/credit card portals.
2. The files land in the Mac `Downloads` folder.
3. PDI processes the files.
4. Most transformation logic currently lives inside PDI jobs/transformations.
5. The database is populated from that logic.
6. CSV outputs are later produced for spreadsheet/accounting use.

## Current Database Context

The repo now contains DDL snapshots for the current database objects under [`Background info/SQL Files`](/Users/Dmitri/GIT-Repos/financials/Background%20info/SQL%20Files).

The database appears to have been designed with warehouse-style layers:

- `zrc`: raw/source-style objects
- `trn`: transformation/staging-style objects
- `fact` / `dim`: presentation/reporting-style objects

Not all current objects are functional, and some of the existing logic should be treated as reference rather than as something to preserve exactly.

## Initial Functional Scope

The initial build should focus on only two data streams:

1. Wells Fargo business checking
2. FNB business checking

The immediate intent is not to rebuild the whole historical warehouse. The intent is to create a repeatable local load flow that starts with one file pattern, works end to end, and can then be extended to the second stream and later to other accounts.

## Important Structural Observation

There is currently a mismatch between the conceptual target and the physical objects:

- [`fact.account_wf_business_checking.sql`](/Users/Dmitri/GIT-Repos/financials/Background%20info/SQL%20Files/fact.account_wf_business_checking.sql) is a `VIEW`, not a table.
- [`fact.account_wf_business_checking_load_history.sql`](/Users/Dmitri/GIT-Repos/financials/Background%20info/SQL%20Files/fact.account_wf_business_checking_load_history.sql) is the underlying loaded table.
- [`fact.account_fnb_business_checking_load_history.sql`](/Users/Dmitri/GIT-Repos/financials/Background%20info/SQL%20Files/fact.account_fnb_business_checking_load_history.sql) is a table, and there is not yet a matching curated/reporting view in the DDL set.

So, for implementation purposes, the likely real load targets are the load-history tables, with reporting/curation either handled by views or by downstream export scripts.

## Recommendation On Data Model Direction

A full warehouse pattern is probably heavier than necessary for this use case and expected data volume.

Recommended approach:

- Keep a very small raw/staging step only where it materially helps.
- Do not preserve `zrc -> trn -> fact` mechanically just because it existed before.
- Load into a simple, explicit target table per source stream.
- Add lightweight normalization/curation in Python and, where useful, in SQL views.
- Keep reporting/export logic separate from ingestion logic.

My recommendation is:

1. Keep one landing/staging table only if the source file is messy or unstable.
2. Keep one canonical loaded table for each stream.
3. Add curated views only when they provide real value for exports or analysis.
4. Avoid unnecessary dimension modeling unless a specific reporting need emerges.

For this repo, that likely means:

- Use `trn` only if a given source file needs an intermediate parse/cleanup table.
- Otherwise load straight into a canonical fact-like transaction table.
- Use views for classification, reporting, and accountant-facing export shaping.

## Suggested First Slice

Start with one new file flow that is not currently in production, but that mirrors the pattern of the existing tables.

The first slice should do only this:

1. Detect or accept a single source CSV file.
2. Parse it in Python.
3. Apply the minimum required cleaning and type conversion.
4. Load it into the chosen target table in Postgres.
5. Run a basic validation report.
6. Produce an initial CSV output if needed.
7. Wrap the process in a shell script so the run command is simple.

This first slice should optimize for clarity and repeatability, not completeness.

## Proposed Application Shape

The local app can stay small and straightforward:

- `scripts/` for shell entry points
- `src/` for Python ingestion and export code
- `config/` for file patterns, database settings, and mapping rules
- `sql/` for reusable SQL scripts or views if we decide to manage SQL explicitly in the repo
- `tests/` for parser and transformation checks once the first pipeline exists

Likely Python responsibilities:

- file discovery in `Downloads` or explicit file-path input
- CSV parsing
- source-specific mapping rules
- normalization and typing
- duplicate/load protection
- Postgres insert/upsert logic
- export generation
- logging and run summaries

Likely shell responsibilities:

- activate environment
- call the relevant Python command
- pass source file or default source directory

## Suggested Product Principles

- Local-first
- Simple to run
- Easy to debug
- Minimal hidden logic
- Version-controlled transformation rules
- Safe re-runs
- Clear outputs for accountant-facing exports

## Questions To Resolve Early

1. For the first pipeline, which exact source file should be treated as the pilot?
2. Should the loader automatically scan `~/Downloads`, or should each run require an explicit file path?
3. What counts as the duplicate key for each source stream?
4. Should we preserve raw files and/or raw imported rows for auditability?
5. Do we want exports generated immediately after load, or as a separate command?
6. Should category/payee classification live in SQL views, Python, or a separate mapping file?
7. For FNB, do we want a curated reporting view analogous to the Wells Fargo one?

## Near-Term Recommendations

1. Treat the existing SQL DDLs as reference, not as a forced architecture.
2. Build the first end-to-end pipeline around one source file.
3. Choose the canonical target object for that first flow before writing code.
4. Keep transformation logic in Python unless SQL is clearly the better home.
5. Move business mapping rules into configuration where practical, so they are easier to revise than hard-coded CASE logic.

## Immediate Next Build Step

The next implementation step should be to choose the first pilot file and define:

- expected input file shape
- target table
- load key / duplicate handling rule
- minimal cleaned output schema
- whether the first version should use direct load or a small staging table

Once that is decided, the repo can be scaffolded for the first Python loader and shell wrapper.
