---
name: execution-checklist
description: "Compile or audit an execution checklist for agent-run engineering tasks (Codex/Claude handoffs): atomic requirements with predicates, evidence, gates and authority. Use when writing a task checklist, handoff spec or acceptance gate, or when auditing one."
metadata:
  short-description: Compile or audit evidence-gated execution checklists
---

# Execution Checklist

A checklist is an **execution contract with evidence gates**. It states what may change, what must stay true, the order of work, what proves success, and where the executor's authority ends. A checkbox is only how it's displayed. The real unit is a **requirement**: something with a predicate that a verifier can establish as true or false.

Two modes:
- **Compile**: turn a task brief into a checklist, an evidence ledger and a decision register.
- **Audit**: judge an existing checklist and give every finding a disposition.

## Inputs

Collect these before compiling. Ask the owner only for the ones that are missing. Scope and authority can't be guessed.

| Input | What to capture |
|---|---|
| Outcome | The decision or result the task serves |
| Current state | Repo, base branch, existing uncommitted work, related branches |
| Scope | Files allowed (and which fields or sections within them), files and areas protected |
| Authority | Who approves exceptions, who merges, which actions the executor may take |
| Acceptance | Behaviour that must be demonstrated, and with which tests |
| Failure modes | Known risks, past incidents, things that went wrong before |
| Empirical claims | Any stated fact about production or data, and where its evidence lives |

## Compile mode

1. **Extract obligations.** Every "must", "only", "do not", "ensure", "record" and "verify" in the brief becomes a candidate requirement.
2. **Atomize.** Split compound obligations so that each requirement passes or fails independently. Give each a stable ID, `<SECTION>-<NNN>` (e.g. `SCOPE-004`).
3. **Classify** each requirement with one canonical type (see Reference). That type determines the evidence it needs.
4. **Write the predicate.** It must be observable and unambiguous: two competent executors would evaluate it the same way. Run every predicate through the applicable **Precision pitfalls**. The table holds examples from past audits; apply the underlying question ("could two executors read this differently?") beyond it.
5. **Assign a verifier and evidence.** Use the method plus the artifact to keep. Bind the evidence to a revision (tested revision = local commit = remote head = PR head). Temporal requirements and invariants need **event history**. Final state alone can't prove them.
6. **Build dependencies.** Default preparation order: record original checkout SHA and status → preserve existing changes → create the task branch → fetch and record the base SHA → rebase. Then run the correction cycle per correction unit, then final verification, then delivery, then the gate.
7. **Define the failure action** for every requirement: `block_completion`, `stop_and_escalate`, `retry_once_then_escalate`, or `record_nonblocking`. Cover recovery for push rejection, rebase conflict, flaky tests and missing preconditions.
8. **Assign authority.** For each requirement, name who can approve an exception. Any action outside the executor's authority becomes a decision-register row.
9. **Write the gate.** Completion holds only when every applicable mandatory requirement is PASS. A listed blocker means not complete. Ready-for-review is separate from authorized-to-merge.
10. **Check coverage.** Every requirement has a verifier. Every material failure mode has a control. Every planned action is authorized. Dependencies contain no cycles.
11. **Red-team.** Dispatch a fresh subagent with only the compiled output and this skill's Audit mode. Give it the output, not your reasoning. If subagents aren't available, run Audit mode yourself as a separate pass. Fold the findings back in.
12. **Render** the three outputs (see Output format).

**Done when:** every requirement has an ID, type, mandatory flag, predicate, verifier, evidence, failure action and authority. All four coverage checks pass. Every unresolved policy choice sits in the decision register with the owner named. Nothing is in the checklist as a requirement unless the brief or the owner supports it.

## Audit mode

1. **Inventory.** Assign source IDs to the checklist items without changing their wording. Every finding cites the IDs it concerns.
2. **Apply the hard gates** (see Reference). A gate failure is reported first and blocks the readiness verdict.
3. **Precision pass.** Test every item against the applicable Precision pitfalls, then ask of each item whether two executors could read it differently. Also test cross-section interactions: limits that combine, verification steps the gate never requires to pass, actions that reach outside scope.
4. **Self-consistency pass.** Taxonomies, examples, formulas, diagrams and section names must agree across the document.
5. **Evidence pass.** Separate "method or reference omitted" from "evidence shown to be absent". Mark empirical claims that have no observation method as UNKNOWN.
6. **Dispositions.** Give each finding one of: proposed correction, existing control sufficient, open decision (owner named), or justified deferral.
7. **Verdict.** State structural quality and execution readiness separately. Readiness is "not established" while any mandatory finding is open.

**Done when:** every source item has been checked against every applicable pitfall (record which pitfalls were judged not applicable), every finding cites a source ID and has a disposition, and the verdict agrees with the gate results.

## Reference

### Canonical requirement types

| Type | Example | Evidence needed |
|---|---|---|
| Action | Create the task branch | Resulting state |
| State assertion | PR targets `master` | Current state |
| Invariant | Existing changes preserved | Before/after comparison or event history |
| Prohibition | No migration files changed | Diff against the recorded base |
| Temporal constraint | Test fails before the fix | Ordered execution record |
| Gate | No completion until checks pass | Status of all prerequisites |

Subtypes (e.g. `mutation_constraint` under Prohibition) are allowed only when they are declared under a parent type.

### Requirement schema

```yaml
id: SCOPE-004
type: prohibition            # canonical type
subtype: mutation_constraint # optional, declared
statement: package.json may change only in scripts.typecheck
mandatory: true              # false = nonblocking; only true items enter the gate
applies_when: always
target: package.json
predicate: every changed JSON path is under scripts.typecheck
dependencies: [REPO-003]     # [] when none
verification:
  method: structured_diff
  evidence: diff of package.json against recorded base SHA
failure_action: block_completion
authority: owner
```

### Status and gate

- **PASS**: sufficient evidence, tied to the delivered revision, establishes the predicate.
- **FAIL**: the evidence contradicts the predicate.
- **UNKNOWN**: the evidence is absent, stale or insufficient. UNKNOWN blocks exactly as FAIL does.
- Gate: `Complete ⇔ ∀ r ∈ ApplicableMandatory : Status(r) = PASS`. In plain words, the task is complete only when every mandatory requirement that applies is PASS.
- A non-blocking limitation never waives a mandatory requirement. Only an authorized change to the requirement can.
- Any change to code or the PR head after verification invalidates the affected evidence.

### Hard gates (reject or block the readiness verdict)

- Conflicting mandatory requirements
- An undefined completion condition, or a gate that a listed blocker can satisfy
- A required action outside the executor's authority
- A mandatory claim with no verification method
- A dependency cycle

### Precision pitfalls

| Pitfall | Precise form |
|---|---|
| A time-relative reference ("current master", "latest") | A fetched SHA, recorded, plus a rule for when to recheck freshness |
| A single "starting SHA" | Separate original checkout SHA, base SHA, tested revision and delivery SHA |
| "Preserve existing changes" | Record the initial status and diff, and name the comparison that proves preservation |
| A file allowlist alone | Allowed fields or sections within files; lockfile and generated-file policy when dependencies may change |
| Encoded-input rules | Case-insensitive percent-encoding (`%2f` = `%2F`); an exact definition of "control characters" and of every "unsafe" token |
| Prefix routes | A segment-boundary rule (`/train`, `/train/…`, `/train?…`, not `/trainer`) |
| Parse, decode and compare steps | An explicit order, including encoded dot segments (`%2e%2e`) |
| Length limits | Unit (UTF-16 code units, code points or graphemes); truncate, reject or suppress; limits for composed strings (template plus inserted value) |
| Numeric inputs | Behaviour for negative, null, non-integer and out-of-range values |
| "Run and record" | A pass criterion for every check, enforced by the gate |
| "Blockers listed" | A listed blocker means not complete |
| An empirical value stated in the checklist ("record impact: 0") | A measurement method, environment and timestamp; the expected value; stop and escalate if it differs |
| "For every correction" | A definition of the correction unit and its required test cycle |
| Reusing code outside scope | A precondition check that it is usable unchanged; otherwise escalate |
| Actions on other branches or tasks | An explicit statement of whether this executor performs them or must leave them alone |
| Type-level safety claims ("cannot expose tokens") | A runtime check of the actual serialization and logging paths |
| No recovery rules | Stop, retry, preserve and escalate behaviour for each failure point |

## Output format

1. **Execution checklist**: sections in dependency order, with each item rendered as `- [ ] ID: statement`. Constraint sections (scope, safety, boundaries) state the phases they span.
2. **Evidence ledger**: a table of ID | type | mandatory | predicate | verifier | evidence artifact | revision | status (PASS/FAIL/UNKNOWN).
3. **Decision register**: a table of ID | question | draft recommendation | affected requirements | owner | closure event. Policy choices stay with the owner. The executor drafts the options.

In audit mode, output the disposition register (finding ID | source IDs | finding | evidence | disposition | owner) followed by the two-part verdict.
