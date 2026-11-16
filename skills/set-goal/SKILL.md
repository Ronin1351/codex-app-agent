---
name: set-goal
description: Turns a rambling project idea into a 7-part goal brief (what and why, quality bar, tools, creative freedom, checks, delivery, autonomy) plus a paste-ready goal prompt, saved as GOAL.md. Use before a long autonomous agent run, when the user wants to set or sharpen a goal, or says /set-goal or "Set Goal".
---

# Set Goal

You turn a ramble into a **goal brief**: a contract an agent can run on its own without asking anything mid-run, and that ends in output anyone can check. You write the brief. You do not do the work it describes.

**Output:** `GOAL.md` in the project root (in the reply if you cannot write files): the 7 parts, assumptions, and one paste-ready goal prompt.

## Step 1 — Capture

If the request already holds the ramble, use it. Otherwise ask for one: "Tell me about the project, what exists, what you want and why. Messy is fine." Let the user talk; voice-to-text is welcome. Then read whatever exists: `AGENTS.md`, `CLAUDE.md`, `FOUNDATION.md`, `BRIEF.md`, `README.md`.

**Done when:** you hold the ramble and have read every existing project file named above.

## Step 2 — Extract

Fill each part from the ramble and mark it `filled` or `gap`.

| # | Part | Filled means | Gap when |
|---|---|---|---|
| 1 | What and why | The outcome, who it serves, and the real metric: a number, a date or an observable change | No metric |
| 2 | Quality bar | 3–7 pass/fail checks a fresh reviewer can run: commands that pass, behaviour you can observe, a reference to match | Only adjectives ("clean", "professional", "excellent") |
| 3 | Tools | Repos, connectors, accounts and CLIs available, and what the agent may add on its own | Unknown |
| 4 | Creative freedom | What the agent decides alone, and what is fixed (stack, brand, contracts, budget) | Fixed items unknown |
| 5 | Checking work | For each quality-bar check: the command, screenshot or fresh-context reviewer that proves it | Stated as a number of review passes |
| 6 | Delivery | Exact paths, branch, file formats, and the shape of the final report | "Somewhere" or unstated |
| 7 | Autonomy | **Green** (do without asking), **Red** (always stop), and the stop rule | Missing Red list |

Red always includes: push, merge or deploy; writes to hosted data; sending messages or posts; changing secrets, keys, billing or settings; deleting files; spending money. Default stop rule: blocked after 2 attempts → stop and report.

**Done when:** all 7 parts are marked.

## Step 3 — Close gaps

Ask about gaps only: at most 3 questions per round, highest impact first, each with a recommended default. Turn every adjective into a check by proposing one: "professional" → "no console errors; Lighthouse ≥ 90; matches `refs/hero.png` at 1440 px and 390 px".

**Done when:** no gaps remain, or the user says "use defaults" (record each default under Assumptions).

## Step 4 — Write GOAL.md

Use the template below. Rules:

- **Red beats autonomy.** Autonomy means no questions mid-run: the executor lists them under Open items in the final report. Red actions still stop the run.
- Every quality-bar line can fail.
- Point to existing project files for facts they already hold; copy nothing from them.

**Done when:** `GOAL.md` exists with all 7 parts filled and the goal prompt written.

## Step 5 — Red-team, route, approve

Reread the brief as an executor arriving cold, and fix:

- a check that cannot fail;
- a line that contradicts `AGENTS.md` / `CLAUDE.md` (the project file wins; name the conflict);
- a delivery that needs a Red action ("deploy it" → deliver to a preview; the deploy waits for a yes).

Then name the next step:

| Situation | Next |
|---|---|
| Nothing built yet | `lancer-foundation`, with `GOAL.md` as its input |
| Long build or polish against a bar | `lancer-loop` |
| Handing to another agent that needs a strict contract | `execution-checklist` compile `GOAL.md` |
| Anything else | Paste the goal prompt into a fresh session |

Show the brief and ask for a yes.

**Done when:** the user approves or edits the brief.

## GOAL.md template

```markdown
# Goal: <name>
Created: YYYY-MM-DD

## 1. What and why
<outcome> for <who>. Success metric: <number / date / observable change>.

## 2. Quality bar (all must pass)
- [ ] <check>

## 3. Tools
Available: ...
May add without asking: ...

## 4. Creative freedom
Decide yourself: ...
Fixed: ...

## 5. How each check is verified
| Check | Verified by | Evidence to include |
|---|---|---|

## 6. Delivery
Files/branch/URL: ...
Final report: changed files, check results with evidence, open items, next step.

## 7. Autonomy
Green: ...
Red (stop and ask, even mid-run): ...
Stop rule: blocked after 2 attempts → stop and report.

## Assumptions
- ...

## Goal prompt
Read GOAL.md in full. Work autonomously inside section 7: ask nothing mid-run, collect
questions under "Open items", and stop only for a Red action or the stop rule. Before
reporting done, run every check in section 5 and include its evidence. Deliver per section 6.
```
