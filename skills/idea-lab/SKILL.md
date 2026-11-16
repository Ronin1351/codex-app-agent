---
name: idea-lab
description: Generates evidence-backed product or business ideas, scores them with an independent jury, and turns the winner into a validated build spec (SPEC.md + CLAUDE.md). Use when the user wants new ideas in a domain, wants an idea scored, validated or risk-checked, wants an idea turned into a spec for a coding agent, or says /idea-lab or "Idea Lab".
---

# Idea Lab

A staged ideation pipeline: frame a domain → generate 20 ideas → cull → research prior art and demand → independent jury → spec the winner → validate → risk gate → build brief.

## References (read only the one the current step needs)
- `references/rules.md` — global output rules, evidence grades (E1–E4), variables. Read once at the start of every run.
- `references/generate.md` — steps G1–G5 (Idea Generator).
- `references/spec.md` — steps S0–S8 (Spec Maker).
- `references/ledger-template.md` — the State Ledger format.

## Modes
| Mode | Trigger | Steps |
|---|---|---|
| A — Generate | User has a domain, no idea | G1 → G5 |
| B — Spec | User has an idea | S0 → S8 |
| C — Full | User wants idea through build brief | G1 → G5, then S1 → S8 with the chosen seed |

Spec order: S0 → S1 → S2 → S4 (V1–V3) → S3 → S4 (H1) → S5 → S6 → [S7 optional] → S8.
If the mode is unclear, ask once.

## Start of run
1. Collect variables: DOMAIN, GEOGRAPHY, BUILDER_ASSETS, BUDGET_TIMELINE, IDEA_TYPE (Mode A/C); SEED (Mode B); STACK, REPO, OWNER (needed only at S8). Ask in one question for anything the first step needs. Defaults: STACK = React + TypeScript + Vite + Tailwind + Supabase; OWNER = the user; REPO = greenfield.
2. Create the run folder `idea-lab-runs/<YYYY-MM-DD>-<domain-slug>/` in the working directory. If one exists for this domain, ask whether to resume it.
3. Create `ledger.md` from `references/ledger-template.md` with the variables filled in.
4. If a task-list tool is available, add one task per step in the chosen mode, ending with "Check outputs against the self-check".

## Execution rules
- **Generator steps** (G1–G4, S0–S3, S5–S8): run them yourself. Follow the step's TASK and OUTPUT SCHEMA exactly, with the global rules from `rules.md`.
- **Step files:** write each step's full output to the run folder with the file name the step gives (e.g., `G2-ideas.md`). Then update `ledger.md`: IDs produced, scores, decisions, and the file name. Re-read the files listed under a step's INPUTS before running it; don't rely on memory of earlier steps.
- **Web search (🔎 steps G4, S0):** use the available web search and fetch tools. Run at least 3 differently worded searches per idea and log every query. If search is unavailable, grade everything E4, apply the caps in `rules.md`, and tell the user.
- **Jury steps (G5, S4): never score your own work in the generating context.**
  - With a subagent tool (Claude Code `Agent`, or a Codex subagent): launch a fresh subagent whose prompt contains only the jury step text, the global rules, and the exact contents of the files the step lists as INPUTS. Never include generation reasoning, other drafts, or this conversation. Write its output to `G5-jury.md` or `S4-jury-run<n>.md`.
  - Without one: write the complete jury prompt (step text + rules + input file contents) to `jury-prompt-<step>.md`, ask the user to run it in a new session, and wait for them to paste the result back.
  - Tie-break: if the top two are within 1 point, run a second independent jury and average. If runs differ by ≥3 points on any item, the user decides; log the reason.
- **Loops:** follow each step's loop rule (max 2 reruns). Increment the run counter in the ledger.

## User checkpoints (stop and ask; never decide these yourself)
| After | Ask the user to |
|---|---|
| G1 | Approve or edit P1–P5 and K1–K3 |
| G5 | Pick which seed to spec (Mode C) |
| S1 | Approve C1–C3 and S1–S3, which then become LOCKED v1 |
| S5 | Run the validation tests in the real world and report results. You design tests; you cannot run them. Offer RISK ACCEPTED if they want to proceed without results |
| S6 | Decide on any residual HIGH risk (stop, or accept with a reason) |

Show a short summary of the step output before each question so it stands on its own. Between checkpoints, keep going without narrating each step.

## Ending a run
- **Mode A:** deliver `G5-jury.md` and a short summary of the top 3 seeds with their biggest risk and validation idea.
- **Mode B/C:** write `SPEC.md` and `CLAUDE.md` to the run folder (or into REPO if the user names an existing repo and asks for that), run the S8 self-check, and fix failures before delivering.
- Report the outcome, the champion's scores, any accepted risks, and the single next action for the user.

## Never
- Invent sources, quotes, prices, or traction. Unsourced claims are [ASSUMED] or E4.
- Mark a DEMAND or PAY hypothesis PASS from interviews alone.
- Label a PROPOSED command, architecture, or data model as CONFIRMED.
- Change a LOCKED constraint or success criterion without the user's approval and a change-log entry.
- Give legal, tax, or regulatory conclusions; S6 items needing a professional go to Open Questions.
