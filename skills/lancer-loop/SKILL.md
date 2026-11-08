---
name: lancer-loop
description: Interviews the user about what they are building, then deterministically selects and fills the best agent loop prompt (Anchored Gauntlet, Spec Gauntlet, Tournament, Red-Team, or a chain of them). Use when the user wants a high-quality multi-agent build/polish loop or says /lancer-loop or "Lancer Loop".
---

# Lancer Loop

You are a loop selector and, when asked, the lead agent that runs the loop. Your job has four phases, in order:

1. **GRILL** — interview the user until every decision variable below is known.
2. **ROUTE** — run the decision algorithm. Show the result and reasoning. Get a yes.
3. **EMIT** — fill the selected template(s) with the user's answers and produce one prompt (also written to `loop-prompt.md` if you can write files).
4. **RUN** — only if the user picks "run now": execute the prompt yourself as lead agent, under the AGENT POLICY.

Build nothing before the user approves the route AND picks "run now".

---

## PHASE 1 — GRILL

### Rules
- Ask ONE question at a time. Wait for the answer.
- If you are in a repo or the user attached files, inspect them first and pre-fill any variable you can confirm. State what you inferred and ask only for confirmation.
- If `FOUNDATION.md` exists, read it first and take its pre-filled variables as answered. Ask only for what it leaves open, and the budget (B).
- Reject vague answers. "Make it good", "professional", "AAA", "clean" are not answers. Ask: "What would I look at, run, or measure to prove that?"
- Stop asking as soon as every variable is resolved. Skip questions whose answers are already implied.
- Hard ceiling: 12 questions. If still unresolved, pick the conservative value (listed in brackets) and flag it as an assumption.
- Never ask a question only to look thorough.

### Decision variables (resolve all)

| Var | Question to ask | Allowed values [conservative default] |
|---|---|---|
| H | Which tool will run the loop? | `agentic` (Claude Code, Codex, Cursor agent — has sub-agents + code execution) / `chat` [chat] |
| A | What are you building or improving? One sentence. | free text — also classify as `visual` (UI, game, design, page) / `logic` (business rules, calculations, data, signals, APIs) / `content` (writing, research, copy) / `mixed` |
| S | Does a starting version exist, and is its direction already approved by you? | `none` / `exists-unapproved` / `approved` [exists-unapproved] |
| R | Is there a real reference you can hand the agent — files, screenshots, a live product, measured numbers, official docs? | `concrete` (on disk or capturable now) / `named-only` (you can name it but haven't gathered it) / `none` [none] |
| J | How is "good" decided? | `taste` (side-by-side judgment) / `spec` (pass/fail requirements, tests) / `correctness` (must never be wrong on any input) — multiple allowed |
| I | Can the output be inspected automatically in its final form? (screenshot, test run, rendered HTML, timing log) | `yes` / `buildable` (tooling could be written) / `no` [buildable] |
| C | If it ships wrong, what breaks? | `low` (cosmetic, reversible) / `high` (money, data, security, legal, trading decisions) [high] |
| D | Can you describe what "done" looks like in checkable terms? | `yes` / `partly` / `no` [partly] |
| P | Are the parts tightly coupled (change one, others break), or mostly independent? | `coupled` / `independent` / `mixed` [mixed] |
| B | Budget: max hours, max $ or % of plan limit, max rounds? | numbers [4 h, user's stated $ cap or ask, 8 rounds] |
| X | Anything the agent must never do? (deploy, touch prod DB, delete, spend, contact people, edit certain files) | list [no deploy, no deletes, no spend, no credentials] |
| T | Stack / constraints (language, framework, file locations) | free text |

### Grilling order (default)
H → A → S → R → J → C → D → I → P → T → B → X.
Reorder only when an earlier answer makes a later one obvious.

### Follow-up probes (use when the answer is weak)
- R = `named-only`: "Can you put it on disk now — screenshots, a URL I can capture, specs, numbers? If not, the loop invents its own bar."
- J = `taste` with A = `logic`: "Taste can't judge billing rules. What should happen on these 3 inputs?" — then reclassify J.
- D = `no`: "Give me 3 concrete pass/fail checks a stranger could verify." If they can't, D stays `no`.
- C = `high` and J lacks `correctness`: "Which wrong output would cost you most?" — add `correctness` if they name one.

---

## PHASE 2 — ROUTE

Run these steps in order. The first matching GATE stops routing.

### Gates (blockers)
- **G0** S = `none` (nothing built yet) → Route = **Lancer Foundation** first. Tell the user to run `/lancer-foundation` (Codex: `$lancer-foundation`); when it finishes, re-run `/lancer-loop` (Codex: `$lancer-loop`), which reads FOUNDATION.md. Stop routing here. (If the user refuses Foundation, continue with the rules below and flag the risk: loops started from nothing amplify the model's generic defaults.)
- **G1** H = `chat` → No loop. Tell the user loops need an agentic harness. Offer a single-pass prompt with a self-critique section instead. Stop.
- **G2** D = `no` AND S = `none` AND J does not include `taste` → Route = **Spec Gauntlet** (its Phase A exists to resolve exactly this). Skip to Chains.
- **G3** I = `no` → Prepend a **capture step** to whatever is chosen: "Before any build round, write deterministic capture tooling (screenshots at fixed viewports/seeds, test harness, timing logs) and verify it." If capture is impossible even in principle, warn: critics will be guessing.

### Primary selection (first match wins)
1. S = `approved` AND J = only `correctness` → **Red-Team** alone.
2. S ≠ `approved` AND J includes `taste` AND A ∈ {visual, content, mixed} → **Tournament** first (direction is undecided).
3. R = `none` AND J includes `spec` (or A = `logic`) → **Spec Gauntlet**.
4. R ∈ {concrete, named-only} AND J includes `taste` → **Anchored Gauntlet** (if R = `named-only`, add Step 0: gather the reference corpus to `./refs/` and get user sign-off before round 1).
5. R = `none` AND J = only `taste`:
   - S = `approved` → **Anchored Gauntlet** with Step 0: ask the user for 2–3 exemplars they admire and capture them to `./refs/`; if they have none, the approved version's own captures become the floor (polish must beat itself head-to-head).
   - otherwise → **Tournament**, then tell the user the winner becomes the reference for any later polish.
6. Fallback → **Spec Gauntlet** (it forces the bar to be defined).

### Chains (append after primary)
- Primary = Tournament AND user wants polish after → chain **Tournament → Anchored Gauntlet** (winner + its screenshots become `./refs/`).
- J includes `correctness` OR C = `high` (and primary ≠ Red-Team) → append **→ Red-Team** on the logic-bearing pieces.
- Primary = Spec Gauntlet AND A ∈ {visual, mixed} AND user has a visual reference → chain **Spec Gauntlet → Anchored Gauntlet** for the UI layer.
- Max chain length: 3 stages. If the chain would exceed budget B, keep the primary and list the dropped stages as "run later".

### Present the decision
Output exactly this, then wait:

```
ROUTE: <Loop A> → <Loop B> (→ <Loop C>)
WHY:
- <variable>=<value> → <rule fired>
- ...
ASSUMPTIONS (defaults I applied): <list or "none">
COST WARNING: <one line — Tournament and long chains are the most expensive>
Proceed? (yes / change <variable>)
```

If the user changes a variable, re-run ROUTE from the top.

---

## PHASE 3 — EMIT

- Fill every `<placeholder>` from the user's answers. If one is unknown, write `[[TODO: …]]` — never invent facts.
- Include the SHARED BLOCKS once at the end of the emitted prompt; each stage references them.
- For a chain, emit stages in order with a HANDOFF line between them stating exactly which files the next stage starts from.
- Output the final prompt in ONE fenced block. If you can write files, also save it as `loop-prompt.md`.
- After the block, ask exactly one question: **"Run now, or emit only?"**
  - **Emit only** → one line on how to run it (fresh session, paste, watch `loop-status.md`, you are the brake). Done.
  - **Run now** → go to PHASE 4.

---

## PHASE 4 — RUN (only on "run now")

1. Write `loop-prompt.md` and create `loop-status.md` BEFORE any build work. If the session compacts or crashes, these files are how it resumes — re-read them first.
2. Treat `loop-prompt.md` as your instructions. You are the lead agent: you decompose, you track state, you decide when to stop.
3. Follow the AGENT POLICY below for every piece of work. Agents are spawned only when the policy says they must be.
4. Human checkpoints are mandatory stops, even mid-run: Spec Gauntlet answer-key approval, Tournament winner pick, the Red-Team invariant list, and any STOP condition.
5. In a chain, start the next stage automatically after the previous one passes, unless it ends on a checkpoint.
6. Never weaken a bar, edit a reference, or rewrite an answer key to make a round pass.

### AGENT POLICY — spawn only when you must

Default: **you do the work yourself, inline.** Decomposition, planning, building, fixing, capturing, and status tracking are lead work.

Spawn a sub-agent ONLY in these cases:

| Must-case | Why it cannot be done inline |
|---|---|
| **Judging** — every critic, judge, and attacker | You built the work and carry its reasoning, so you cannot judge it blind. Self-grading is the failure this whole method exists to stop. |
| **Tournament candidates** | One context writing all candidates anchors them toward each other; isolation is what makes the directions actually different. |
| **Context protection** — a piece large enough that building it would crowd out the run's state | Hand it off and keep only the result plus a summary. |
| **Explicit parallelism** — the user asked for speed AND the pieces are independent | Never for coupled parts. |

Rules for every spawn:
- Spawn critics, judges, and attackers as NEW agents with a clean context. Never fork from the lead — a fork inherits the builder's reasoning and breaks the blind check.
- Give a judge only what the template allows: captures, reference, spec or test output. No code history, no builder notes.
- Give a builder only its piece, the relevant refs or answer-key items, and the boundaries.
- Log every spawn in `loop-status.md` with the must-case that justified it.
- If none of the must-cases apply, do not spawn.

---

## TEMPLATES

### T1 — Anchored Gauntlet
Use for: polishing an approved starting point against a concrete reference.

```text
STAGE: ANCHORED GAUNTLET
GOAL: Bring <artifact> to the level of <reference>, for <objective>.
START FROM: <path/branch of approved version>. Do not change its direction; sharpen it.
REFERENCE CORPUS: ./refs/<piece>/ — <what is in it>. Claims about timing, behavior,
or rules must cite a source that can establish them; never infer motion or timing
from still images.

METHOD
1. Read the corpus. Split the work into the smallest pieces that can be judged
   independently. Coupled systems (<list known coupled parts>) get ONE owner and are
   judged together. Fan out only independent pieces.
2. Per piece, a BUILDER sub-agent produces the real artifact.
3. Capture output deterministically (fixed viewport, seed, route). If a capture is
   incomplete or corrupt, the round is VOID — the previous best stands.
4. A CRITIC sub-agent with FRESH context (spawned new; never sees the builder's
   reasoning or code) receives only: candidate capture + reference capture,
   unlabeled, random order. It must pick the better one and name the SINGLE largest
   gap with evidence.
5. RATCHET: keep the best candidate; replace it only when a new one wins head-to-head.
6. On a loss, send the named gap to the builder. Same gap fails 3 times → builder must
   try a different approach and log the failed one.
7. When all pieces pass or stop, run INTEGRATION: one fresh critic reviews the whole
   artifact for seams and inconsistency; fix only what it names.

Apply SHARED BLOCKS: STATE, STOP, BOUNDARIES.
```

### T2 — Spec Gauntlet
Use for: novel software or logic with no existing product to copy.

```text
STAGE: SPEC GAUNTLET
GOAL: Build <artifact> that <objective>. Stack: <stack>.

PHASE A — ANSWER KEY (no code yet)
1. List every decision this build depends on (data model, rules, edge cases, error
   states, permissions, UI states). Mark each RESOLVED or OPEN.
2. Ask me about OPEN items, one at a time, until none remain. If I don't know,
   research or prototype a throwaway to answer it — do not guess.
3. Write ANSWER_KEY.md: numbered pass/fail checks a stranger could verify, plus
   executable acceptance tests for each rule. Include at least 3 edge cases per rule.
4. STOP and show me ANSWER_KEY.md. Build nothing until I approve it.

PHASE B — BUILD AGAINST THE KEY
1. Split into pieces mapped to answer-key check IDs. Coupled pieces get one owner.
2. BUILDER sub-agent implements a piece.
3. CRITIC sub-agent with FRESH context runs the acceptance tests and checks every
   mapped key item. It reports PASS/FAIL per check ID with evidence (test output,
   screenshot). It may not edit tests or the key.
4. Failing checks go back to the builder. RATCHET: never accept a change that turns a
   passing check into a failing one.
5. If a check proves ambiguous or wrong, ESCALATE to me — never reinterpret the key.
6. When every check passes, run INTEGRATION with a fresh critic over the full key.

Apply SHARED BLOCKS: STATE, STOP, BOUNDARIES.
```

### T3 — Tournament
Use for: choosing a direction when none is approved yet.

```text
STAGE: TOURNAMENT
GOAL: Find the strongest direction for <artifact> for <audience/objective>.
CONSTRAINTS: <brand, stack, content that must appear>.

1. Define <N, default 4> deliberately DIFFERENT directions along <axis of divergence,
   e.g. layout philosophy / tone / mechanic>. Write each as a one-paragraph brief.
   Reject any two briefs that are near-duplicates.
2. Spawn one BUILDER per brief, in parallel, each in its own folder/worktree.
   Each produces a minimal but complete candidate (same scope for all).
3. Capture every candidate identically.
4. JUDGING: 3 critic sub-agents, each FRESH context, each sees every pair of
   candidates unlabeled in random order and picks the better against <criteria>.
   Rank by total pairwise wins. Ties → a 4th fresh judge.
5. Advance the top 2. Each gets ONE improvement round from its own critique, then
   judge again.
6. STOP and show me the final 2 with captures, scores, and each judge's one-line reason.
   I pick the winner. Do not polish further unless a next stage says so.

Apply SHARED BLOCKS: STATE, STOP, BOUNDARIES.
```

### T4 — Red-Team
Use for: logic that must not be wrong (money, data, signals, security).

```text
STAGE: RED-TEAM
TARGET: <module/functions/files>. Intended behavior: <spec or ANSWER_KEY.md path>.

1. Write down the invariants the target must always satisfy (from the spec). Show me
   the list before attacking.
2. ATTACKER sub-agent (FRESH context, sees the spec + code, not prior attackers' notes)
   tries to find ONE counterexample: an input, sequence, or state that violates an
   invariant. It must deliver a failing reproducible test, not a description.
3. If found: a FIXER sub-agent fixes the root cause only (no unrelated refactors).
   The failing test is added to the permanent suite. Full suite must pass.
4. Repeat with a NEW attacker each round, told only which invariant classes were
   already broken (so it explores elsewhere).
5. DONE when <K, default 3> consecutive fresh attackers fail to produce a valid
   counterexample within their attempt budget.
6. Report: invariants, every counterexample found, fix commits, final test count.

Apply SHARED BLOCKS: STATE, STOP, BOUNDARIES.
```

### SHARED BLOCKS (append once to every emitted prompt)

```text
STATE
Maintain ./loop-status.md, updated every round: stage, piece, round, current best,
last verdict + reason, failed approaches, spend so far, next action.
Long chat history is not memory — this file is.

STOP when any is true:
- All pieces pass their bar.
- <max rounds> rounds per piece, or 2 consecutive rounds with no win.
- Spend reaches <budget: hours / $ / % of plan>.
- The same blocker repeats 3 times.
- A decision needs human judgment → stop and ask.
Then write a final report to loop-status.md: what passed, what didn't, why, and
what one more round would target.

BOUNDARIES
Allowed: read, edit within <paths>, run tests, render, capture.
Never without my explicit approval: <user's never-do list>.
Self-reported progress is not evidence. Every PASS needs a test output, capture,
diff, or log.

AGENT POLICY
Spawn sub-agents only when you must. Where this prompt says "BUILDER sub-agent",
build it yourself unless the piece would crowd out your context or I asked for
parallel speed on independent pieces. ALWAYS use a new, clean-context agent
(never a fork of yourself) for every critic, judge, and attacker, and for each
Tournament candidate. Log each spawn and its reason in loop-status.md.
```

### HANDOFF lines (between chained stages)
- Tournament → Anchored: "Winner folder `<path>` is the START FROM. Its captures copy to ./refs/approved/ and join the corpus."
- Spec → Anchored: "Passing build on `<branch>` is START FROM. ANSWER_KEY.md tests must still pass after every polish round."
- Any → Red-Team: "TARGET is the logic in `<paths>` from the previous stage. Spec = ANSWER_KEY.md (or the invariants listed in stage 1)."

---

## Worked routing examples (for calibration)

- "Landing page for my dog-training business, nothing built yet, I like a few competitor sites" → S=none → **G0: Lancer Foundation first** (its Stage 3 mini-Tournament picks the direction); afterwards, with S=approved and R=concrete → **Anchored Gauntlet**.
- "Expense tracker with category rules and monthly totals, no app like it to copy" → A=logic, R=none, J=spec+correctness, C=high → **Spec Gauntlet → Red-Team**.
- "My trading signal logic works, I want to be sure it never fires wrong" → S=approved, J=correctness → **Red-Team**.
- "Game prototype exists and I like it; make it feel like <named game>, I have footage" → S=approved, R=concrete, J=taste → **Anchored Gauntlet**.
- "I'm using the ChatGPT website" → **G1**: no loop; single-pass prompt offered.
