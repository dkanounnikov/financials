# Decisions Log

Purpose: approved decisions only. This file is the durable record of decisions that have been made and should guide future work.

Rules:

- Log only approved or clearly adopted decisions.
- If an idea is still being explored, keep it in the inbox or working notes.
- Keep entries short and concrete.

## Decision Template

### Decision

- Date:
- Status: Approved
- Topic:
- Decision:
- Why:
- Implication / follow-up:

## Current Decisions

### Decision

- Date: 2026-03-18
- Status: Approved
- Topic: Source of truth
- Decision: Markdown files in this repo are the long-term memory system; chat is drafting/reasoning space, not the authoritative store.
- Why: This project will span multiple days and needs durable continuity outside chat memory.
- Implication / follow-up: Major project context should live in repo files, especially the main brief and support documents.

### Decision

- Date: 2026-03-18
- Status: Approved
- Topic: Core planning document
- Decision: [`overall intent and plan for this repo.md`](/Users/Dmitri/GIT-Repos/financials/Development%20Planning/overall%20intent%20and%20plan%20for%20this%20repo.md) is the current source of truth for core project direction.
- Why: It already contains the durable project brief, constraints, and initial recommendations.
- Implication / follow-up: Support files should inform it, not silently override it.

### Decision

- Date: 2026-03-18
- Status: Approved
- Topic: Workspace pattern
- Decision: Use a lightweight repo-first workflow patterned after the Bicycle strategy workspace: inbox, decisions log, working notes, workflow/process, and restart notes.
- Why: It supports iterative work while keeping the main brief coherent.
- Implication / follow-up: Future changes should be routed to the right file before broad edits are made.
