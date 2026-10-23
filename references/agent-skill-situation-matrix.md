# Agent Skill Situation Matrix

This matrix is the routing layer for the verified Codex skill registry. Select one primary workflow, then add only the supporting skills named here. The source `SKILL.md` remains authoritative when a skill has more detailed rules.

| Situation | Primary skill(s) | Supporting skills | Approval / safety gate | Verification |
|---|---|---|---|---|
| Start of day | `graphify`, `superpowers:brainstorming` | `mattpocock-skills:code-review`, `superpowers:writing-plans` | Read-only reconnaissance first; design approval before implementation | Fresh status, diff, tests/scripts, and risk summary |
| End of day | `superpowers:verification-before-completion` | `graphify`, `mattpocock-skills:handoff` when available, `mattpocock-skills:retro` when available | No completion claim without fresh evidence | Tests/build/lint/typecheck/browser evidence and clean handoff |
| Greenfield app | `superpowers:brainstorming` | `product-design:index`, `product-design:ideate`, `build-web-apps:frontend-app-builder`, `superpowers:writing-plans` | Approve approach and design before scaffolding | Browser QA, responsive checks, tests, build |
| New feature | `superpowers:brainstorming` | `superpowers:writing-plans`, `superpowers:test-driven-development`, `graphify`, `superpowers:verification-before-completion` | Design/spec approval before code | Red-green test cycle plus full relevant suite |
| UI redesign | `product-design:ideate` or `build-web-apps:frontend-app-builder` | `product-design:image-to-code`, `build-web-apps:frontend-testing-debugging`, `build-web-apps:react-best-practices` | Accepted visual concept is the implementation contract | Browser DOM, console, screenshots, interaction, mobile viewport |
| Backend/API work | `vercel:create-a-backend` or `mattpocock-skills:codebase-design` | `superpowers:test-driven-development`, `codex-security:security-scan`, `vercel:vercel-functions` | Confirm data ownership, auth, and external side effects | Unit/integration tests, typecheck, build, contract checks |
| Supabase/database work | `supabase:supabase` | `supabase:supabase-postgres-best-practices`, `codex-security:security-scan`, `superpowers:test-driven-development` | Review migrations, RLS, secrets, and destructive operations | Migration checks, RLS tests, integration tests, query verification |
| Authentication/authorization | `vercel:auth` or `supabase:supabase` | `codex-security:threat-model`, `codex-security:security-scan`, `codex-security:validation` | Never weaken auth or expose secrets without explicit approval | Auth tests, negative tests, security evidence, runtime checks |
| Bug diagnosis | `superpowers:systematic-debugging` | `mattpocock-skills:diagnosing-bugs`, `graphify`, `superpowers:test-driven-development` | Diagnose before proposing a fix; reproduce first | Failing reproduction, regression test, passing rerun |
| Performance issue | `mattpocock-skills:diagnosing-bugs` | `vercel:cdn-caching`, `vercel:runtime-cache`, `build-web-apps:frontend-testing-debugging`, `graphify` | Measure baseline before optimization | Before/after benchmark or trace, regression checks |
| Security review | `codex-security:security-scan` | `codex-security:threat-model`, `codex-security:finding-discovery`, `codex-security:validation` | Keep standard, diff, and deep scans distinct | Source-backed findings, coverage, validation evidence |
| Code review | `mattpocock-skills:code-review` | `codex-security:security-diff-scan`, `superpowers:verification-before-completion` | Review current diff/base; do not invent requirements | Findings tied to files/lines and checked commands |
| Refactoring | `mattpocock-skills:codebase-design` | `graphify`, `superpowers:test-driven-development`, `superpowers:verification-before-completion` | Preserve behavior unless scope explicitly changes | Characterization tests, full suite, build |
| Test failure | `superpowers:systematic-debugging` | `mattpocock-skills:diagnosing-bugs`, `superpowers:test-driven-development`, `build-web-apps:frontend-testing-debugging` | Do not mask or loosen the test before root-cause analysis | Reproduction, root cause, fixed test, rerun |
| Deployment | `vercel:deployments-cicd` or `vercel:vercel-cli` | `vercel:env-vars`, `vercel:verification`, `superpowers:verification-before-completion` | Confirm target/environment and rollback path | Deployment logs, smoke test, health check |
| Production incident | `vercel:vercel-agent` or `mattpocock-skills:diagnosing-bugs` | `vercel:cdn-caching`, `vercel:vercel-firewall`, `codex-security:validation` | Stabilize first; changes with external impact require approval | Timeline, mitigation evidence, regression/monitoring check |
| Documentation | `mattpocock-skills:writing-for-agents` | `mattpocock-skills:research`, `pages:write-page`, `openai-docs` when Codex/OpenAI-specific | Keep one source of truth; cite current sources | Link/path checks and stale-reference review |
| Release preparation | `superpowers:finishing-a-development-branch` | `mattpocock-skills:code-review`, `codex-security:security-diff-scan`, `vercel:verification` | No merge/push/release without explicit authorization | Full verification checklist and release notes |
| Handoff | `mattpocock-skills:handoff` | `graphify`, `mattpocock-skills:writing-for-agents`, `superpowers:verification-before-completion` | State what is known, unknown, and unverified | Reproducible commands and exact remaining work |

## Precedence

1. Direct user instructions and repository instructions win.
2. Safety and authorization gates win over convenience.
3. A phase-specific skill wins over a generic skill for that phase.
4. `superpowers:verification-before-completion` governs completion claims.
5. `superpowers:brainstorming` governs new product/behavior work until the user opts out or approves the design.
6. `codex-security:security-diff-scan`, `codex-security:deep-security-scan`, and `codex-security:security-scan` are different scopes; do not substitute one for another.
7. When two skills conflict, stop, name the conflict, preserve the stricter gate, and ask the user only if the conflict changes the requested outcome.

## Full catalog coverage

Every verified catalog skill is assigned to at least one lifecycle category below. The detailed per-skill lifecycle fields are in `agent-skill-registry.json`.

### backend/data

`supabase:supabase`, `supabase:supabase-postgres-best-practices`, `vercel:create-a-backend`, `vercel:queues`, `vercel:runtime-cache`, `vercel:vercel-storage`

### core app-development

`mattpocock-skills:code-review`, `mattpocock-skills:codebase-design`, `mattpocock-skills:diagnosing-bugs`, `mattpocock-skills:domain-modeling`, `mattpocock-skills:grilling`, `mattpocock-skills:pr`, `mattpocock-skills:prototype`, `mattpocock-skills:research`, `mattpocock-skills:tdd`, `mattpocock-skills:wizard`, `mattpocock-skills:writing-for-agents`, `superpowers:brainstorming`, `superpowers:diagnosing-superpowers`, `superpowers:dispatching-parallel-agents`, `superpowers:executing-plans`, `superpowers:finishing-a-development-branch`, `superpowers:receiving-code-review`, `superpowers:requesting-code-review`, `superpowers:subagent-driven-development`, `superpowers:systematic-debugging`, `superpowers:test-driven-development`, `superpowers:using-git-worktrees`, `superpowers:using-superpowers`, `superpowers:verification-before-completion`, `superpowers:writing-plans`, `superpowers:writing-skills`

### deployment/operations

`vercel:access-protected-vercel-deployment`, `vercel:ai-gateway`, `vercel:ai-sdk`, `vercel:auth`, `vercel:bootstrap`, `vercel:build-agents`, `vercel:cdn-caching`, `vercel:chat-sdk`, `vercel:custom-metrics`, `vercel:deployments-cicd`, `vercel:domains`, `vercel:env-vars`, `vercel:eve`, `vercel:flags-sdk`, `vercel:is-agentic`, `vercel:knowledge-update`, `vercel:marketplace`, `vercel:microfrontends`, `vercel:react-best-practices`, `vercel:routing-middleware`, `vercel:vercel-agent`, `vercel:vercel-cli`, `vercel:vercel-connect`, `vercel:vercel-firewall`, `vercel:vercel-functions`, `vercel:vercel-sandbox`, `vercel:vercel-services`, `vercel:verification`, `vercel:workflow`

### documentation/productivity

`documents:documents`, `pages:maintain-space`, `pages:manage-schedules`, `pages:organize-space`, `pages:write-page`, `pdf:pdf`, `plugin-management:plugin-management`, `presentations:presentations`, `spreadsheets:excel-live-control`, `spreadsheets:spreadsheets`, `template-creator:template-creator`

### frontend/UI

`build-web-apps:frontend-app-builder`, `build-web-apps:frontend-testing-debugging`, `build-web-apps:react-best-practices`, `build-web-apps:shadcn-best-practices`, `build-web-apps:stripe-best-practices`, `product-design:audit`, `product-design:ideate`, `product-design:image-to-code`, `product-design:index`, `product-design:url-to-code`, `sites:sites`, `sites:sites-remix`, `visualize:visualize`

### research/investigation

`graphify`, `notebooklm`

### security

`codex-security:assess-patch-risk`, `codex-security:attack-path-analysis`, `codex-security:deep-security-scan`, `codex-security:define-security-policy`, `codex-security:finding-discovery`, `codex-security:fix-finding`, `codex-security:propose-security-hardening`, `codex-security:security-diff-scan`, `codex-security:security-scan`, `codex-security:threat-model`, `codex-security:track-findings`, `codex-security:triage-finding`, `codex-security:validation`, `codex-security:verify-fix`, `codex-security:vulnerability-writeup`

### specialized or usually unrelated

`computer-use:computer-use`, `imagegen`, `nvidia:nvidia-skill-finder`, `openai-docs`, `reverse-engineer-anything`, `skill-creator`, `skill-installer`, `work-pets:create-pet`, `work-pets:pets`, `work-pets:update-pet`
