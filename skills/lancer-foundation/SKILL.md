---
name: lancer-foundation
description: Builds the foundation for a project starting from nothing - brief, scope cut, risk spikes, direction, architecture contract, scaffold, quality harness, walking skeleton, backlog - then gates it and hands off to Lancer Loop. Use when nothing is built yet, or the user says /lancer-foundation or "Lancer Foundation".
---

# Lancer Foundation

You turn an idea into an **approved, running anchor** that a Lancer Loop can polish safely. Loops sharpen a direction; they cannot choose one, and they amplify whatever they start from. This skill makes sure what they start from is right.

You are the lead agent. You do the work yourself unless the AGENT POLICY says you must spawn.

**Output when done** — these files, and a running skeleton:

| File | Purpose |
|---|---|
| `BRIEF.md` | Problem, users, MVP cut, non-goals, success checks |
| `SPIKES.md` | Risky unknowns and what the throwaway tests proved |
| `ANSWER_KEY.md` (logic) and/or `refs/` + `DIRECTION.md` (visual) | The bar later loops judge against |
| `ARCHITECTURE.md` | The contract every later agent must read first |
| `DECISIONS.md` | Every non-obvious choice, with the reason and the rejected options |
| `BACKLOG.md` | Pieces for the loop, mapped to modules and key IDs, coupling marked |
| `FOUNDATION.md` | Handoff summary + pre-filled Lancer Loop variables |
| `foundation-status.md` | Live progress, resumable after a crash or compaction |

Build nothing before Stage 1 is approved.

---

## STAGE 0 — GRILL (short)

Ask ONE question at a time. Skip anything already answered, in files, or in the repo. Reject vague answers ("modern", "clean", "scalable") — ask what would prove it. Ceiling: 10 questions; then apply the [default] and flag it.

| Var | Question | Values [default] |
|---|---|---|
| A | What are you building, and for whom? One sentence each. | free text; classify `visual` / `logic` / `content` / `mixed` |
| W | What does one user do, start to finish, in the most important flow? | step list — this becomes the walking skeleton |
| M | What must exist for version 1 to be worth using? What can wait? | must / later lists |
| N | What is it explicitly NOT? | non-goals list [ask again — never empty] |
| K | What do you not know how to do yet? (new API, OCR, payments, realtime, game physics, a library you've never used) | unknowns list [none] |
| L | Anything you admire that looks or works like what you want? | links/files, or none |
| T | Stack and hosting? Any hard constraints? | free text [ask — never assume] |
| D | Data: what is stored, who owns it, anything sensitive? | free text |
| C | If it's wrong, what breaks? | `low` / `high` [high] |
| X | What must never happen without your approval? | list [no deploy, no paid services, no secrets in code, no deleting existing files] |

---

## STAGE 1 — BRIEF  ▸ CHECKPOINT 1

Write `BRIEF.md`:
- **Problem + users** in two sentences.
- **Core flow** (W) as numbered steps.
- **MVP cut** — a three-column table: MUST (v1) / LATER / NEVER (non-goals). Push back if MUST holds more than ~7 items; ask what to move to LATER.
- **Success checks** — at least 5 pass/fail statements a stranger could verify for v1.
- **Risk list** — each unknown from K, rated `blocks-architecture` or `local`.

STOP. Show BRIEF.md. Do not continue until the user approves or edits it.

---

## STAGE 2 — SPIKES (only if K has `blocks-architecture` items)

For each such unknown, write the smallest throwaway prototype that answers ONE question ("Can Qianfan-OCR read a crumpled receipt at usable accuracy?", "Does Supabase realtime hold 50 clients?").
- Spikes live in `./spikes/<name>/`, never in the real codebase.
- Time-box each one. Record the question, the method, the result and the decision in `SPIKES.md`.
- A spike that fails changes the plan. Report it at Checkpoint 2; never quietly work around it.

---

## STAGE 3 — DIRECTION + BAR

Pick the path by A:

- **logic / content** → write `ANSWER_KEY.md`. List every decision the build depends on (data model, rules, edge cases, error states, permissions). Ask the user about each OPEN one, one at a time, until none remain. Turn each rule into numbered pass/fail checks plus at least 3 edge cases. These become executable tests in Stage 5.
- **visual** → run a mini-Tournament on LOW-FIDELITY directions only (layout, hierarchy, tone — no polish):
  1. Define 3 deliberately different directions along one named axis.
  2. Each is built by a separate candidate agent (must-case: Tournament candidates).
  3. Capture identically. 3 fresh-context judges compare pairs blind against BRIEF.md's success checks.
  4. Show the top 2 with captures and judge reasons. The user picks. Record it in `DIRECTION.md`.
- **mixed** → both: the answer key for the logic, the mini-Tournament for the UI.

Gather a reference corpus into `./refs/<area>/`: the picked direction's captures, any admired references from L (captured, not just linked), and measured numbers where relevant. Later Anchored loops judge against this.

---

## STAGE 4 — ARCHITECTURE CONTRACT  ▸ CHECKPOINT 2

Write `ARCHITECTURE.md`. Its first line: *"This file is the only coordination mechanism. Every agent reads it before writing code. Changes require the user's approval."*

It must contain:
1. **Module ownership table** — module · owns · must never touch. Rules live in pure logic; UI renders and nothing else; data access goes through one layer.
2. **Folder structure** — exact paths.
3. **Data model** — entities, fields, relations, which module writes each. For a database: schema plus access rules (e.g. RLS) written down, not implied.
4. **Interfaces between modules** — function signatures or API routes, with input and output types. These are frozen contracts; later loops may not change them without approval.
5. **State management** — where state lives and who may change it.
6. **Stack rules** — versions, allowed libraries, banned patterns, naming conventions.
7. **Coupling map** — which modules must change together. Lancer Loop uses this to give coupled parts a single owner.
8. **Capture contract** — how judges will see output: fixed viewports, seeded routes or fixtures, test commands.

Write `DECISIONS.md`: each non-obvious choice → the reason → the options rejected.

STOP. Show the direction/answer key, the spike results, ARCHITECTURE.md and DECISIONS.md together. Do not scaffold until the user approves.

---

## STAGE 5 — SCAFFOLD + QUALITY HARNESS

Build exactly what ARCHITECTURE.md specifies, nothing more:
- Repo structure, dependencies pinned, and linting, formatting and type checking configured.
- `.env.example` with every variable named; no real secrets anywhere in code or commits.
- Test runner, with the ANSWER_KEY checks written as tests (failing is fine at this point; they must exist and run).
- **Deterministic capture**: a script that renders fixed routes at fixed viewports with seeded data and saves screenshots, plus a timing or log capture where behavior matters.
- One command, e.g. `npm run verify`, that runs type checking, linting, tests and capture, and exits non-zero on any failure.

---

## STAGE 6 — WALKING SKELETON

Implement the core flow (W) as the **thinnest vertical slice through every layer**: UI → logic → data → back to UI, end to end, running locally.
- Real wiring, minimal features. Hardcode nothing that the architecture says comes from data.
- It must pass `verify` except for answer-key tests outside the slice. Mark those `pending`, never deleted.
- No polish. Ugly and correct beats pretty and fake.

---

## STAGE 7 — GATE  ▸ CHECKPOINT 3

Spawn ONE fresh-context critic (must-case: judging). Give it only ARCHITECTURE.md, BRIEF.md, the repo and the `verify` output. Not your notes, not this conversation.

It checks and reports PASS/FAIL with evidence for each:
1. The skeleton runs and completes the core flow end to end.
2. Every module stays inside its ownership boundary; no layer is skipped.
3. The interfaces match the contract exactly.
4. No secrets are in code; `.env.example` is complete.
5. `verify` runs clean except for marked-pending tests.
6. Capture is deterministic (two runs give the same output).
7. Nothing was built that is outside the MUST list.

Fix every FAIL yourself, then re-gate with a NEW critic. Maximum 3 gate rounds; then STOP and report what is blocking.

On PASS, show the user the skeleton (captures and the flow), the gate report and BACKLOG.md. The user approves to close the foundation.

---

## STAGE 8 — BACKLOG + HANDOFF

Write `BACKLOG.md` — one row per piece of remaining v1 work:

| ID | Piece | Module(s) | Answer-key / success-check IDs | Coupled with | Suggested loop |

Mark the coupled groups from the coupling map. Order the rows by dependency.

Write `FOUNDATION.md`:
- A one-paragraph summary of what exists.
- Links to every file above.
- **Pre-filled Lancer Loop variables**: H, A, S=`approved`, R (from refs/), J, I=`yes` (capture exists), C, D=`yes` (answer key / success checks), P (from the coupling map), T, X.
- The recommended next route: usually **Spec Gauntlet** for the backlog logic, **Anchored Gauntlet** for UI polish against `refs/`, and **Red-Team** on anything rated C=`high`.

Final message: "Foundation approved. Run `/lancer-loop` (Codex: `$lancer-loop`) — it will read FOUNDATION.md and skip the questions already answered."

---

## AGENT POLICY — spawn only when you must

Default: do the work yourself, inline (grilling, writing docs, spikes, scaffolding, the skeleton).

Spawn ONLY for:
- **Judging**: the Stage 7 gate critic and the Stage 3 judges. You built the work, so you cannot judge it blind.
- **Tournament candidates** in Stage 3. One context drawing all of them pulls them toward each other.
- **Context protection**: a spike or scaffold step big enough to crowd out the run's state.

Every spawned agent is NEW with a clean context, never a fork of you. Log each spawn and its reason in `foundation-status.md`.

---

## STATE, STOP, BOUNDARIES

**State** — keep `foundation-status.md` updated after every stage: current stage, what is approved, open questions, spikes run, spawns, and the next action. On resume, read it first.

**Stop and ask** when:
- a checkpoint is reached;
- a spike fails;
- the brief and the architecture conflict;
- the same failure repeats 3 times;
- anything in X would be needed.

**Boundaries** — work locally. Never, without explicit approval: deploy, sign up for or call paid services, put secrets in files, delete existing files, or change an approved document (BRIEF, ANSWER_KEY, DIRECTION, ARCHITECTURE).

**Evidence** — "done" requires command output, captures or test results. Self-reported progress does not count.

---

## Skipping stages

If the user already has a piece (an approved design, a written spec, an existing repo), confirm it, record it in the right file and skip that stage. Never skip Stage 4 (the architecture contract) or Stage 7 (the gate) — they are what make the loops safe.
