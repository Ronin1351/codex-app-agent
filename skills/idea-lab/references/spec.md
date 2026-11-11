> Execution note: where a step says "paste", "save as", or "fresh session", follow the execution rules in SKILL.md instead.

# PART B — SPEC MAKER

## S0 — 🔎 Seed evidence intake (Mode B only)

Run the G4 prompt on the single `{{SEED}}`. Kill criteria are optional here; if you have none, skip the KILL CHECKS line.

Save as `S0-evidence.md`. If EVIDENCE CONFIDENCE is LOW, you may continue, but S8 must title the output **"Exploratory Prototype Brief"** instead of a build spec, and validation (S5) becomes mandatory before any build beyond a prototype.

## S1 — Goal & Constraints

```
ROLE: Product strategist.
INPUTS: ledger, S0-evidence.md (or G4 entry for the seed)

TASK:
1. Restate the goal in one sentence, including the primary user.
2. Define 3 constraints (C1–C3), each pass/fail testable, including at least one technical and one human/business constraint. Carry forward any relevant K1–K3.
3. Define 3 success criteria (S1–S3), each measurable. S1 must be provable by the MVP.

OUTPUT SCHEMA:
GOAL: <one sentence>
PRIMARY USER: <who>
C<n>: <constraint> | TEST: <pass/fail rule>
S<n>: <criterion> | MEASURE: <metric/threshold>
```

**Checkpoint:** You approve C1–C3 and S1–S3. The ledger marks them `LOCKED v1`. Any later change increments the version and is logged with a reason.

## S2 — Concept variations

```
ROLE: Solution designer.
INPUTS: ledger, S0-evidence.md (or G4 entry)

TASK:
Produce 3 variations (V1–V3) of the seed that differ in mechanism, not styling. Each must pass C1–C3 and target the evidence gap.

OUTPUT SCHEMA (per variation):
### V<n>: <title>
CORE CONCEPT: <how it works, ≤3 sentences>
USER INTERACTION: <step by step>
KEY TECHNOLOGY: <named hardware/software/services>
CONSTRAINT CHECK: C<n> PASS/FAIL/UNKNOWN — one line each
SERVES: <S-IDs and how>
```

Save as `S2-variations.md`. Send to S4.

## S3 — Cross-breed

```
ROLE: Recombinant ideation system.
INPUTS: ledger, S2-variations.md, latest S4 jury file

PARENTS: the two highest-ranked non-disqualified variations from S4, referred to by their IDs (e.g., V2, V3).

TASK:
Create hybrid H1 that keeps each parent's highest-scoring traits and targets at least one parent's key weakness. It must pass C1–C3.

OUTPUT SCHEMA:
### H1: <title>
FROM <V-ID>: <traits and why> | FROM <V-ID>: <traits and why>
DROPPED: <what was discarded and why>
CORE CONCEPT / USER INTERACTION / KEY TECHNOLOGY: <as in S2>
WEAKNESS TARGETED: <which, and how>
IMPROVEMENT HYPOTHESIS: <what H1 should score better on than each parent, and why — this is a claim for the jury to test, not a conclusion>
CONSTRAINT CHECK: C<n> PASS/FAIL/UNKNOWN
```

Save as `S3-hybrid.md`. Send H1 to a fresh S4 with the same evidence the parents were scored on.
**Champion rule:** the highest S4 total among the two parent V-IDs and H1. If H1 doesn't beat both, it is recorded but not promoted.

## S4 — Concept Jury (fresh session)

```
ROLE: Independent product reviewer. You did not create these concepts. Default to lower scores when uncertain.
INPUTS: goal, C1–C3, S1–S3 (from ledger); S0/G4 evidence file; concept blocks only — no generation history.

PROCEDURE:
1. GATE: C1–C3. FAIL = DISQUALIFIED. UNKNOWN = scored, but listed as a risk.
2. SCORE 1–5 per criterion. Cite concrete reasons. Originality must reference the evidence file's prior art.
3. RANK.

Originality: 1 exists as described | 2 minor variation | 3 known elements, uncommon combination | 4 novel mechanism, few precedents | 5 no close precedent in documented search scope
Feasibility (state cost, dependencies, time-to-prototype): 1 unproven tech | 2 major R&D | 3 off-the-shelf but high integration/cost/operating risk | 4 buildable and operable within budget/timeline | 5 prototype in weeks
Impact: 1 no clear value | 2 narrow nice-to-have | 3 meets one S-criterion | 4 meets two for the primary user | 5 meets all three, clearly better than the status quo

MEDALS (3–15): 3–7 None | 8–9 Bronze | 10–12 Silver | 13–15 Gold
CAPS: any criterion ≤2 → max Bronze. Gold requires every criterion ≥4. Evidence confidence LOW → max Silver.

OUTPUT SCHEMA (per concept):
### <ID>: <title>
GATE: PASS | DISQUALIFIED (<C-ID + reason>) | UNKNOWNS: <C-IDs>
Originality X/5 — <reason + prior art> | Feasibility X/5 — <cost, dependencies, time> | Impact X/5 — <reason + S-IDs>
Total: X/15 — Medal: <medal> <(capped: reason)>
Key weakness: <one line>
Highest-value fix: <one concrete change>
(H1 only) HYPOTHESIS RESULT: <confirmed / not confirmed, per criterion>
FINAL RANKING: <ID> > <ID> > <ID>
```

**Loop rule:** if nothing scores ≥8, return to S2 with the key weaknesses as added constraints (maximum 2 reruns). Tie-break rule as in G5.

## S5 — Validation (you run this in the real world)

Validation tests the champion's riskiest **assumptions**, not S1. S1 is proven by the MVP later; validation decides whether the MVP is worth building.

```
ROLE: Validation planner.
INPUTS: ledger, champion block, latest S4 jury file, evidence file

TASK:
1. List the champion's 3 riskiest assumptions as hypotheses H-V1 to H-V3. Classify each:
   DEMAND (people want it), WILLINGNESS TO PAY, USABILITY (people can use it), or FEASIBILITY (it can be built/operated).
2. For each, design the cheapest test that could prove it false. Match method to type:
   - DEMAND / PAY: behavioral evidence only — pre-orders, deposits, sign-ups with a real commitment, concierge sales. Interviews alone do not prove demand.
   - USABILITY: task-based test with a clickable mockup or manual version.
   - FEASIBILITY: technical spike or vendor quote.
3. Interviews may be used for discovery; their output is labeled QUALITATIVE and can't produce a PASS on DEMAND or PAY.

OUTPUT SCHEMA (per hypothesis):
### H-V<n>: <assumption> | TYPE: <type> | MAPS TO: <S-ID or C-ID>
METHOD: <what you do>
RECRUIT: <who qualifies, how you reach them, who is excluded>
SAMPLE: <size> — <why this size is enough to decide>
CONSENT: <one-line notice to participants about what's collected and why>
PASS IF: <numeric threshold> | FAIL IF: <threshold>
FAIL MEANS: <revise concept / next seed / stop>
COST/TIME: <estimate>
RECORD: RESULT: PASS/FAIL/INCONCLUSIVE | DATA: <file or link to raw results>
```

**Checkpoint (you):** run the tests and record results in the ledger.
- All DEMAND/PAY hypotheses PASS → continue to S6.
- Any FAIL → back to S2 with the findings, or move to the next seed.
- INCONCLUSIVE or not run → you may continue only with `RISK ACCEPTED: <H-V IDs> — <reason>` in the ledger. S8 lists every accepted risk at the top of Risks.

## S6 — Risk gate: safety, legal, privacy, security (mandatory)

```
ROLE: Risk reviewer.
INPUTS: ledger, champion block, S5 results

TASK:
For each area, mark APPLIES / N/A (with a one-line reason). For every APPLIES, give the risk, likelihood (L/M/H), a concrete mitigation (design or technical change, not "be careful"), and residual risk after mitigation.

AREAS:
1. Personal data — what is collected, where stored, retention, who can access
2. Consent — how users agree; anything recorded about people who didn't sign up
3. Minors or sensitive data — health, financial, location, biometrics, children
4. Jurisdiction — laws in {{GEOGRAPHY}} and where users/servers are (e.g., PH Data Privacy Act, consumer, licensing, permits)
5. IP and licensing — third-party data, content, trademarks, scraped sources, API terms
6. Physical safety — hardware, food, animals, public spaces, operations
7. Security and abuse — account takeover, spam, misuse of the product against others
8. Accessibility — can the primary user actually use it (language, literacy, device, connectivity, disability)

OUTPUT SCHEMA:
R<n>: <area> | APPLIES/N/A — <reason> | RISK: <...> | L/M/H | MITIGATION: <...> | RESIDUAL: L/M/H
DECISION: PROCEED / PROCEED WITH CONDITIONS (<list>) / STOP
NEEDS PROFESSIONAL REVIEW: <items requiring a lawyer, accountant, or licensed specialist, or none>
```

Any residual HIGH = STOP unless you record `RISK ACCEPTED` with a reason. This gate is a checklist, not legal advice; anything flagged for professional review goes into SPEC.md Open Questions.

## S7 — Domain transfer (optional)

```
ROLE: Innovation strategist.
INPUTS: ledger, champion block, S6 output
NEW DOMAIN GOAL: {{TRANSFER_GOAL}}

TASK:
1. Define T1–T3 constraints and TS1–TS3 success criteria for the new domain.
2. Adapt the champion: mechanism, interaction, and expected outcomes.
3. Re-run the S6 areas for the new domain; list only what changed.

OUTPUT SCHEMA:
T<n> / TS<n>: <as in S1>
### X1: <title>
WHAT CHANGED: <vs. the champion>
CORE CONCEPT / USER INTERACTION / KEY TECHNOLOGY
RISK DELTA: R<n> <as in S6>
CONSTRAINT CHECK: T<n> PASS/FAIL/UNKNOWN
```

Score X1 in a fresh S4 using T1–T3 and TS1–TS3. X1 is a separate champion and needs its own S5 before its own S8.

## S8 — Build brief (SPEC.md + CLAUDE.md)

```
ROLE: Technical product lead preparing a handoff to a coding agent.
INPUTS: ledger, champion block, latest S4 jury file, evidence file, S5 results, S6 output
STACK: {{STACK}} | REPO: {{REPO}} | OWNER: {{OWNER}} | BUDGET/TIMELINE: {{BUDGET_TIMELINE}}

TASK:
Produce two files. SPEC.md = WHAT to build. CLAUDE.md = HOW to work in this repo. No duplicated content; CLAUDE.md points to SPEC.md.
- Title SPEC.md "Exploratory Prototype Brief" if evidence confidence is LOW or any DEMAND/PAY hypothesis is RISK ACCEPTED.
- Scope the MVP to the smallest build that proves S1.
- Label every technical statement: CONFIRMED (from the repo or my input), PROPOSED (your design recommendation), or TBD (open question). Never present PROPOSED as CONFIRMED.
- REPO = greenfield: commands and structure are PROPOSED defaults for the stack and must be verified after scaffolding.
- REPO = existing: read the repo first (package.json, folder tree, existing CLAUDE.md/AGENTS.md, lint/test config). Commands and conventions come only from what you find. If you cannot access the repo, output BLOCKED.

=== FILE 1: SPEC.md ===
# <Project name>
## 1. Problem & goal          — goal, primary user, evidence summary with grades
## 2. Validation              — each H-V: result, data location; accepted risks
## 3. Success criteria        — S1–S3 verbatim (LOCKED version)
## 4. Constraints             — C1–C3 verbatim
## 5. Concept summary         — ≤150 words
## 6. Competitive position    — prior art and how this differs
## 7. MVP scope
   ### In scope               — each item tied to an S-ID
   ### Out of scope           — explicit exclusions
## 8. User stories            — "As a <user>, I can <action> so that <outcome>"
## 9. Acceptance criteria     — Given/When/Then per story
## 10. Architecture           — PROPOSED unless CONFIRMED; components, data flow, external services
## 11. Data model             — PROPOSED unless CONFIRMED; entities, fields, relationships, retention (from S6)
## 12. Risk controls          — S6 mitigations that must be built in, each as a requirement
## 13. Phases & checkpoints   — Phase N: deliverable | exit criteria | est. effort
## 14. Risks                  — accepted risks first, then jury key weaknesses, then S6 residuals
## 15. Open questions         — owner = {{OWNER}}; include S6 professional-review items

=== FILE 2: CLAUDE.md === (concise; include everything an agent needs, nothing it can infer)
# <Project name>
Read SPEC.md before any task. SPEC.md is the source of truth for scope.
## Stack                — with versions if CONFIRMED
## Commands             — dev | build | test | lint | typecheck — each marked CONFIRMED or PROPOSED (verify after scaffold)
## Environment          — required env vars by name only (never values), local setup steps
## Project structure    — folder tree, one-line purpose each
## Conventions          — naming, file organization, components, state, errors
## Security rules       — from S6: data handling, secrets, auth requirements
## Working rules
- Surgical edits only; no full-file rewrites unless asked.
- Preserve existing contracts: names, schemas, API signatures, state logic.
- Modular isolation; no monolithic files.
- Fix root causes only; don't refactor working code.
- One SPEC.md phase at a time; stop at each checkpoint.
## Guardrails
[ALWAYS DO]  Run typecheck + lint + tests before declaring done; stay within the current phase.
[ASK FIRST]  Schema changes, new dependencies, breaking changes, SPEC.md Open Questions, scope additions, replacing any PROPOSED command or structure.
[NEVER DO]   Invent requirements, commit secrets, disable tests/type checks to pass, edit SPEC.md without approval.
## Definition of done
- Acceptance criteria pass; typecheck, lint, tests green; no unrelated files changed.

SELF-CHECK before delivering:
[ ] Every In Scope item maps to an S-ID
[ ] Every user story has an acceptance criterion
[ ] Every S6 mitigation marked APPLIES appears in Risk controls or Security rules
[ ] Phase 1 fits budget/timeline
[ ] No duplication between SPEC.md and CLAUDE.md
[ ] No PROPOSED item is labeled CONFIRMED; no [ASSUMED] claim is written as a requirement
[ ] Every accepted risk, jury key weakness, and professional-review item appears in Risks or Open Questions
```

Note: the Working rules and Guardrails are your standing rules for every project. If you'd rather not repeat them per repo, put them once in your user-level `~/.claude/CLAUDE.md` and delete those two sections from the project file.
