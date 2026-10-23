# Agent Skill Dispatch Rules

## Routing algorithm

1. Identify the user’s requested outcome, changed surface, risk, and lifecycle phase.
2. Check repository instructions and current working-tree state.
3. Use `graphify` for repository architecture, file relationships, or content questions when a graph exists.
4. Select exactly one primary workflow skill unless the user explicitly requests independent parallel work.
5. Add supporting skills only when their trigger conditions are present.
6. Apply approval gates before implementation, external writes, destructive actions, deployment, messaging, or release operations.
7. Run the primary skill’s required verification and the supporting skills’ required checks.
8. Apply `superpowers:verification-before-completion` before any claim that work is complete, fixed, passing, safe, or ready.

## Primary routing

```text
New product, feature, behavior, or UI concept?
  -> superpowers:brainstorming
     -> product-design:* or build-web-apps:* for visual work
     -> superpowers:writing-plans after design approval
     -> superpowers:test-driven-development during implementation

Existing bug, failing test, or unexpected behavior?
  -> superpowers:systematic-debugging
     -> mattpocock-skills:diagnosing-bugs when deeper diagnosis is needed
     -> TDD/regression verification after root cause is established

Security question or repository security audit?
  -> codex-security:security-scan
     -> security-diff-scan for a diff/PR
     -> deep-security-scan only when exhaustive multi-pass scope is requested

Database, Supabase, auth, or secrets?
  -> supabase:* or vercel:auth
     -> codex-security:threat-model and security validation

Deployment, hosting, domains, env vars, caching, or runtime operations?
  -> vercel:* skill matching the exact operation
     -> vercel:verification before claiming success

Review, release, or handoff?
  -> mattpocock-skills:code-review or superpowers:finishing-a-development-branch
     -> verification-before-completion

Codex/OpenAI product or skill-system question?
  -> openai-docs
```

## Combinations to avoid

- Do not run standard, diff, and deep security scans interchangeably.
- Do not use `frontend-app-builder` for a small existing UI fix when its concept-generation gate is unnecessary; use targeted frontend testing instead.
- Do not use both a hosted provider workflow and an unrelated provider skill unless the user asks for a multi-provider design.
- Do not run deployment mutation skills during diagnosis or review.
- Do not use `finishing-a-development-branch` as permission to commit, push, merge, or create a PR; authorization remains separate.
- Do not let a generic “be thorough” prompt override a skill’s exact tool or approval gate.

## Fallbacks

- If a required tool is unavailable, report the exact missing capability and use the skill’s documented fallback.
- If Browser is unavailable, frontend testing may use Playwright only when the fallback is allowed and the reason is recorded.
- If a provider credential is absent, continue with provider-free checks where the skill allows it; never invent credentials or stop when the skill explicitly says no key is required.
- If a skill file is missing or unreadable, mark it `missing` or `unreadable`; do not infer its rules from memory.
- If user intent or authorization is materially ambiguous, pause with one focused question.

## Completion contract

Every dispatched workflow must finish with:

- files changed or explicitly unchanged
- commands/tools actually run
- pass/fail/blocked result for each required check
- remaining risks and untested paths
- next action, if any
