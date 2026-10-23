# Agent Prompt Library

These prompts are routing templates. Replace bracketed values and preserve the named skill order.

## Start of day

```text
Start my development day for [REPO]. Use graphify and repository instructions for read-only reconnaissance. Inspect status, diff, recent commits, scripts, tests, deployment configuration, and unfinished work. Summarize current state, risks, and the highest-value task. If new behavior is needed, use superpowers:brainstorming and present approaches before changing code. Do not modify files or install dependencies until the required approval gate is satisfied.
```

## End of day

```text
Close out today’s work for [REPO]. Use verification-before-completion. Inspect the actual diff and untracked files, run fresh relevant tests/build/lint/typecheck/browser checks, and use graphify update if the code graph needs refreshing. Report evidence, failures, risks, uncommitted work, and the smallest next task. Do not claim completion without fresh command output.
```

## Greenfield app

```text
Design and build [APP]. Start with superpowers:brainstorming, then product-design:index/ideate and frontend-app-builder if it has a visual UI. Present approaches, write the approved design, then use writing-plans and TDD. Preserve approved visual decisions. Validate with frontend-testing-debugging, browser evidence, responsive checks, tests, build, and verification-before-completion. Stop before implementation until I approve the design.
```

## New feature

```text
Implement [FEATURE] in [REPO]. Use graphify to understand the existing architecture, brainstorming to clarify intent and non-goals, writing-plans after design approval, TDD for behavior, and verification-before-completion at the end. Preserve unrelated changes. Ask before changing public interfaces, data models, dependencies, or external state.
```

## UI redesign

```text
Redesign [SURFACE]. Use product-design:ideate or frontend-app-builder for the concept, image-to-code when implementing from a reference, react-best-practices for React changes, and frontend-testing-debugging for browser QA. Treat the accepted design as the implementation contract. Verify page identity, non-blank content, console health, screenshots, interaction, and mobile behavior before claiming completion.
```

## Backend/API

```text
Implement [API/BACKEND CHANGE]. Use graphify and codebase-design first, then create-a-backend or the repo’s existing backend skill. Use TDD and security-scan where data or authorization is involved. Define interfaces, error behavior, ownership, and rollback before implementation. Verify with typecheck, unit/integration tests, build, and security-relevant negative cases.
```

## Supabase/database

```text
Change [DATABASE AREA]. Use supabase:supabase and supabase:supabase-postgres-best-practices. Inspect migrations, RLS, indexes, constraints, seed data, and environment handling. Add security threat modeling for auth or sensitive data. Ask before destructive migration or production mutation. Verify migrations, policies, query behavior, and integration tests.
```

## Authentication/authorization

```text
Change [AUTH FLOW]. Use the relevant auth skill, codex-security:threat-model, security-scan, and validation. Enumerate actors, trust boundaries, sessions, secrets, failure modes, and negative cases before coding. Never weaken or bypass controls silently. Verify allowed and denied paths, expiration, privilege boundaries, and secret handling.
```

## Bug diagnosis

```text
Diagnose [BUG]. Use systematic-debugging and diagnosing-bugs. Reproduce the symptom, collect evidence, identify the earliest incorrect state, and state the root cause before proposing a fix. Add a regression test with TDD, make the smallest fix, and rerun the original reproduction plus the relevant suite. Do not change unrelated behavior.
```

## Performance issue

```text
Investigate [PERFORMANCE PROBLEM]. Establish a measured baseline first. Use diagnosing-bugs, graphify, and the relevant caching/runtime or frontend testing skill. Identify the bottleneck, propose alternatives, and change one variable at a time. Verify with before/after measurements and regression checks; do not optimize based on intuition alone.
```

## Security review

```text
Audit [SCOPE] for security issues. Select exactly the requested codex-security workflow: standard repository, diff, deep, threat model, finding discovery, validation, or fix verification. Preserve source evidence, severity, confidence, attack path, coverage, and unresolved gaps. Do not remediate unless explicitly authorized. Report findings with precise file/line evidence.
```

## Code review

```text
Review [BASE/DIFF/PR]. Use code-review and security-diff-scan when security-sensitive. Inspect the actual diff, surrounding code, tests, and repository conventions. Report actionable findings ordered by severity with file/line evidence. Do not rewrite code or approve the change unless requested.
```

## Refactoring

```text
Refactor [AREA] without changing behavior. Use graphify, codebase-design, characterization tests, TDD, and verification-before-completion. Map callers and boundaries before edits. Make small independently testable steps, preserve compatibility, and prove behavior with the existing suite and new focused tests.
```

## Test failure

```text
Investigate this failing test: [FAILURE]. Use systematic-debugging and diagnosing-bugs. Run the exact failure first, inspect the full error and relevant code, determine whether the test or implementation is wrong, then add or update a regression test only after the cause is understood. Verify the fix with the original command and the relevant suite.
```

## Deployment/release

```text
Prepare [APP] for [DEPLOYMENT/RELEASE]. Use the exact Vercel deployment skill, env-vars, verification, and security-diff-scan as applicable. Confirm target, branch, environment, migrations, secrets, rollback, and smoke checks. Ask before production mutation. Run the release checklist and report deployment evidence, not assumptions.
```

## Production incident

```text
Investigate [INCIDENT]. Stabilize first. Use diagnosing-bugs or vercel-agent plus the relevant caching/firewall/runtime skill. Establish a timeline, preserve evidence, identify blast radius, and propose reversible mitigation. Ask before destructive or broad external actions. Verify recovery and record follow-up prevention work.
```

## Documentation/handoff

```text
Create a handoff for [WORK]. Use writing-for-agents and graphify. Record the current state, decisions, changed files, commands, verification evidence, known gaps, rollback/recovery steps, and the exact next action. Keep one source of truth and link to authoritative files rather than copying stale configuration.
```
