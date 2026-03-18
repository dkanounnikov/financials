# Process - Project Workflow

## Source Of Truth

The source of truth for core project direction is currently:

- [`overall intent and plan for this repo.md`](/Users/Dmitri/GIT-Repos/financials/Development%20Planning/overall%20intent%20and%20plan%20for%20this%20repo.md)

Markdown files in this repo are the durable memory system. Chat is for reasoning, drafting, and proposing changes, but not for being the authoritative store of project memory.

## File Roles

### Core brief

- Durable project direction
- Approved framing
- Stable structure and operating assumptions
- Should stay coherent and not become a dumping ground

### Inbox

- Rough captures
- Fragments
- Open questions
- Unvalidated ideas
- End-of-day restart notes

### Working notes

- Active drafting
- Candidate structures
- Exploratory text
- In-progress implementation thinking

### Decisions log

- Approved decisions only
- Short rationale
- Follow-up implications

### Restart notes

- Short operational handoff to the next session
- Where to resume
- What is blocked
- What to read first

### Topic-specific files

- Use only when a topic becomes large enough to deserve its own surface
- Good examples here: ETL reference capture, PDI reporting logic extraction, source-file specs

## Idea Classification

Before editing files, classify an idea as one of:

- Core: durable enough to affect the main brief
- Provisional: plausible but not yet approved; keep in inbox or working notes
- Topic-specific: belongs in a narrower file, not in the main brief

## Default Working Flow

1. Read the main relevant file first.
2. Read only the supporting files needed for the current task.
3. Identify tensions, gaps, overlaps, or candidate additions.
4. Decide where the idea belongs before editing.
5. Draft exact text when useful.
6. Apply small, reviewable edits.
7. For major changes to the core brief, propose the change before applying it unless explicitly asked to edit directly.

## Review And Approve Flow For Major Core Edits

Use this flow before major edits to the main brief:

1. Identify the gap or conflict.
2. Say whether the idea is core, provisional, or topic-specific.
3. Recommend the destination file.
4. Draft the exact proposed text or structure.
5. Wait for review/approval before making the major core edit, unless direct edits were explicitly requested.

## How To Avoid Duplication And Drift

- Keep one primary home for each durable idea.
- Use support files to develop or support ideas, not to redefine the core brief.
- When a provisional idea becomes approved, promote it and remove or collapse the duplicate draft.
- Prefer linking to the core brief over restating it in multiple files.
- Keep topic-specific details out of the main brief unless they materially affect project direction.

## End-Of-Day Practice

At the end of a session:

1. Record any approved decisions in the decisions log if needed.
2. Add a short "tomorrow start here" note in the inbox or restart notes.
3. Commit and push when explicitly requested.
