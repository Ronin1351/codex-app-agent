> Execution note: where a step says "paste", "save as", or "fresh session", follow the execution rules in SKILL.md instead.

# PART A — IDEA GENERATOR

## G1 — Frame the opportunity space

```
ROLE: Opportunity strategist.
INPUTS: variables only.

DOMAIN: {{DOMAIN}} | GEOGRAPHY: {{GEOGRAPHY}}
BUILDER ASSETS: {{BUILDER_ASSETS}}
BUDGET/TIMELINE: {{BUDGET_TIMELINE}}
IDEA TYPE: {{IDEA_TYPE}}

TASK:
1. List 5 specific user groups within the domain (P1–P5).
2. For each, name the most painful, frequent problem and how they solve it today.
3. Define 3 kill criteria (K1–K3): hard rules any idea must eventually pass. For each, say when it can first be tested: SCREEN (judgeable from a one-line idea) or EVIDENCE (needs G4 research).

OUTPUT SCHEMA:
P<n>: <user group> | PROBLEM: <pain> | TODAY: <current workaround> | FREQUENCY: daily/weekly/monthly/rare
K<n>: <kill criterion> | TEST: <pass/fail rule> | TESTABLE AT: SCREEN / EVIDENCE
```

**Checkpoint:** You approve or edit P1–P5 and K1–K3. Save as `G1-frame.md`.

## G2 — Diverge: 20 raw ideas

```
ROLE: Divergent idea generator. Quantity and range over polish.
INPUTS: ledger, G1-frame.md

TASK:
Generate 20 ideas (I01–I20), 4 from each lens:
- PROBLEM-FIRST: directly solves a P1–P5 problem
- ASSET-FIRST: built on a builder asset others don't have
- TREND-FIRST: rides a current shift ({{TRENDS}} if given; otherwise propose trends tagged [ASSUMED])
- TRANSFER: a model that works in another industry or country, moved into this domain
- INVERSION: removes, reverses, or does the opposite of the standard approach

Each idea is one line. No two ideas may share the same mechanism. Do not self-censor except on SCREEN-type kill criteria.

OUTPUT SCHEMA:
I<nn> [LENS] <title> — <what it is> | FOR: <P-ID> | PAYS: <who pays and how>
```

Save as `G2-ideas.md`.

## G3 — Cull to 6

```
ROLE: Ruthless filter.
INPUTS: ledger, G1-frame.md, G2-ideas.md

TASK:
1. Merge duplicates (same mechanism, different wording).
2. Apply only SCREEN-type kill criteria. FAIL = cut, with the K-ID. EVIDENCE-type criteria are marked UNKNOWN and passed to G4 — never cut an idea on a criterion you can't yet test.
3. From survivors, keep the 6 with the strongest combination of pain severity × frequency × builder-asset fit. Keep at least 2 different lenses.

OUTPUT SCHEMA:
MERGED: <I-ID + I-ID → kept ID>
CUT: <I-ID — K-ID failed, or reason>
KEPT: <I-ID> — <why> | OPEN KILL CHECKS: <K-IDs marked UNKNOWN>
```

Save as `G3-shortlist.md`.

## G4 — 🔎 Evidence pass (prior art + demand)

```
ROLE: Market researcher. Use web search. Report only what you find.
INPUTS: ledger, G3-shortlist.md

SCOPE: Search the target geography ({{GEOGRAPHY}}) first, then global. Record every query.

TASK, for each idea:
1. PRIOR ART: Find existing products/services doing the same or a close thing. Name up to 3 with URLs and grade. Run at least 3 differently worded searches before declaring none.
2. DEMAND SIGNALS: Evidence that people want this — complaints, forum threads, review gaps, prices people already pay, search interest. Grade each E1–E4. Vendor traction claims are E3, not demand proof.
3. GAP: What existing options fail to do, based on the evidence.
4. OPEN KILL CHECKS: Resolve each UNKNOWN from G3 to PASS / FAIL / UNKNOWN with evidence.
5. EVIDENCE CONFIDENCE: HIGH (≥2 independent E1/E2 sources), MEDIUM (one E1/E2, or several E3), LOW (E4 only).

OUTPUT SCHEMA (per idea):
### I<nn>: <title>
QUERIES: <list>
PRIOR ART: <name — URL — grade — how it overlaps> | or NO CLOSE PRECEDENT FOUND IN SEARCHED SCOPE
DEMAND SIGNALS: <signal — URL — grade — geography>
CONFLICTS: <contradicting evidence, or none>
GAP: <one line>
KILL CHECKS: K<n> PASS/FAIL/UNKNOWN — <evidence>
EVIDENCE CONFIDENCE: HIGH / MEDIUM / LOW
VALIDATION IDEA: <cheapest test that would move confidence up>
```

Any idea with a kill check now FAIL is dropped before G5. Save as `G4-evidence.md`.

## G5 — Seed Jury (fresh session)

```
ROLE: Independent venture reviewer. You did not create these ideas. Default to lower scores when evidence is thin.
INPUTS: G1 kill criteria + builder assets + budget (from ledger), G4-evidence.md only.

GATE: Any kill check FAIL = DISQUALIFIED. UNKNOWN is allowed but must be listed as a risk.

SCORE each idea 1–5:

Demand
 1 = No evidence anyone wants this
 2 = Only E3/E4 evidence
 3 = At least one E1/E2 signal of real pain
 4 = ≥2 independent E1/E2 signals, plus people already paying for worse alternatives
 5 = As 4, plus an obvious underserved gap confirmed in the target geography
Originality (must cite G4 prior art)
 1 = A direct competitor already does this well
 2 = Competitors exist; minor differentiation
 3 = Competitors exist, but a clear, defensible gap
 4 = Few precedents; new mechanism or new market
 5 = No close precedent found in the documented search scope
Feasibility (state assumed cost, key dependencies, and time-to-first-test)
 1 = Unproven technology or far outside budget
 2 = Major R&D or capital beyond budget
 3 = Doable, but significant integration, cost, or operating risk
 4 = Buildable and operable within the stated budget/timeline
 5 = Testable version in weeks with existing tools
Fit
 1 = Uses no builder assets
 2 = Weak link to builder assets
 3 = Uses one asset meaningfully
 4 = Uses multiple assets; builder has an edge
 5 = Builder has an advantage competitors can't easily copy

TOTAL = 4–20.
TIERS: 4–10 Drop | 11–14 Maybe | 15–17 Strong | 18–20 Exceptional
CAPS (non-compensatory):
 - Demand ≤2 → max tier Maybe
 - Feasibility ≤2 → max tier Maybe
 - Evidence confidence LOW → max tier Maybe

OUTPUT SCHEMA (per idea):
### I<nn>: <title>
GATE: PASS | DISQUALIFIED (<K-ID>)
Demand X/5 — <reason + source> | Originality X/5 — <reason + prior art> | Feasibility X/5 — <cost, dependencies, time> | Fit X/5 — <reason>
Total: X/20 — Tier: <tier> <(capped: reason)> | Evidence confidence: <H/M/L>
Biggest risk: <one line>

FINAL:
TOP 3 SEEDS: <I-ID> > <I-ID> > <I-ID>
```

**Tie-break rule (applies to G5 and S4):** If the top two finalists are within 1 point, run the jury once more in another fresh session and average. If two runs disagree by ≥3 points on any idea, you decide, and the reason is recorded in the ledger.

**Mode A ends here:** 3 ranked seeds with evidence and a validation idea for each.
**Mode C:** the #1 seed becomes `{{SEED}}` for S1, and its G4 entry becomes S0's output. If no idea reaches Strong, go back to G2 with the jury's biggest risks as new kill criteria (maximum 2 reruns).
