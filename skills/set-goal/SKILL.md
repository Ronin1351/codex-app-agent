---
name: set-goal
description: Turns a rambling project idea into a 7-part goal brief (what and why, quality bar, tools, creative freedom, checks, delivery, autonomy) with milestones, a resumable progress log and a pre-flight check, so an agent can run it unattended. Use before a long autonomous agent run, when the user wants to set or sharpen a goal, or says /set-goal or "Set Goal".
---

# Set Goal

You turn a ramble into a **goal brief**: a contract an agent can run unattended, that survives a dead session, and that ends in output anyone can check. You write the brief and run the pre-flight. You do not do the work it describes.

**Output:** `GOAL.md` and `goal-status.md` in the project root (in the reply if you cannot write files): the 7 parts, milestones, assumptions, limits, and one paste-ready goal prompt.

## Step 1 — Capture

If the request already holds the ramble, use it. Otherwise ask for one: "Tell me about the project, what exists, what you want and why. Messy is fine." Let the user talk; voice-to-text is welcome. Then read whatever exists: `AGENTS.md`, `CLAUDE.md`, `SPEC.md`, `FOUNDATION.md`, `BRIEF.md`, `README.md`, `package.json`.

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
| 6 | Delivery | **Milestones** in dependency order, each small enough for one session and each with its own checks; exact paths, branch and file formats; the final report shape | One undivided deliverable, or "somewhere" |
| 7 | Autonomy | **Green** (do without asking), **Pre-approved** (normally Red, cleared for this run only), **Red** (always stop), **limits** (max hours, max spend), and the park rule | Missing Red list or limits |

Red always includes, and can never be pre-approved: push or merge to the base branch; deploy; writes to hosted or production data; sending messages, posts or email; changing secrets, keys, billing or settings; spending above the limit. Items the project's rules normally gate (commits to the work branch, installing named packages, deleting files the goal replaces) may be pre-approved by the user, one by one.

**Park rule (default):** a step blocked after 2 attempts is parked: log the blocker in `goal-status.md` and move on to the next milestone that does not depend on it. Stop the run only when every remaining milestone depends on a parked step, a Red action is next, or a limit is reached.

**Done when:** all 7 parts are marked.

## Step 3 — Close gaps

Ask about gaps only: at most 3 questions per round, highest impact first, each with a recommended default. Turn every adjective into a check by proposing one: "professional" → "no console errors; Lighthouse ≥ 90; matches `refs/hero.png` at 1440 px and 390 px". Propose the milestone split yourself; the user only edits it.

**Done when:** no gaps remain, or the user says "use defaults" (record each default under Assumptions).

## Step 4 — Write GOAL.md and goal-status.md

Use the templates below. Rules:

- **Red beats autonomy.** Autonomy means no questions mid-run: the executor lists them under Open items. Red actions still stop the run.
- **The checks are locked.** The executor may not edit, skip, loosen or delete a quality-bar check or the tests and thresholds behind it. A check it believes is wrong is logged as an open item and left failing.
- Every quality-bar line can fail. Every milestone names which checks it must pass.
- Point to existing project files for facts they already hold; copy nothing from them.

**Done when:** both files exist, all 7 parts are filled, and every milestone has checks.

## Step 5 — Red-team and route

Reread the brief as an executor arriving cold, and fix:

- a check that cannot fail;
- a milestone too big for one session (split it);
- a line that contradicts `AGENTS.md` / `CLAUDE.md`: the project file wins, so either move the item to Pre-approved with the user's yes, or cut it from scope;
- a delivery that needs a Red action ("deploy it" → deliver to a preview; the deploy waits for a yes).

Then name the next step:

| Situation | Next |
|---|---|
| Nothing built yet | `lancer-foundation`, with `GOAL.md` as its input |
| Long build or polish against a bar | `lancer-loop` |
| Handing to another agent that needs a strict contract | `execution-checklist` compile `GOAL.md` |
| Anything else | Paste the goal prompt into a fresh session |

Whichever route, run Step 6 before anything runs unattended.

**Done when:** the user approves the brief.

## Step 6 — Pre-flight (before the user walks away)

Run this with the user present. Each item ends **ready** (with evidence) or **fixed now**:

1. **Permissions.** Every Green and Pre-approved action can run without a prompt. Claude Code: add allow rules for exactly those commands to `.claude/settings.local.json`, or start the run with `--permission-mode acceptEdits` when only edits need clearing. Codex: pick an approval mode and sandbox that cover them (for example workspace-write, with approval only on request). Never use a skip-all-permissions mode outside a disposable sandbox.
2. **Dependencies.** Install now, with the user's yes, everything the milestones need, so the run never needs an install mid-way.
3. **Rule clashes.** Zero remaining between `GOAL.md` and the project's rule files (Step 5).
4. **Dry run.** Run every milestone-1 check once now. Each must execute and fail or pass for a real reason, not because of a missing tool, path or credential.
5. **Machine.** Remind the user to keep the computer awake and online, and that usage limits can still end the session.

**Done when:** all 5 items are ready. Then hand over the goal prompt.

## GOAL.md template

```markdown
# Goal: <name>
Created: YYYY-MM-DD

## 1. What and why
<outcome> for <who>. Success metric: <number / date / observable change>.

## 2. Quality bar (all must pass; LOCKED: the executor may not edit, skip or loosen these)
- [ ] Q1 <check>

## 3. Tools
Available: ...
May add without asking: ...

## 4. Creative freedom
Decide yourself: ...
Fixed: ...

## 5. How each check is verified
| Check | Verified by | Evidence to include |
|---|---|---|
Final review: a fresh-context reviewer (subagent, or app-agent-verifier in Claude Code) reruns every check. Without a subagent tool, write `review-prompt.md` and report the run as NOT VERIFIED.

## 6. Delivery
Branch: ...
| # | Milestone | Depends on | Must pass |
|---|---|---|---|
| M1 | ... | — | Q1, Q2 |
Final report: changed files, each check with evidence, parked items, open items, next step.

## 7. Autonomy
Green: ...
Pre-approved for this run: ...
Red (stop and ask, even mid-run): push/merge to base, deploy, hosted/production data writes, messages, secrets/settings/billing, spending above the limit.
Limits: max <n> hours, max <amount> spend. On reaching one: update goal-status.md and stop.
Park rule: blocked after 2 attempts → log in goal-status.md, continue with the next independent milestone.

## Assumptions
- ...

## Goal prompt
Read GOAL.md in full. If goal-status.md shows progress, resume at the first milestone not marked done.
Work autonomously inside section 7: ask nothing mid-run, collect questions under "Open items",
and stop only for a Red action, a limit, or when every remaining milestone depends on a parked step.
Record the start time from the system clock in goal-status.md. Work one milestone at a time; after each, run its checks,
update goal-status.md, and check elapsed time against the limit before starting the next.
Never edit, skip or loosen a section 2 check. Before reporting done, get the section 5 final review,
then deliver per section 6.
```

## goal-status.md template

```markdown
# Goal status: <name>
Started: <YYYY-MM-DD HH:MM> | Limits: <hours> h, <spend>

| Milestone | Status (todo / doing / done / parked) | Checks passed | Evidence | Updated |
|---|---|---|---|---|
| M1 | todo | | | |

## Parked
- <step> — <blocker> — <what would unblock it>

## Open items
- <question for the user>

## Resume note
<one line: where the next session should start>
```
