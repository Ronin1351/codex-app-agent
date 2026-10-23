# Agent Skill Inventory

Verified catalog skills: 112

Each entry below was read in full and recorded with its source hash. Extracted evidence is intentionally concise; the source skill remains authoritative.

## build-web-apps:frontend-app-builder
- Category: frontend/UI
- Purpose: Use for new frontend applications, dashboards, games, creative websites, hero sections, and visually driven UI from scratch, or when the user explicitly asks for a redesign/restyle/modernization. Builds from clean, airy, high-taste, readable image-generated concept design with section-specific references, faithful implementation, and browser testing.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=186; sha256=9273de02827b29534be28fb2b37154c1571ac38b4e20d3ef5482b7e22af67394
- Triggers: Use for new frontend applications, dashboards, games, creative websites, hero sections, and visually driven UI from scratch, or when the user explicitly asks for a redesign/restyle/modernization. Builds from clean, airy, high-taste, readable image-generated concept design with section-specific references, faithful implementation, and browser testing.
- Prerequisites/evidence: Coordinate With Other Installed Skills; Before Coding
- Dependencies/references: references/imagegen-website-concepts.md
- Approval/safety gates: Surface Gates
- Verification evidence: Concept Review Mode; Verification; Final Response
- Artifacts mentioned: references/imagegen-website-concepts.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## build-web-apps:frontend-testing-debugging
- Category: frontend/UI
- Purpose: Use when testing, debugging, or making targeted improvements to rendered frontend apps through the Build Web Apps or web dev plugin: local dev servers, UI regressions, interaction bugs, console errors, responsive layout, and visual QA. Check whether the Browser plugin is available and use it first when it is; otherwise use regular Playwright with the recorded reason.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=143; sha256=03724620cf7e7de425b607a5492f572d867b1cf5d9c92c74bf50d057d7415e0b
- Triggers: Use when testing, debugging, or making targeted improvements to rendered frontend apps through the Build Web Apps or web dev plugin: local dev servers, UI regressions, interaction bugs, console errors, responsive layout, and visual QA. Check whether the Browser plugin is available and use it first when it is; otherwise use regular Playwright with the recorded reason.
- Prerequisites/evidence: Invocation Contract; Required Browser Checks
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Frontend Testing Debugging; Required Browser Checks; Validation Checklist; QA Final Response Report; Final Response
- Artifacts mentioned: package.json; tmp/frontend-check.png
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## build-web-apps:react-best-practices
- Category: frontend/UI
- Purpose: React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=143; sha256=cc7d03309817f392c419a203e1bc1f1759ef94831f7dbedf39d91a35ac5bc86a
- Triggers: React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Apply
- Verification evidence:
- Artifacts mentioned: rules/async-parallel.md; rules/bundle-barrel-imports.md; AGENTS.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## build-web-apps:shadcn-best-practices
- Category: frontend/UI
- Purpose: Manages shadcn components and projects — adding, searching, fixing, debugging, styling, and composing UI. Provides project context, component docs, and usage examples. Applies when working with shadcn/ui, component registries, presets, --preset codes, or any project with a components.json file. Also triggers for "shadcn init", "create an app with --preset", or "switch to --preset".
- Source: catalog://reviewed-skill
- Status: reviewed; lines=241; sha256=7678f5168d4ee6f3ae3ce4d3d41c654f0aebc7b88cbc392a9504822dec0dff28
- Triggers: Manages shadcn components and projects — adding, searching, fixing, debugging, styling, and composing UI. Provides project context, component docs, and usage examples. Applies when working with shadcn/ui, component registries, presets, --preset codes, or any project with a components.json file. Also triggers for "shadcn init", "create an app with --preset", or "switch to --preset".
- Prerequisites/evidence: Current Project Context; Preview changes before adding/updating.; View registry item details (for items not yet installed).
- Dependencies/references: ./rules/styling.md; ./rules/forms.md; ./rules/composition.md; ./rules/base-vs-radix.md; ./rules/icons.md; ./cli.md; ./customization.md
- Approval/safety gates:
- Verification evidence: Preview changes before adding/updating.
- Artifacts mentioned: components.json; styling.md; ./rules/styling.md; forms.md; ./rules/forms.md; composition.md; ./rules/composition.md; base-vs-radix.md; ./rules/base-vs-radix.md; icons.md; ./rules/icons.md; cli.md; ./cli.md; rules/forms.md; rules/composition.md; rules/icons.md; rules/styling.md; rules/base-vs-radix.md; customization.md; ./customization.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## build-web-apps:stripe-best-practices
- Category: frontend/UI
- Purpose: Guides Stripe integration decisions — API selection (Checkout Sessions vs PaymentIntents), Connect platform setup (Accounts v2, controller properties), billing/subscriptions, Treasury financial accounts, integration surfaces (Checkout, Payment Element), and migrating from deprecated Stripe APIs. Use when building, modifying, or reviewing any Stripe integration — including accepting payments, building marketplaces, integrating Stripe, processing payments, setting up subscriptions, or creating connected accounts.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=28; sha256=5062f0c980030af377a0ac33b77c9d233676e2ecbb57b3d3cd8734fc0da464b2
- Triggers: Guides Stripe integration decisions — API selection (Checkout Sessions vs PaymentIntents), Connect platform setup (Accounts v2, controller properties), billing/subscriptions, Treasury financial accounts, integration surfaces (Checkout, Payment Element), and migrating from deprecated Stripe APIs. Use when building, modifying, or reviewing any Stripe integration — including accepting payments, building marketplaces, integrating Stripe, processing payments, setting up subscriptions, or creating connected accounts.
- Prerequisites/evidence:
- Dependencies/references: references/payments.md; references/connect.md; references/billing.md; references/treasury.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: references/payments.md; references/connect.md; references/billing.md; references/treasury.md; docs.stripe.com/payments/payment-methods/integration-options.md; docs.stripe.com/payments-api/tour.md; docs.stripe.com/get-started/checklist/go-live.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## codex-security:assess-patch-risk
- Category: security
- Purpose: Assess an immutable patch artifact's program impact, regression risk, and auto-merge eligibility. Use for generated patch files, provider pull-request diffs, or commit ranges when reviewers need evidence about affected runtime paths, contracts, tests, and recoverability. This skill is read-only and does not generate, edit, apply, push, or merge the patch.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=98; sha256=c3b62a8c1d6135945a055134f50329047bb908972fc7b320a592edbc3d38b419
- Triggers: Assess an immutable patch artifact's program impact, regression risk, and auto-merge eligibility. Use for generated patch files, provider pull-request diffs, or commit ranges when reviewers need evidence about affected runtime paths, contracts, tests, and recoverability. This skill is read-only and does not generate, edit, apply, push, or merge the patch.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; references/risk-rubric.md; ../../schemas/patch-risk-assessment.schema.json
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../../references/artifact-storage.md; references/risk-rubric.md; ../../schemas/patch-risk-assessment.schema.json; skills/assess-patch-risk/SKILL.md; assessment.json
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:attack-path-analysis
- Category: security
- Purpose: Use when Codex is already in the attack-path-analysis phase of a security scan or the user explicitly asks to trace a security finding from source to sink and calibrate severity. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=118; sha256=9465d2750182acbf6dd8f61e60bb47dc1ca502be5cc3f4a71da7ad39935d1eb1
- Triggers: Use when Codex is already in the attack-path-analysis phase of a security scan or the user explicitly asks to trace a security finding from source to sink and calibrate severity. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; references/severity-policy.md; references/attack-path-facts.md
- Approval/safety gates:
- Verification evidence: Scope and Attack Path Checklist; Counterevidence Checklist; Severity and Policy Checklist
- Artifacts mentioned: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; references/severity-policy.md; references/attack-path-facts.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:deep-security-scan
- Category: security
- Purpose: Use when the user asks for a deep, exhaustive, multi-pass, or variance-reducing repository-wide or scoped-path Codex Security scan. Run repeated complete independent Standard scans with the Codex Security deep-scan tool, which aggregates their validated findings and prepares the canonical artifacts; then complete the same scan once. Do not use for PRs, commits, branch diffs, or working-tree diffs.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=81; sha256=d6aed0d9b47065a1384a96d0a45c843b0cda8ba48e3d2cbe96c65357c6e55ee3
- Triggers: Use when the user asks for a deep, exhaustive, multi-pass, or variance-reducing repository-wide or scoped-path Codex Security scan. Run repeated complete independent Standard scans with the Codex Security deep-scan tool, which aggregates their validated findings and prepares the canonical artifacts; then complete the same scan once. Do not use for PRs, commits, branch diffs, or working-tree diffs.
- Prerequisites/evidence: Shared Scan Setup
- Dependencies/references: ../../references/core-scan.md; ../../references/scan-prologue.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../../references/core-scan.md; scan-manifest.json; findings.json; coverage.json; ../../references/scan-prologue.md; report.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:define-security-policy
- Category: security
- Purpose: Define, review, or update SECURITY.md guidance for a repository or component. Use when the user wants to clarify what Codex Security should review, what is out of scope, which security properties must hold, or whether existing guidance still matches the code.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=94; sha256=2817e1a03980a7ebea478c8d9e6c622e3c6205123e767a1e32f0204c06729cc7
- Triggers: Define, review, or update SECURITY.md guidance for a repository or component. Use when the user wants to clarify what Codex Security should review, what is out of scope, which security properties must hold, or whether existing guidance still matches the code.
- Prerequisites/evidence: Reportable Findings and Severity Context
- Dependencies/references: ../../references/security-guidance.md
- Approval/safety gates:
- Verification evidence: 4. Preview, Approve, and Verify
- Artifacts mentioned: SECURITY.md; ../../references/security-guidance.md; .codex-plugin/plugin.json; .github/SECURITY.md; docs/SECURITY.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:finding-discovery
- Category: security
- Purpose: Use when Codex is already in the finding-discovery phase of a security scan or the user explicitly asks to discover candidate security findings in a repository or code change. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=160; sha256=14cc797e750ca4bdd8b060c4cf96d7d32f25b132aa8f80d0a0837683fe010790
- Triggers: Use when Codex is already in the finding-discovery phase of a security scan or the user explicitly asks to discover candidate security findings in a repository or code change. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; ../../references/security-guidance.md; ../security-scan/references/scan-artifacts-and-ledger.md; ../attack-path-analysis/references/severity-policy.md
- Approval/safety gates: SECURITY.md Guidance Gate
- Verification evidence: Discovery Checklist
- Artifacts mentioned: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; SECURITY.md; ../../references/security-guidance.md; ../security-scan/references/scan-artifacts-and-ledger.md; rank_input.json; deep_review_input.json; ../attack-path-analysis/references/severity-policy.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:fix-finding
- Category: security
- Purpose: Use only when the user explicitly asks to fix and verify a validated or plausible security vulnerability. Do not use for ordinary bug fixes, correctness or design review findings, general validation, or full PR, commit, branch, patch, or repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=99; sha256=ba7311f43b2c0742da0d5c6bdb2f0b26601c09cc59747cf8c62a09f8d0bb86d2
- Triggers: Use only when the user explicitly asks to fix and verify a validated or plausible security vulnerability. Do not use for ordinary bug fixes, correctness or design review findings, general validation, or full PR, commit, branch, patch, or repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md
- Approval/safety gates:
- Verification evidence: Patch Candidate Review
- Artifacts mentioned: ../../references/artifact-storage.md; ../../references/scan-artifacts.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:propose-security-hardening
- Category: security
- Purpose: Develop evidence-backed structural and architectural security hardening proposals from vulnerability disclosures, supplied findings, incident or assessment documents, source code, or a completed Codex Security scan. Use when a user asks for systemic improvements, alternatives beyond per-finding patches, before-and-after security architecture views, engineering tradeoff analysis, or an implementation-ready plan for a selected hardening option. Also use automatically after a Codex Security scan with reportable findings when the top-level scan workflow requests final-report hardening guidance.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=243; sha256=ad07d88da7c2bc9e551849cdde686b0daad380ed0aac798e6c06444681d75959
- Triggers: Develop evidence-backed structural and architectural security hardening proposals from vulnerability disclosures, supplied findings, incident or assessment documents, source code, or a completed Codex Security scan. Use when a user asks for systemic improvements, alternatives beyond per-finding patches, before-and-after security architecture views, engineering tradeoff analysis, or an implementation-ready plan for a selected hardening option. Also use automatically after a Codex Security scan with reportable findings when the top-level scan workflow requests final-report hardening guidance.
- Prerequisites/evidence: 7. Draw Comparable Before-And-After Views
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; references/proposal-format.md
- Approval/safety gates:
- Verification evidence: 1. Verify And Prepare The Evidence; 9. Review And Validate
- Artifacts mentioned: ../../references/artifact-storage.md; scan-manifest.json; findings.json; coverage.json; ../../references/scan-artifacts.md; hardening/hardening.md; report.md; context.md; references/proposal-format.md; hardening.json; hardening.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:security-diff-scan
- Category: security
- Purpose: Review a pull request, commit, branch diff, or working-tree patch for security vulnerabilities.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=40; sha256=f85962d46f141227d794a25253a39232bc4e1ad756509ecd3d8769b85b735136
- Triggers: Review a pull request, commit, branch diff, or working-tree patch for security vulnerabilities.
- Prerequisites/evidence: Setup
- Dependencies/references: ../../references/config-preflight.md; ../../references/desktop-config-preflight.md; ../../references/final-report.md
- Approval/safety gates:
- Verification evidence: Review
- Artifacts mentioned: ../../references/config-preflight.md; SECURITY.md; ../../references/desktop-config-preflight.md; threatmodel.md; report.md; candidate_ledger.json; ../../references/final-report.md; scan-manifest.json; findings.json; coverage.json
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:security-scan
- Category: security
- Purpose: Use for a standard, single-pass security audit of an entire repository or a scoped path, package, folder, or submodule with no diff to review. This is the default repository scan. Do not use for PR, commit, branch, or working-tree diffs, or for deep, multi-pass scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=43; sha256=104e2f93fc965c34e91970f517a89e330d5b29dbb243dcea5d95d83f14d135cf
- Triggers: Use for a standard, single-pass security audit of an entire repository or a scoped path, package, folder, or submodule with no diff to review. This is the default repository scan. Do not use for PR, commit, branch, or working-tree diffs, or for deep, multi-pass scans.
- Prerequisites/evidence: Host And Setup
- Dependencies/references: references/desktop-scan.md; ../../references/scan-prologue.md; ../../references/core-scan.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: references/desktop-scan.md; ../../references/scan-prologue.md; SECURITY.md; scoped-source-input.json; ../../references/core-scan.md; scan-manifest.json; findings.json; coverage.json; report.md; threatmodel.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:threat-model
- Category: security
- Purpose: Use when Codex is already in the threat-modeling phase of a security scan, the user explicitly invokes $threat-model, or the user explicitly asks to create, update, or persist a repository threat model. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=21; sha256=42568e50c787c4c0bfb9495ad67e72ab6c1a951bb910ecba2c67cff8961c4d56
- Triggers: Use when Codex is already in the threat-modeling phase of a security scan, the user explicitly invokes $threat-model, or the user explicitly asks to create, update, or persist a repository threat model. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; ../../references/security-guidance.md; ../../references/threat-model.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; ../../references/security-guidance.md; AGENTS.md; SECURITY.md; ../../references/threat-model.md; threatmodel.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:track-findings
- Category: security
- Purpose: Track validated Codex Security findings in Linear, Jira, GitHub issues, or draft GitHub security advisories. Supports issue batches, duplicate checks, and reviewed writes. Do not use for scans or fixes.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=93; sha256=a6d2f30e6d5ca7bd9d74d83017f2f5481c5829585941208a1673b82c683d292b
- Triggers: Track validated Codex Security findings in Linear, Jira, GitHub issues, or draft GitHub security advisories. Supports issue batches, duplicate checks, and reviewed writes. Do not use for scans or fixes.
- Prerequisites/evidence:
- Dependencies/references: references/jira.md; references/github-security-advisories.md
- Approval/safety gates:
- Verification evidence: 3. Check conventions and duplicates; 4. Preview the writes; 5. Apply and verify
- Artifacts mentioned: references/jira.md; references/github-security-advisories.md; scan-manifest.json; findings.json
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:triage-finding
- Category: security
- Purpose: Triage supplied or imported security findings against a repository using its security policy and static code evidence. Accepts scanner reports, advisories, GitHub findings, and Jira or Linear tickets. Do not use for discovery, duplicate triage, runtime validation, or fixes.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=95; sha256=83081950bd4b29ff37cf82d137aec164532ae56b03dbaad3f4dd1d5423e758a7
- Triggers: Triage supplied or imported security findings against a repository using its security policy and static code evidence. Accepts scanner reports, advisories, GitHub findings, and Jira or Linear tickets. Do not use for discovery, duplicate triage, runtime validation, or fixes.
- Prerequisites/evidence:
- Dependencies/references: references/ticket-intake.md; references/github-rest-intake.md; references/triage-result-contract.md; ../../schemas/findings.schema.json; ../../references/security-guidance.md; ../../references/static-finding-assessment.md
- Approval/safety gates:
- Verification evidence: Review the security policy
- Artifacts mentioned: references/ticket-intake.md; references/github-rest-intake.md; references/triage-result-contract.md; ../../schemas/findings.schema.json; ../../references/security-guidance.md; SECURITY.md; ../../references/static-finding-assessment.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:validation
- Category: security
- Purpose: Use when Codex is already in the validation phase of a security scan or the user explicitly asks to determine whether one or more candidate security findings are valid. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=112; sha256=3c4660f79b12a92728e6bb25027064c3a911d0960d39aeafc8fda9e42ce517a5
- Triggers: Use when Codex is already in the validation phase of a security scan or the user explicitly asks to determine whether one or more candidate security findings are valid. Do not use as the primary trigger for full PR, commit, branch, patch, or repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; ../../references/static-finding-assessment.md; references/validation-guidance.md
- Approval/safety gates:
- Verification evidence: Security Validation; Validation Guidance
- Artifacts mentioned: ../../references/artifact-storage.md; ../../references/scan-artifacts.md; false_positive_feedback.json; ../../references/static-finding-assessment.md; references/validation-guidance.md; AGENTS.md; README.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## codex-security:verify-fix
- Category: security
- Purpose: Use only when the user explicitly requests verification that a security fix remediates a reported vulnerability. Do not invoke automatically while implementing fixes, reviewing ordinary code changes, or running tests. Do not use for non-security fixes, candidate finding validation, or full repository scans.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=49; sha256=3d4530484c7e4c18b6afe7c6527247e96517dce1ebd1bda9d349cd367ecb0ae3
- Triggers: Use only when the user explicitly requests verification that a security fix remediates a reported vulnerability. Do not invoke automatically while implementing fixes, reviewing ordinary code changes, or running tests. Do not use for non-security fixes, candidate finding validation, or full repository scans.
- Prerequisites/evidence:
- Dependencies/references: ../../references/static-finding-assessment.md
- Approval/safety gates: When to Use
- Verification evidence: Verify Fix; Verification Workflow
- Artifacts mentioned: ../../references/static-finding-assessment.md
- Lifecycle situations: during development; bug diagnosis; test failure; code review; release preparation; authentication/authorization; security review; production incident

## codex-security:vulnerability-writeup
- Category: security
- Purpose: Turn vulnerability notes, disclosure reports, PoCs, source code, or Codex Security findings into self-contained, sceptically validated, natural-sounding vulnerability reports. Use for one vulnerability or a disclosure campaign; a Codex Security scan is optional.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=185; sha256=d08582d9963ce3bfbc3fe81b6e85a01e6fe306713d7951bfd8dd2fbc3df75de4
- Triggers: Turn vulnerability notes, disclosure reports, PoCs, source code, or Codex Security findings into self-contained, sceptically validated, natural-sounding vulnerability reports. Use for one vulnerability or a disclosure campaign; a Codex Security scan is optional.
- Prerequisites/evidence:
- Dependencies/references: ../../references/artifact-storage.md; references/report-format.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../../references/artifact-storage.md; references/report-format.md
- Lifecycle situations: during development; authentication/authorization; security review; release preparation; production incident

## computer-use:computer-use
- Category: specialized or usually unrelated
- Purpose: Control Windows apps from ChatGPT
- Source: catalog://reviewed-skill
- Status: reviewed; lines=30; sha256=8211e4b11a19a0dc4f0ace91096c74c5b36037ca4cb2c8988f0f535bb209e951
- Triggers: Control Windows apps from ChatGPT
- Prerequisites/evidence:
- Dependencies/references: ../../docs/guidance.md; ../../docs/api.md; ../../docs/confirmations.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: SKILL.md; ../../docs/guidance.md; ../../docs/api.md; ../../docs/confirmations.md
- Lifecycle situations: during development

## documents:documents
- Category: documentation/productivity
- Purpose: Create, edit, redline, and comment on `.docx`, Word, and Google Docs-targeted document artifacts inside the container, with a strict render-and-verify workflow. Use `render_docx.py` to generate page PNGs (and optional PDF) for visual QA, then iterate until layout is flawless before delivering the final document.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=555; sha256=2412c240a6412eb8186d1daf0b92cbb828f4674069fa90d19243fb5fb58a2639
- Triggers: Create, edit, redline, and comment on `.docx`, Word, and Google Docs-targeted document artifacts inside the container, with a strict render-and-verify workflow. Use `render_docx.py` to generate page PNGs (and optional PDF) for visual QA, then iterate until layout is flawless before delivering the final document.
- Prerequisites/evidence: Tools + Contract Requirements
- Dependencies/references: references/artifact-template-selection.md
- Approval/safety gates:
- Verification evidence: 1) Render any DOCX to PNGs (visual QA); 2) Remove reviewer comments (finalization); 3) Accept tracked changes (finalization); 4) Accessibility audit (+ optional safe fixes); Review lifecycle (comments / tracked changes); QA / regression; Visual review (recommended); Final response; Final Response Citations
- Artifacts mentioned: writing_quality.md; references/artifact-template-selection.md; input.docx; sanitized.docx; template-distill.md; template-create.md; TMP_DIR/artifact.md; mnt/data/equation.png; mnt/data/output/equations.docx; no_comments.docx; accepted.docx; a11y_report.json; a11y_fixed.docx; redacted.docx; SKILL.md; tasks/read_review.md; tasks/create_edit.md; tasks/verify_render.md; tasks/accessibility_a11y.md; tasks/comments_manage.md; tasks/protection_restrict_editing.md; tasks/privacy_scrub_metadata.md; tasks/multi_doc_merge.md; tasks/style_lint_normalize.md; tasks/forms_content_controls.md; tasks/captions_crossrefs.md; tasks/redaction_anonymization.md; tasks/clean_tracked_changes.md; tasks/compare_diff.md; tasks/templates_style_packs.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## graphify
- Category: research/investigation
- Purpose: Use for any question about a codebase, its architecture, file relationships, or project content — especially when graphify-out/ exists, where the question should be treated as a graphify query first. Turns any input (code, docs, papers, images, videos) into a persistent knowledge graph with god nodes, community detection, and query/path/explain tools.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=795; sha256=e1150326f0ed06db45e735ecb92b9d3048c9d165d61f61c5ecc728758a9c21f2
- Triggers: Use for any question about a codebase, its architecture, file relationships, or project content — especially when graphify-out/ exists, where the question should be treated as a graphify query first. Turns any input (code, docs, papers, images, videos) into a persistent knowledge graph with god nodes, community detection, and query/path/explain tools.
- Prerequisites/evidence: Step 1 - Ensure graphify is installed; Detect the correct Python interpreter (handles uv tool, pipx, venv, system installs); 1. uv tool installs — most reliable on modern Mac/Linux; 2. Read shebang from graphify binary (pipx and direct pip installs); Write interpreter path for all subsequent steps (persists across invocations); on PowerShell hosts without console-encoding drift (#2528).; Guard BEFORE any write: an empty extraction must not clobber a good graph.json /
- Dependencies/references: references/github-and-merge.md; references/transcribe.md; references/extraction-spec.md; references/exports.md; references/update.md; references/query.md; references/add-watch.md; references/hooks.md
- Approval/safety gates: What You Must Do When Invoked; _origin when present and otherwise guesses from the SHAPE of; semantic side must say so explicitly.; Guard BEFORE any write: an empty extraction must not clobber a good graph.json /; nothing) when the new graph is smaller than the existing graph.json. Only write; GRAPH_REPORT.md + the analysis sidecar when the graph was actually written, so; Step 4.5 - Graph health check (read-only integrity gate); if it still refuses, surface the guard message - do not force past it.; a detected file whose chunk failed or was omitted must stay unstamped so the; (cli._stamped_manifest_files + clear_semantic + scan_corpus); do not stamp the; types are gated on output.
- Verification evidence: Part C - Merge AST + semantic into final extraction; GRAPH_REPORT.md / analysis sidecar. Check immediately after build (#1392).; Step 4.5 - Graph health check (read-only integrity gate)
- Artifacts mentioned: GRAPH_REPORT.md; index.md; graphify-out/graph.json; references/github-and-merge.md; graphify-out/.graphify_detect.json; references/transcribe.md; graphify-out/.graphify_ast.json; .graphify_semantic.json; graphify-out/.graphify_semantic.json; references/extraction-spec.md; SKILL.md; .graphify_cached.json; graphify-out/.graphify_cached.json; .codex/config.toml; graphify-out/.graphify_chunk_NN.json; graphify-out/.graphify_semantic_new.json; .graphify_semantic_new.json; graphify-out/.graphify_extract.json; graph.json; graphify-out/GRAPH_REPORT.md; graphify-out/.graphify_analysis.json; graphify-out/.graphify_labels.json; references/exports.md; .graphify_labels.json; graphify-out/cost.json; graph.html; references/update.md; references/query.md; references/add-watch.md; CLAUDE.md
- Lifecycle situations: during development

## imagegen
- Category: specialized or usually unrelated
- Purpose: Generate or edit raster images when the task benefits from AI-created bitmap visuals such as photos, illustrations, textures, sprites, mockups, or transparent-background cutouts. Use when Codex should create a brand-new image, transform an existing image, or derive visual variants from references, and the output should be a bitmap asset rather than repo-native code or vector. Do not use when the task is better handled by editing existing SVG/vector/code-native assets, extending an established icon or logo system, or building the visual directly in HTML/CSS/canvas.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=316; sha256=706d4d96e1d5c9e6023fe3ccabba1bb34b364024d344fd25b8515ec7d28fe3c4
- Triggers: Generate or edit raster images when the task benefits from AI-created bitmap visuals such as photos, illustrations, textures, sprites, mockups, or transparent-background cutouts. Use when Codex should create a brand-new image, transform an existing image, or derive visual variants from references, and the output should be a bitmap asset rather than repo-native code or vector. Do not use when the task is better handled by editing existing SVG/vector/code-native assets, extending an established icon or logo system, or building the visual directly in HTML/CSS/canvas.
- Prerequisites/evidence:
- Dependencies/references: references/prompting.md; references/sample-prompts.md; references/cli.md; references/image-api.md; references/codex-network.md
- Approval/safety gates: When to use; When not to use
- Verification evidence:
- Artifacts mentioned: hero-v2.png; item-icon-edited.png; references/prompting.md; references/sample-prompts.md; references/cli.md; references/image-api.md; references/codex-network.md
- Lifecycle situations: during development

## mattpocock-skills:code-review
- Category: core app-development
- Purpose: Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes: Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/spec asked for?). Runs both reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to \"review since X\".
- Source: catalog://reviewed-skill
- Status: reviewed; lines=90; sha256=9e6d1b00c31e10a002ac3e5fb49014c9589166f668c62996e80a36d23ca21e70
- Triggers: Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes: Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/spec asked for?). Runs both reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to \"review since X\".
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: 5. Aggregate
- Verification evidence:
- Artifacts mentioned: CODING_STANDARDS.md; CONTRIBUTING.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## mattpocock-skills:codebase-design
- Category: core app-development
- Purpose: Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=115; sha256=362b0bec828219d9f4b08ca7c466164e67253bdd817359258e60d2e9c5692a8f
- Triggers: Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Designing for testability
- Artifacts mentioned: DEEPENING.md; DESIGN-IT-TWICE.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:diagnosing-bugs
- Category: core app-development
- Purpose: Diagnosis loop for hard bugs and performance regressions. Use when the user says "diagnose"/"debug this", or reports something broken/throwing/failing/slow.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=139; sha256=aa87b0ac245c6d1b203c4678eb34dc101af02291448780c55c5e58ccc1619bd7
- Triggers: Diagnosis loop for hard bugs and performance regressions. Use when the user says "diagnose"/"debug this", or reports something broken/throwing/failing/slow.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When you genuinely cannot build a loop
- Verification evidence: Diagnosing Bugs; Completion criterion: a tight loop that goes red; Phase 5: Fix + regression test
- Artifacts mentioned: GLOSSARY.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## mattpocock-skills:domain-modeling
- Category: core app-development
- Purpose: Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLOSSARY.md, or recording or editing an ADR.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=75; sha256=b62d997256cc073e123d4303da8e9db00db0e28de9739660ca3e55ab76e09cdb
- Triggers: Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLOSSARY.md, or recording or editing an ADR.
- Prerequisites/evidence:
- Dependencies/references: ./GLOSSARY-FORMAT.md; ./ADR-FORMAT.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: GLOSSARY.md; 0001-event-sourced-orders.md; 0002-postgres-for-write-model.md; GLOSSARY-MAP.md; GLOSSARY-FORMAT.md; ./GLOSSARY-FORMAT.md; ADR-FORMAT.md; ./ADR-FORMAT.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:grilling
- Category: core app-development
- Purpose: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=31; sha256=26d225ea8a36f4acacbe267e789cfb97d73964412f4243dd4b65b6cb806ddebc
- Triggers: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:pr
- Category: core app-development
- Purpose: Use when writing a PR body.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=171; sha256=57658baca2e50e9cf98fdb6b74a51f2afd34b71019d516f7c5d45a51a28354b0
- Triggers: Use when writing a PR body.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: github.com/humanlayer/skills/blob/main/plugins/show-me/skills/show-me/SKILL.md; GLOSSARY.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:prototype
- Category: core app-development
- Purpose: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=27; sha256=f74ae01f4fc454d3a4ef21271920f1706e626271e715dda0559e489f45c792c3
- Triggers: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: LOGIC.md; UI.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:research
- Category: core app-development
- Purpose: Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated to a background agent.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=13; sha256=524b404b1ca373a8b00f63a64667ec4b0a61c3c9cf4e8f246e639be859bb6979
- Triggers: Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated to a background agent.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:tdd
- Category: core app-development
- Purpose: Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=39; sha256=969583080caf842ae86a53501a0091eced13fd89cad65d3aa75c09112318ff33
- Triggers: Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Test-Driven Development; What a good test is; Seams: where tests go
- Artifacts mentioned: GLOSSARY.md; tests.md; mocking.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:wizard
- Category: core app-development
- Purpose: Generate an interactive bash wizard that walks a human through steps only they can perform. Use when provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover. Don't invoke this for steps the agent can perform itself.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=45; sha256=dbefb750eae07d9f8b05ab1084f6acfdda2752df2a6b577c46a505e2bc790164
- Triggers: Generate an interactive bash wizard that walks a human through steps only they can perform. Use when provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover. Don't invoke this for steps the agent can perform itself.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: 4. Verify and hand off
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## mattpocock-skills:writing-for-agents
- Category: core app-development
- Purpose: Writing documents for agents. Use when creating or editing skills, or modifying AGENTS.md or CLAUDE.md.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=82; sha256=1c0c4ebf2d221917591144f0ced4fe46dae13301cb3d6d93fc88ecf0dda6aed2
- Triggers: Writing documents for agents. Use when creating or editing skills, or modifying AGENTS.md or CLAUDE.md.
- Prerequisites/evidence: Context pointers
- Dependencies/references:
- Approval/safety gates: When to split
- Verification evidence: Steps and completion criteria
- Artifacts mentioned: AGENTS.md; CLAUDE.md; SKILL-MECHANICS.md; package.json
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## notebooklm
- Category: research/investigation
- Purpose: Install, authenticate, troubleshoot, and operate Gemini Notebook through the notebooklm-py CLI or typed async Python API. Use for notebook and source management, grounded chat and research, and artifact generation or download when the user mentions Gemini Notebook, notebooklm-py, the notebooklm CLI, or its Python API. Do not use for the generic Gemini API or unrelated content creation.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=316; sha256=2fbd8f43466b6cad1e8435739b71247b77ac450aab0bcc98e1b15b19bf208a11
- Triggers: Install, authenticate, troubleshoot, and operate Gemini Notebook through the notebooklm-py CLI or typed async Python API. Use for notebook and source management, grounded chat and research, and artifact generation or download when the user mentions Gemini Notebook, notebooklm-py, the notebooklm CLI, or its Python API. Do not use for the generic Gemini API or unrelated content creation.
- Prerequisites/evidence: Setup and Authentication; Skill Installation
- Dependencies/references:
- Approval/safety gates: Authorization Boundaries
- Verification evidence:
- Artifacts mentioned: master_token.json; storage_state.json; .notebooklm/profiles/default/master_token.json; github.com/teng-lin/notebooklm-py/blob/main/docs/installation.md; github.com/teng-lin/notebooklm-py/blob/main/docs/cli-reference.md; github.com/teng-lin/notebooklm-py/blob/main/docs/python-api.md
- Lifecycle situations: during development

## nvidia:nvidia-skill-finder
- Category: specialized or usually unrelated
- Purpose: >-
- Source: catalog://reviewed-skill
- Status: reviewed; lines=180; sha256=51fe4ff117f34919527ad4540513910e16eb225f7ad04686fbbe985035fdf9cf
- Triggers: >-
- Prerequisites/evidence: Implicit Invocation Constraints
- Dependencies/references: references/taxonomy-routing.md
- Approval/safety gates: When to Use this Skill; When Not to Use this Skill; When No Skills are Found
- Verification evidence:
- Artifacts mentioned: references/taxonomy-routing.md; raw.githubusercontent.com/NVIDIA/skills/main/skills.sh.json
- Lifecycle situations: during development

## openai-docs
- Category: specialized or usually unrelated
- Purpose: Use for Codex models/pricing, scheduled tasks, skills, settings, setup, troubleshooting, customization, automations, and self-knowledge—including 'you,' 'your,' 'this app,' or 'this coding agent' when they refer to Codex—and for OpenAI APIs/products and ChatGPT Work. Also use for model choice/migration, prompting, SDKs, Responses, Realtime, agents, evals, and Chat/Work/Codex comparisons. Do not use for generic app/software tasks that merely mention Codex.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=39; sha256=8ce8021101bcea594ff92ee6cfd8ca7641a49ee66d7bc6070555f1a33fc239d9
- Triggers: Use for Codex models/pricing, scheduled tasks, skills, settings, setup, troubleshooting, customization, automations, and self-knowledge—including 'you,' 'your,' 'this app,' or 'this coding agent' when they refer to Codex—and for OpenAI APIs/products and ChatGPT Work. Also use for model choice/migration, prompting, SDKs, Responses, Realtime, agents, evals, and Chat/Work/Codex comparisons. Do not use for generic app/software tasks that merely mention Codex.
- Prerequisites/evidence:
- Dependencies/references: references/mcp-diagnostics.md; references/model-migration.md; references/model-selection.md; references/official-docs.md; references/codex-self-knowledge.md; references/latest-model.md; references/upgrading-to-gpt-6-astra.md; references/prompting-guide.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: references/mcp-diagnostics.md; model-migration.md; references/model-migration.md; model-selection.md; references/model-selection.md; official-docs.md; references/official-docs.md; codex-self-knowledge.md; references/codex-self-knowledge.md; references/latest-model.md; references/upgrading-to-gpt-6-astra.md; references/prompting-guide.md
- Lifecycle situations: during development

## pages:maintain-space
- Category: documentation/productivity
- Purpose: Reconcile new evidence into existing ChatGPT Pages or a Space when the user requests upkeep. For a direct text correction, use write-page. Do not use for ordinary chat drafts, writing, or advice, or treat a selected Page as a request to save. Schedule future upkeep only when requested.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=50; sha256=53570e6cb8663d370dce15ed0d67208876c3b13015832c352daa759213e7378e
- Triggers: Reconcile new evidence into existing ChatGPT Pages or a Space when the user requests upkeep. For a direct text correction, use write-page. Do not use for ordinary chat drafts, writing, or advice, or treat a selected Page as a request to save. Schedule future upkeep only when requested.
- Prerequisites/evidence:
- Dependencies/references: ../write-page/references/edit-requests.md; ../write-page/references/page-content.md; ../organize-space/SKILL.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../write-page/references/edit-requests.md; ../write-page/references/page-content.md; ../organize-space/SKILL.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## pages:manage-schedules
- Category: documentation/productivity
- Purpose: Review a ChatGPT Space page and its schedules, recommend useful recurring work, and create, update, or remove scheduled automations.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=95; sha256=e0a464a83f15a6e896c5536cab775f667ebd0dd61eb64fe3c877a41935d64bd9
- Triggers: Review a ChatGPT Space page and its schedules, recommend useful recurring work, and create, update, or remove scheduled automations.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## pages:organize-space
- Category: documentation/productivity
- Purpose: Organize existing ChatGPT Pages and Space structure when the user requests changes to that structure. Do not use for ordinary chat drafts or advice; a selected Page alone does not authorize reorganization. A narrow text edit does not need this workflow.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=52; sha256=fe553fb15809c972ae528d64917489e958f8cbf9432629caa79fd6da6b207da4
- Triggers: Organize existing ChatGPT Pages and Space structure when the user requests changes to that structure. Do not use for ordinary chat drafts or advice; a selected Page alone does not authorize reorganization. A narrow text edit does not need this workflow.
- Prerequisites/evidence:
- Dependencies/references: ../write-page/references/page-content.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../write-page/references/page-content.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## pages:write-page
- Category: documentation/productivity
- Purpose: Create or edit requested Page/Space content, or use for prose you have already decided to save as a standalone Markdown file, only if the user did not explicitly request a Markdown file. Honor established formats, destinations, and repository documentation. A selected Page alone does not authorize a write.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=77; sha256=7b557f210d68d29ee5d1e979c431efd86b50970a55bed0c3a862741feecebdab
- Triggers: Create or edit requested Page/Space content, or use for prose you have already decided to save as a standalone Markdown file, only if the user did not explicitly request a Markdown file. Honor established formats, destinations, and repository documentation. A selected Page alone does not authorize a write.
- Prerequisites/evidence:
- Dependencies/references: references/edit-requests.md; references/page-content.md
- Approval/safety gates:
- Verification evidence: Apply and verify
- Artifacts mentioned: references/edit-requests.md; writing_quality.md; references/page-content.md; SKILL.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## pdf:pdf
- Category: documentation/productivity
- Purpose: Read, create, inspect, render, and verify PDF files where visual layout matters, including fillable AcroForms. Use Poppler rendering plus Python tools such as reportlab, pdfplumber, and pypdf for generation and extraction.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=170; sha256=5e14b4b8f944dc5e678ee703dfacf583010431d64d5d829902c5b2541f736c89
- Triggers: Read, create, inspect, render, and verify PDF files where visual layout matters, including fillable AcroForms. Use Poppler rendering plus Python tools such as reportlab, pdfplumber, and pypdf for generation and extraction.
- Prerequisites/evidence: Tools + Contract Requirements
- Dependencies/references:
- Approval/safety gates: When To Use
- Verification evidence: Final Checks; Final response; Final Response Citations
- Artifacts mentioned: absolute/path/review.pdf
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## plugin-management:plugin-management
- Category: documentation/productivity
- Purpose: Discover and suggest relevant plugins, inspect app permissions and dependencies, and manage plugin connections or removal. Use when the user asks about plugins or when a task would materially benefit from an external app, account, service, or data source that available tools cannot access.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=59; sha256=653841cc21205269f08b0ce135891e1518dac616a766bcfb0b57d788d3f68b10
- Triggers: Discover and suggest relevant plugins, inspect app permissions and dependencies, and manage plugin connections or removal. Use when the user asks about plugins or when a task would materially benefit from an external app, account, service, or data source that available tools cannot access.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## presentations:presentations
- Category: documentation/productivity
- Purpose: Read, create or edit Spaces presentations, PowerPoint files, or Google Slides decks. Use for presentation, slide deck, PowerPoint, PPT, PPTX, or Google Slides requests.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=290; sha256=4afb86b2893225ecce1f4cf8b0d8cde5d7b7538b011ffe8536fbfbdbb6c1e1dd
- Triggers: Read, create or edit Spaces presentations, PowerPoint files, or Google Slides decks. Use for presentation, slide deck, PowerPoint, PPT, PPTX, or Google Slides requests.
- Prerequisites/evidence: Requirements
- Dependencies/references: references/template_following.md; references/artifact-template-selection.md; references/artifact_sessions.md; references/implementation.md; references/cover_art_direction.md; references/native_evidence.md; references/native_bullets.md; references/finalization.md
- Approval/safety gates:
- Verification evidence: Review and handoff; Final response; Final Response Citations
- Artifacts mentioned: references/template_following.md; style_guidelines.md; routing/google_slides.md; references/artifact-template-selection.md; references/artifact_sessions.md; references/implementation.md; artifact_tool_docs/API_QUICK_START.md; references/cover_art_direction.md; references/native_evidence.md; references/native_bullets.md; domain_guidance/finance.md; artifact_tool_docs/api/API_DOCS.md; references/finalization.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## product-design:audit
- Category: frontend/UI
- Purpose: Audit or critique a product flow, journey, workflow, funnel, onboarding path, checkout path, settings path, screen, or multi-step product experience by capturing screenshots first, then reporting UX, design, and accessibility findings from that evidence. Default to an inline report; use a canvas for a visual walkthrough when requested or clearly implied by the ongoing task. Use when the user asks to audit, review, critique, inspect, assess, analyze, evaluate, or give feedback on a product experience.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=166; sha256=087f798c3fe02e91b4cca18cc0f42c358a4dc2c02ccf37a348b476fb19b64aa3
- Triggers: Audit or critique a product flow, journey, workflow, funnel, onboarding path, checkout path, settings path, screen, or multi-step product experience by capturing screenshots first, then reporting UX, design, and accessibility findings from that evidence. Default to an inline report; use a canvas for a visual walkthrough when requested or clearly implied by the ongoing task. Use when the user asks to audit, review, critique, inspect, assess, analyze, evaluate, or give feedback on a product experience.
- Prerequisites/evidence: User Context
- Dependencies/references: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; references/design-audit-framework.md
- Approval/safety gates:
- Verification evidence: Audit; Capture And Audit The Flow; Final Response
- Artifacts mentioned: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; references/design-audit-framework.md; 01-start.png; 02-form-filled.png; 03-confirmation.png
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## product-design:ideate
- Category: frontend/UI
- Purpose: Generate image-based alternatives, remixes, or new design directions from a Product Design brief. Use when the user asks for design variants, visual exploration, remixes, or image-generated approaches from provided context.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=192; sha256=649e8782ca93d5aece712964fae5be2b111cc3143577e1507b98df7f9d8e6bde
- Triggers: Generate image-based alternatives, remixes, or new design directions from a Product Design brief. Use when the user asks for design variants, visual exploration, remixes, or image-generated approaches from provided context.
- Prerequisites/evidence: User Context
- Dependencies/references: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## product-design:image-to-code
- Category: frontend/UI
- Purpose: Implement a selected image, screenshot, mockup, or Image Gen reference as a faithful, responsive frontend.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=137; sha256=694b4102bc339e3038173f8063d83a19e08d2a2cfab1f2e478d6412870a61ff0
- Triggers: Implement a selected image, screenshot, mockup, or Image Gen reference as a faithful, responsive frontend.
- Prerequisites/evidence: User Context
- Dependencies/references: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; ../../references/local-prototype-preflight.md; ../design-qa/SKILL.md
- Approval/safety gates:
- Verification evidence: [IMPORTANT] Previewing prototypes in ChatGPT Work Mode
- Artifacts mentioned: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; ../../references/local-prototype-preflight.md; AGENTS.md; ../design-qa/SKILL.md; design-qa.md; critical-overrides.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## product-design:index
- Category: frontend/UI
- Purpose: Use when Product Design is explicitly invoked, or when the user's main goal is to explore a design, research UX, audit or critique a flow, faithfully clone a visual source, check a built design, or share a prototype. Do not use Product Design for ordinary implementation unless the user explicitly asks for it.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=152; sha256=8e9916d9e5dc3b6a394bedcaa38cd9c8833a1f3b0c4538b75647cf9f62f779fc
- Triggers: Use when Product Design is explicitly invoked, or when the user's main goal is to explore a design, research UX, audit or critique a flow, faithfully clone a visual source, check a built design, or share a prototype. Do not use Product Design for ordinary implementation unless the user explicitly asks for it.
- Prerequisites/evidence: User Context; $user-context; $get-context
- Dependencies/references: ../../references/communication-protocol.md; ../../references/critical-overrides.md; ../user-context/SKILL.md
- Approval/safety gates:
- Verification evidence: $audit; $design-qa
- Artifacts mentioned: ../../references/communication-protocol.md; ../../references/critical-overrides.md; ../user-context/SKILL.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## product-design:url-to-code
- Category: frontend/UI
- Purpose: Clone a live URL as a runnable frontend-only local app.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=145; sha256=2624d0e2ec5f14ba2a4bf74fe05aaa23520b4fb76ca57973c9dadd54fd4b09d2
- Triggers: Clone a live URL as a runnable frontend-only local app.
- Prerequisites/evidence: User Context
- Dependencies/references: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; ../../references/local-prototype-preflight.md; ../design-qa/SKILL.md
- Approval/safety gates:
- Verification evidence: Previewing prototypes in ChatGPT Work Mode
- Artifacts mentioned: ../index/SKILL.md; ../../references/critical-overrides.md; ../user-context/SKILL.md; ../../references/local-prototype-preflight.md; ../design-qa/SKILL.md; design-qa.md; critical-overrides.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## reverse-engineer-anything
- Category: specialized or usually unrelated
- Purpose: Reverse engineer native, managed, Electron/JavaScript, packaged, firmware, and browser targets with REA. Use shipped-artifact or requested runtime evidence to explain features, compare versions, decompile code, or guide a reconstruction. Skip REA for ordinary source-repository architecture analysis.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=357; sha256=fbcd39d6abe803cf7aa49c1880815bc8e22ba2af87a23681944f687bb7629eb1
- Triggers: Reverse engineer native, managed, Electron/JavaScript, packaged, firmware, and browser targets with REA. Use shipped-artifact or requested runtime evidence to explain features, compare versions, decompile code, or guide a reconstruction. Skip REA for ordinary source-repository architecture analysis.
- Prerequisites/evidence:
- Dependencies/references: references/connection-and-recovery.md; references/native-and-artifacts.md; references/runtime-observation.md; references/javascript-applications.md; references/android-applications.md; references/evidence-workflows.md
- Approval/safety gates: Connect only when needed
- Verification evidence:
- Artifacts mentioned: references/connection-and-recovery.md; mcp.json; github.com/morluto/rea/blob/main/docs/firmware-analysis.md; references/native-and-artifacts.md; references/runtime-observation.md; github.com/morluto/rea/blob/main/docs/web-network-captures.md; github.com/morluto/rea/blob/main/docs/packet-captures.md; github.com/morluto/rea/blob/main/docs/pcap-analysis.md; github.com/morluto/rea/blob/main/docs/signal-recordings.md; github.com/morluto/rea/blob/main/docs/wasm-artifacts.md; github.com/morluto/rea/blob/main/docs/evm-bytecode.md; github.com/morluto/rea/blob/main/docs/go-binaries.md; github.com/morluto/rea/blob/main/docs/rust-binaries.md; github.com/morluto/rea/blob/main/docs/sqlite-databases.md; github.com/morluto/rea/blob/main/docs/binary-diagnostics.md; github.com/morluto/rea/blob/main/docs/recorded-crashes.md; github.com/morluto/rea/blob/main/docs/ida-provider.md; github.com/morluto/rea/blob/main/docs/kuna-provider.md; references/javascript-applications.md; references/android-applications.md; references/evidence-workflows.md
- Lifecycle situations: during development

## sites:sites
- Category: frontend/UI
- Purpose: Use Sites when the user wants a website built for them (including a landing page, portfolio, dashboard, portal, tracker, hub, game, event registration, or tool), requests changes to a website already built with Sites, wants to publish a website with Sites, or wants to manage Sites hosting.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=159; sha256=00750ea5ca37e2b49afd2a57fee2149d22ee4f48af40bc094e6d2cee3e7bd1ad
- Triggers: Use Sites when the user wants a website built for them (including a landing page, portfolio, dashboard, portal, tracker, hub, game, event registration, or tool), requests changes to a website already built with Sites, wants to publish a website with Sites, or wants to manage Sites hosting.
- Prerequisites/evidence: Hosting manifest
- Dependencies/references: references/troubleshooting.md; references/app-integrations.md; references/preview/managed.md; references/preview/local.md; references/storage.md; references/site-mcp-server.md; references/design/presentation-led.md; references/identity-and-secrets.md; references/browser-agent-support.md; references/recurring-updates.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: index.html; templates/worker-esm-starter/README.md; references/troubleshooting.md; references/app-integrations.md; references/preview/managed.md; references/preview/local.md; .openai/hosting.json; references/storage.md; references/site-mcp-server.md; references/design/presentation-led.md; references/identity-and-secrets.md; references/browser-agent-support.md; references/recurring-updates.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## sites:sites-remix
- Category: frontend/UI
- Purpose: Remix a Site built with the Sites plugin into a new Site. Use when the user has identified the source Site and asks to remix it.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=52; sha256=34a249750d98e38f676fa391819593ab5c14e5f46f9137832a8c49180d47022d
- Triggers: Remix a Site built with the Sites plugin into a new Site. Use when the user has identified the source Site and asks to remix it.
- Prerequisites/evidence: Implementation requirements; Setup
- Dependencies/references: ../sites/SKILL.md; ../sites/references/storage.md; ../sites/references/identity-and-secrets.md
- Approval/safety gates:
- Verification evidence: Final handoff
- Artifacts mentioned: ../sites/SKILL.md; ../sites/references/storage.md; ../sites/references/identity-and-secrets.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## skill-creator
- Category: specialized or usually unrelated
- Purpose: Create or update a Codex skill with appropriately scoped instructions and any needed supporting resources.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=230; sha256=cccd291077ec57c6f50ca6529f0f3fb93212da09473effb2fcec808e81b21288
- Triggers: Create or update a Codex skill with appropriately scoped instructions and any needed supporting resources.
- Prerequisites/evidence: UI Metadata and Invocation Policy
- Dependencies/references: references/schema.md; references/policies.md; references/api_docs.md; references/openai_yaml.md; references/aws.md; references/redlining.md; references/ooxml.md
- Approval/safety gates:
- Verification evidence: Independent Forward-Testing
- Artifacts mentioned: SKILL.md; openai.yaml; references/schema.md; references/policies.md; references/api_docs.md; assets/logo.png; assets/slides.pptx; agents/openai.yaml; references/openai_yaml.md; README.md; aws.md; gcp.md; azure.md; references/aws.md; references/redlining.md; references/ooxml.md
- Lifecycle situations: during development

## skill-installer
- Category: specialized or usually unrelated
- Purpose: Install Codex skills into $CODEX_HOME/skills from a curated list or a GitHub repo path. Use when a user asks to list installable skills, install a curated skill, or install a skill from another repo (including private repos).
- Source: catalog://reviewed-skill
- Status: reviewed; lines=59; sha256=2892d8b2fb11631132118f340aed80ae17e59d5a571fc2c4f4a4a7e73f139d52
- Triggers: Install Codex skills into $CODEX_HOME/skills from a curated list or a GitHub repo path. Use when a user asks to list installable skills, install a curated skill, or install a skill from another repo (including private repos).
- Prerequisites/evidence: Skill Installer
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development

## spreadsheets:excel-live-control
- Category: documentation/productivity
- Purpose: Control an open or active Microsoft Excel workbook through the ChatGPT add-in or connected session. Use when the user tags the Microsoft Excel app in Codex or follows up on an established live Excel task. Do not use for standalone spreadsheet files or Google Sheets.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=513; sha256=55335802aeb641f8819f0020d4fa172b069376aaa00ab7934f3426d8a121509a
- Triggers: Control an open or active Microsoft Excel workbook through the ChatGPT add-in or connected session. Use when the user tags the Microsoft Excel app in Codex or follows up on an established live Excel task. Do not use for standalone spreadsheet files or Google Sheets.
- Prerequisites/evidence: Setup State Machine; 2. Determine Whether The ChatGPT Add-in Is Installed; Citation Requirements
- Dependencies/references: references/image-references.md; references/read_only_qna.md
- Approval/safety gates: Exact User Guidance For Incomplete Gates; Office.js Gate
- Verification evidence: 4. Verify ChatGPT Sign-in; 5. Verify Connected-Document Tool Availability; 6. Verify Workbook Registration; Live Workbook Quality Checklist; Checks and Audit; Verification Rules; Completion
- Artifacts mentioned: features/charts.md; style_guidelines.md; officejs.md; domain_guidance/financial_models.md; workflows/edit_workflows.md; workflows/create_workflows.md; references/image-references.md; references/read_only_qna.md; domain_guidance/healthcare.md; domain_guidance/marketing_advertising.md; domain_guidance/scientific_research.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## spreadsheets:spreadsheets
- Category: documentation/productivity
- Purpose: Use skill when user requests to create, modify, analyze, visualize, or work with spreadsheet files (`.xlsx`, `.xls`, `.csv`, `.tsv`) or Google Sheets with formulas, formatting, charts, tables, and recalculation. Do not use for live controlling Microsoft Excel app or a live Excel session.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=468; sha256=6d8034aaba4dfb23ce8d1aec92e5bbe6fa1c5079033e2244f4a27445ef867e9b
- Triggers: Use skill when user requests to create, modify, analyze, visualize, or work with spreadsheet files (`.xlsx`, `.xls`, `.csv`, `.tsv`) or Google Sheets with formulas, formatting, charts, tables, and recalculation. Do not use for live controlling Microsoft Excel app or a live Excel session.
- Prerequisites/evidence: Tools + Contract Requirements; Citation Requirements
- Dependencies/references: references/artifact-template-selection.md; references/image-references.md; references/read_only_qna.md
- Approval/safety gates:
- Verification evidence: Checks and Audit; Verification Rules; Completion Criteria; Final response; Final Response Citations
- Artifacts mentioned: routing/google_sheets.md; style_guidelines.md; domain_guidance/financial_models.md; artifact_tool_docs/DATA_TABLES.md; workflows/edit_workflows.md; workflows/create_workflows.md; artifact_tool_docs/API_QUICK_START.md; references/artifact-template-selection.md; references/image-references.md; references/read_only_qna.md; features/charts.md; domain_guidance/healthcare.md; domain_guidance/marketing_advertising.md; domain_guidance/scientific_research.md; output.xlsx; abs/path/book.xlsx
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## supabase:supabase
- Category: backend/data
- Purpose: Use when doing ANY task involving Supabase. Triggers: Supabase products (Database, Auth, Edge Functions, Realtime, Storage, Vectors, Cron, Queues); client libraries and SSR integrations (supabase-js, @supabase/ssr) in Next.js, React, SvelteKit, Astro, Remix; auth issues (login, logout, sessions, JWT, cookies, getSession, getUser, getClaims, RLS); Supabase CLI or MCP server; schema changes, migrations, security audits, Postgres extensions (pg_graphql, pg_cron, pg_vector).
- Source: catalog://reviewed-skill
- Status: reviewed; lines=136; sha256=1171386737b231610fa42485707272765c3516a9bbc0bd2c6c161a8cee3d7d33
- Triggers: Use when doing ANY task involving Supabase. Triggers: Supabase products (Database, Auth, Edge Functions, Realtime, Storage, Vectors, Cron, Queues); client libraries and SSR integrations (supabase-js, @supabase/ssr) in Next.js, React, SvelteKit, Astro, Remix; auth issues (login, logout, sessions, JWT, cookies, getSession, getUser, getClaims, RLS); Supabase CLI or MCP server; schema changes, migrations, security audits, Postgres extensions (pg_graphql, pg_cron, pg_vector).
- Prerequisites/evidence:
- Dependencies/references: references/skill-feedback.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: config.toml; supabase.com/changelog.md; supabase.com/docs/guides/api/securing-your-api.md; supabase.com/docs/guides/security/npm-security.md; supabase.com/docs/guides/security/product-security.md; .mcp.json; references/skill-feedback.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## supabase:supabase-postgres-best-practices
- Category: backend/data
- Purpose: Postgres performance optimization and best practices from Supabase. Use this skill when writing, reviewing, or optimizing Postgres queries, schema designs, or database configurations.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=65; sha256=ccd6e4596bd51cf344fe76c464867c541ccc16b6d90ae7a9db449fb17588613b
- Triggers: Postgres performance optimization and best practices from Supabase. Use this skill when writing, reviewing, or optimizing Postgres queries, schema designs, or database configurations.
- Prerequisites/evidence:
- Dependencies/references: references/query-missing-indexes.md; references/query-partial-indexes.md; references/_sections.md
- Approval/safety gates: When to Apply
- Verification evidence:
- Artifacts mentioned: references/query-missing-indexes.md; references/query-partial-indexes.md; references/_sections.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:brainstorming
- Category: core app-development
- Purpose: You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior, or planning anything new, in software or out of it (a talk, a business, a renovation).
- Source: catalog://reviewed-skill
- Status: reviewed; lines=295; sha256=61a7ef918652108c76a3fd01e02dd92d39996c6b46d4cb2819cbd03f6c45e46a
- Triggers: You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior, or planning anything new, in software or out of it (a talk, a business, a renovation).
- Prerequisites/evidence: Look Before You Ask
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: -design.md; builder-check-prompt.md; visual-companion.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:diagnosing-superpowers
- Category: core app-development
- Purpose: Use when a superpowers session went wrong and your human partner wants to know why — repeated work, ignored plans, stumbles, poor results, a skill that didn't fire, "it took too long", "why is it so expensive", "what is it doing" — or wants to build a bug report for the superpowers maintainers, for the current session or a past one identified by id or path, on any harness.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=121; sha256=3143de8695c5a2d63e8b1675f33837578076f464deb127c2ebdd0b46fceef886
- Triggers: Use when a superpowers session went wrong and your human partner wants to know why — repeated work, ignored plans, stumbles, poor results, a skill that didn't fire, "it took too long", "why is it so expensive", "what is it doing" — or wants to build a bug report for the superpowers maintainers, for the current session or a past one identified by id or path, on any harness.
- Prerequisites/evidence:
- Dependencies/references: references/session-discovery.md; references/github-issues.md; references/context-safety.md
- Approval/safety gates:
- Verification evidence: Diagnosing Superpowers
- Artifacts mentioned: references/session-discovery.md; templates/case.md; prompts/analyst-common.md; skill-timeline.md; plan-adherence.md; repeated-work.md; stumbles.md; quality-evidence.md; request-conflicts.md; cost-and-time.md; templates/report.md; references/github-issues.md; templates/issue.md; templates/bundle-README.md; prompts/scrub.md; prompts/scrub-audit.md; prompts/similar-session.md; references/context-safety.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:dispatching-parallel-agents
- Category: core app-development
- Purpose: Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies
- Source: catalog://reviewed-skill
- Status: reviewed; lines=168; sha256=1968923066f3b707eb01d1992cdf4c42284c3855f70253b9cd5000ff45fca13c
- Triggers: Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Use; When NOT to Use
- Verification evidence: 4. Review and Integrate; Verification
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:executing-plans
- Category: core app-development
- Purpose: Use when executing an implementation plan in the current session as the implementer yourself — your human partner chose inline execution, or no subagent tool is available
- Source: catalog://reviewed-skill
- Status: reviewed; lines=322; sha256=e4649e59880ef2643d1da128e3d607e87e3f969410d72095a5bf65811b6036dc
- Triggers: Use when executing an implementation plan in the current session as the implementer yourself — your human partner chose inline execution, or no subagent tool is available
- Prerequisites/evidence: Setup
- Dependencies/references: ../requesting-code-review/code-reviewer.md
- Approval/safety gates: When to Use
- Verification evidence: 3. The completion contract; Final Review
- Artifacts mentioned: progress.md; code-reviewer.md; ../requesting-code-review/code-reviewer.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:finishing-a-development-branch
- Category: core app-development
- Purpose: Use when implementation is complete, all tests pass, and you need to decide how to integrate the work
- Source: catalog://reviewed-skill
- Status: reviewed; lines=226; sha256=8db5a922b242dd4e1bf824cb91c13b3e8d8e8a86d6ceaf7f0774eb9cce909d65
- Triggers: Use when implementation is complete, all tests pass, and you need to decide how to integrate the work
- Prerequisites/evidence: before cleanup (Step 6) needs this value; Merge first — verify success before removing anything
- Dependencies/references:
- Approval/safety gates: Get main repo root for CWD safety
- Verification evidence: Step 1: Verify Tests; Merge first — verify success before removing anything; Verify tests on merged result
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:receiving-code-review
- Category: core app-development
- Purpose: Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation
- Source: catalog://reviewed-skill
- Status: reviewed; lines=206; sha256=091df1629510af1b92fc4abd6f96732ebedb4cb2c0f3457e8f2740b0504a2438
- Triggers: Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When To Push Back
- Verification evidence: Code Review Reception; From External Reviewers; YAGNI Check for "Professional" Features
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:requesting-code-review
- Category: core app-development
- Purpose: Use when completing tasks, implementing major features, or before merging to verify work meets requirements
- Source: catalog://reviewed-skill
- Status: reviewed; lines=96; sha256=2180e14a448e9410bec88e6646a2d1f0ce7fdd58de27388c1e052e929679d2bc
- Triggers: Use when completing tasks, implementing major features, or before merging to verify work meets requirements
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Request Review
- Verification evidence: Requesting Code Review; When to Request Review
- Artifacts mentioned: code-reviewer.md; docs/superpowers/plans/deployment-plan.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:subagent-driven-development
- Category: core app-development
- Purpose: Use when executing implementation plans with independent tasks in the current session
- Source: catalog://reviewed-skill
- Status: reviewed; lines=337; sha256=ba41f697136cba88a7962d60c8e2f97488ba04a8688b1d0fbeb27f6953808e75
- Triggers: Use when executing implementation plans with independent tasks in the current session
- Prerequisites/evidence: Setup
- Dependencies/references: ./implementer-prompt.md; ./task-reviewer-prompt.md; references/fix-loop.md; references/final-review.md; references/resuming.md; references/preflight.md; references/batching.md; references/handling-reports.md; references/cannot-verify.md
- Approval/safety gates: When to Use
- Verification evidence: 3. Review the task; Final Review
- Artifacts mentioned: ./implementer-prompt.md; ./task-reviewer-prompt.md; references/fix-loop.md; references/final-review.md; progress.md; references/resuming.md; references/preflight.md; references/batching.md; task-N-brief.md; task-N-report.md; implementer-prompt.md; references/handling-reports.md; references/cannot-verify.md; task-reviewer-prompt.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:systematic-debugging
- Category: core app-development
- Purpose: Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
- Source: catalog://reviewed-skill
- Status: reviewed; lines=284; sha256=51c6435d98c83c42c96ba7c35725a0b2c376cd487fb1a4e6bd0ddbe7e33ef202
- Triggers: Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Use; Red Flags - STOP and Follow Process; When Process Reveals "No Root Cause"
- Verification evidence: Phase 3: Hypothesis and Testing
- Artifacts mentioned: root-cause-tracing.md; defense-in-depth.md; condition-based-waiting.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:test-driven-development
- Category: core app-development
- Purpose: Use when implementing any feature or bugfix, before writing implementation code
- Source: catalog://reviewed-skill
- Status: reviewed; lines=331; sha256=64b03fce4aee5a97a93160cea8111f3ba13a17b7c001db4bd5836d67fd10705d
- Triggers: Use when implementing any feature or bugfix, before writing implementation code
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Use; Red Flags - STOP and Start Over; When Stuck
- Verification evidence: Test-Driven Development (TDD); RED - Write Failing Test; Verify RED - Watch It Fail; Verify GREEN - Watch It Pass; Good Tests; Verification Checklist; Final Rule
- Artifacts mentioned: writing-good-tests.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:using-git-worktrees
- Category: core app-development
- Purpose: Use when starting feature work that needs isolation from current workspace or before executing implementation plans - ensures an isolated workspace exists via native tools or git worktree fallback
- Source: catalog://reviewed-skill
- Status: reviewed; lines=168; sha256=8cfb86f121269e8f7f12361e6795c4f6738828340e28964c9229d365666c9edd
- Triggers: Use when starting feature work that needs isolation from current workspace or before executing implementation plans - ensures an isolated workspace exists via native tools or git worktree fallback
- Prerequisites/evidence: Step 2: Project Setup
- Dependencies/references:
- Approval/safety gates: Safety Verification (project-local directories only)
- Verification evidence: Safety Verification (project-local directories only); Step 3: Verify Clean Baseline
- Artifacts mentioned: package.json; Cargo.toml; pyproject.toml; package.json/Cargo.toml
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:using-superpowers
- Category: core app-development
- Purpose: Use when starting any conversation - establishes how to find and use skills, requiring skill invocation before ANY response including clarifying questions
- Source: catalog://reviewed-skill
- Status: reviewed; lines=66; sha256=82c5c8866ad7f5dd4440ce66bd7806ba48a2f13771beae5cf112e53f08fe36ba
- Triggers: Use when starting any conversation - establishes how to find and use skills, requiring skill invocation before ANY response including clarifying questions
- Prerequisites/evidence:
- Dependencies/references: references/claude-code-tools.md; references/codex-tools.md; references/pi-tools.md; references/antigravity-tools.md; references/hermes-tools.md; references/muse-tools.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: references/claude-code-tools.md; references/codex-tools.md; references/pi-tools.md; references/antigravity-tools.md; references/hermes-tools.md; references/muse-tools.md; CLAUDE.md; AGENTS.md; GEMINI.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:verification-before-completion
- Category: core app-development
- Purpose: Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
- Source: catalog://reviewed-skill
- Status: reviewed; lines=121; sha256=2befe7fc55bcadaa3d97dd9e8efeb633d2561c0ebe74c5a8b17c4d9e7e4520b3
- Triggers: Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
- Prerequisites/evidence: Verification Before Completion
- Dependencies/references:
- Approval/safety gates: The Gate Function; Red Flags - STOP; When To Apply
- Verification evidence: Verification Before Completion
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day; bug diagnosis; test failure; code review; release preparation

## superpowers:writing-plans
- Category: core app-development
- Purpose: Use when you have a spec or requirements for a multi-step task, before touching code
- Source: catalog://reviewed-skill
- Status: reviewed; lines=205; sha256=a6c67c1900064347c2a329990dd3c555657c51c3ec53b259a08aa01a2c26139a
- Triggers: Use when you have a spec or requirements for a multi-step task, before touching code
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Scope Check; Review Focus; Self-Review
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## superpowers:writing-skills
- Category: core app-development
- Purpose: Use when creating new skills, editing existing skills, or verifying skills work before deployment
- Source: catalog://reviewed-skill
- Status: reviewed; lines=400; sha256=8cb3ac68c6d8c4bb46886b998b09af7989643cab8bd0e46ee86dd62e64546bbe
- Triggers: Use when creating new skills, editing existing skills, or verifying skills work before deployment
- Prerequisites/evidence: Discipline-Enforcing Skills (rules/requirements); Micro-Test Wording Before Full Scenarios; STOP: Before Moving to Next Skill
- Dependencies/references: ../using-superpowers/references/codex-tools.md; ../using-superpowers/references/gemini-tools.md; references/anthropic-best-practices.md; references/discovery.md; references/flowcharts.md; references/bulletproofing.md; references/testing-skills-with-subagents.md
- Approval/safety gates: When to Create a Skill; STOP: Before Moving to Next Skill
- Verification evidence: Testing All Skill Types; Common Rationalizations for Skipping Testing; RED: Write Failing Test (Baseline); Micro-Test Wording Before Full Scenarios; Skill Creation Checklist (TDD Adapted)
- Artifacts mentioned: codex-tools.md; ../using-superpowers/references/codex-tools.md; gemini-tools.md; ../using-superpowers/references/gemini-tools.md; references/anthropic-best-practices.md; SKILL.md; references/discovery.md; references/flowcharts.md; pptxgenjs.md; ooxml.md; references/bulletproofing.md; references/testing-skills-with-subagents.md
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## template-creator:template-creator
- Category: documentation/productivity
- Purpose: Create or update a reusable personal Codex artifact-template skill. Use when the user invokes $template-creator or asks in natural language to create a reusable template from a reference document, presentation, spreadsheet, Google Docs, Slides, or Sheets link, ImageGen or Product Design image, email, Slack message, or Site project, or explicitly asks to edit or update a passed artifact-template skill. Do not use for one-off creation from an existing template.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=207; sha256=244bfef01d3e17c6013952ccf34621a90ddfee9c7828058245c3c46f51114944
- Triggers: Create or update a reusable personal Codex artifact-template skill. Use when the user invokes $template-creator or asks in natural language to create a reusable template from a reference document, presentation, spreadsheet, Google Docs, Slides, or Sheets link, ImageGen or Product Design image, email, Slack message, or Site project, or explicitly asks to edit or update a passed artifact-template skill. Do not use for one-off creation from an existing template.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: preview.png; reference.png; reference.pdf-or-reference.xlsx; SKILL.md; absolute/path/reference.docx; absolute/path/preview.png; absolute/path/reference.png; artifact-template.json; agents/openai.yaml; assets/preview.png; assets/reference.png; absolute/path/updated-reference.docx; absolute/path/updated-preview.png; request.json; .openai/hosting.json; Artifact.md
- Lifecycle situations: during development; documentation; handoff to another developer; end of day

## vercel:access-protected-vercel-deployment
- Category: deployment/operations
- Purpose: Access and test Vercel deployments protected by Vercel Authentication, SSO, or Deployment Protection. Use when curl, agent-browser, Playwright, or another automated request reaches a Vercel login or protection page; when a protected preview or production URL returns 401 or 403; when TRUSTED_SOURCES_ENVIRONMENT_MISMATCH appears; or when choosing between `vercel curl` and the `x-vercel-trusted-oidc-idp-token` header.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=170; sha256=24d295fa893a22b318f19d87fc52865fc0e26fe43abea62ce787769d00a79fc6
- Triggers: Access and test Vercel deployments protected by Vercel Authentication, SSO, or Deployment Protection. Use when curl, agent-browser, Playwright, or another automated request reaches a Vercel login or protection page; when a protected preview or production URL returns 401 or 403; when TRUSTED_SOURCES_ENVIRONMENT_MISMATCH appears; or when choosing between `vercel curl` and the `x-vercel-trusted-oidc-idp-token` header.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Diagnose the response
- Artifacts mentioned: .vercel/project.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:ai-gateway
- Category: deployment/operations
- Purpose: Vercel AI Gateway guidance for setup, model discovery, authentication, routing, fallbacks, virtual models, evaluation models, BYOK, budgets, spend reporting, observability, compatible APIs, and coding-agent configuration. Use when adding AI Gateway to an app, migrating provider calls, choosing models or providers, centralizing model configuration, evaluating application state, debugging gateway requests, or running `vercel ai-gateway` commands.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=294; sha256=f3e5ad702d8eaafb07fb02db81b24d75added47dad1321c90b0f4996cccb41b6
- Triggers: Vercel AI Gateway guidance for setup, model discovery, authentication, routing, fallbacks, virtual models, evaluation models, BYOK, budgets, spend reporting, observability, compatible APIs, and coding-agent configuration. Use when adding AI Gateway to an app, migrating provider calls, choosing models or providers, centralizing model configuration, evaluating application state, debugging gateway requests, or running `vercel ai-gateway` commands.
- Prerequisites/evidence:
- Dependencies/references: references/coding-agents.md; references/setup.md; references/routing.md; references/virtual-models.md; references/evaluation.md; references/spend-observability.md
- Approval/safety gates: Vercel AI Gateway
- Verification evidence: Verification checklist
- Artifacts mentioned: vercel.com/docs/sitemap.md; references/coding-agents.md; references/setup.md; references/routing.md; references/virtual-models.md; references/evaluation.md; references/spend-observability.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:ai-sdk
- Category: deployment/operations
- Purpose: Vercel AI SDK expert guidance. Use when building AI-powered features — chat interfaces, text generation, structured output, tool calling, agents, MCP integration, streaming, embeddings, reranking, image generation, or working with any LLM provider.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=388; sha256=9d6dd182e5e61afc94f7d3867012cfdc19ebbb634e4370e4ed7782919fc1038a
- Triggers: Vercel AI SDK expert guidance. Use when building AI-powered features — chat interfaces, text generation, structured output, tool calling, agents, MCP integration, streaming, embeddings, reranking, image generation, or working with any LLM provider.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: Critical: Do Not Trust Your Own Memory; AI Gateway: The Fastest Way to Start
- Verification evidence: AI Gateway: The Fastest Way to Start
- Artifacts mentioned: package.json; node_modules/ai/package.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:auth
- Category: deployment/operations
- Purpose: Authentication integration guidance — Clerk (native Vercel Marketplace), Better Auth, Descope, and Auth0 setup for Next.js applications, plus Sign in with Vercel, Vercel Passport, and Vercel KMS. Covers server config, route handlers, proxy.ts auth patterns, sign-in/sign-up flows, and Marketplace provisioning. Use when implementing user authentication, sessions, protected routes, or protecting deployments.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=669; sha256=7a1ccb7beecef0959e224fef7de2bcf460e6f58c6685bd3359ec0e6103e063d4
- Triggers: Authentication integration guidance — Clerk (native Vercel Marketplace), Better Auth, Descope, and Auth0 setup for Next.js applications, plus Sign in with Vercel, Vercel Passport, and Vercel KMS. Covers server config, route handlers, proxy.ts auth patterns, sign-in/sign-up flows, and Marketplace provisioning. Use when implementing user authentication, sessions, protected routes, or protecting deployments.
- Prerequisites/evidence: Install via Marketplace; Install Clerk from Vercel Marketplace (auto-provisions env vars); SDK Setup; Install the Clerk Next.js SDK; Provider Setup; Better Auth (Self-Hosted); Install
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: Response.json; jwks.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:bootstrap
- Category: deployment/operations
- Purpose: Project bootstrapping orchestrator for repos that depend on Vercel-linked resources (databases, auth, and managed integrations). Use when setting up or repairing a repository so linking, environment provisioning, env pulls, and first-run db/dev commands happen in the correct safe order.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=234; sha256=2306dbb1343c5acfdf7aedcc5f27751bd73570e2a615e71c873f15f339616d6b
- Triggers: Project bootstrapping orchestrator for repos that depend on Vercel-linked resources (databases, auth, and managed integrations). Use when setting up or repairing a repository so linking, environment provisioning, env pulls, and first-run db/dev commands happen in the correct safe order.
- Prerequisites/evidence: Resource Setup: Postgres; App Setup
- Dependencies/references:
- Approval/safety gates: Preflight
- Verification evidence: Env Verification; Bootstrap Verification
- Artifacts mentioned: package.json; .vercel/project.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:build-agents
- Category: deployment/operations
- Purpose: Default guidance for building AI agents. Use for generic requests to build, create, scaffold, design, architect, or implement an AI agent, agent app, tool-calling agent, durable agent, multi-agent system, or scheduled agent.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=174; sha256=334a5f42b57d7536fae1971191dce34ad47487a17f21cab1cc6709d4119203fb
- Triggers: Default guidance for building AI agents. Use for generic requests to build, create, scaffold, design, architect, or implement an AI agent, agent app, tool-calling agent, durable agent, multi-agent system, or scheduled agent.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: node_modules/eve/docs/README.md; SKILL.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:cdn-caching
- Category: deployment/operations
- Purpose: Debug Vercel CDN caching — cache hit rate, stale content, revalidation behavior, ISR + PPR, per-request cache reasons (cacheReason) and PPR state (ppr_state), and costs.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=292; sha256=10f91d3abe3378046cffeb214871a9bceab3c3a1128015244f99e76fae283a3e
- Triggers: Debug Vercel CDN caching — cache hit rate, stale content, revalidation behavior, ISR + PPR, per-request cache reasons (cacheReason) and PPR state (ppr_state), and costs.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:chat-sdk
- Category: deployment/operations
- Purpose: Vercel Chat SDK expert guidance. Use when building multi-platform chat bots — Slack, Telegram, Microsoft Teams, Discord, Google Chat, GitHub, Linear — with a single codebase. Covers the Chat class, adapters, threads, messages, cards, modals, streaming, state management, and webhook setup.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=203; sha256=65b932858227ff89784636bbdf42e3573397175405397644c37310700ee169b1
- Triggers: Vercel Chat SDK expert guidance. Use when building multi-platform chat bots — Slack, Telegram, Microsoft Teams, Discord, Google Chat, GitHub, Linear — with a single codebase. Covers the Chat class, adapters, threads, messages, cards, modals, streaming, state management, and webhook setup.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: node_modules/chat/resources/templates.json; node_modules/chat/resources/guides/how-to-build-an-ai-agent-for-slack-with-chat-sdk-and-ai-sdk.md; node_modules/chat/resources/guides/human-in-the-loop-with-chat-sdk-and-workflow-sdk.md; node_modules/chat/resources/guides/liveblocks-chat-sdk-ai-sdk.md; node_modules/chat/resources/guides/slack-bot-vercel-blob.md; node_modules/chat/resources/guides/run-and-track-deploys-from-slack.md; node_modules/chat/resources/guides/triage-form-submissions-with-chat-sdk.md; node_modules/chat/resources/guides/how-to-build-a-slack-bot-with-next-js-and-redis.md; node_modules/chat/resources/guides/create-a-discord-support-bot-with-nuxt-and-redis.md; node_modules/chat/resources/guides/ship-a-github-code-review-bot-with-hono-and-redis.md; node_modules/chat/resources/guides/build-a-slack-bot-with-vercel-connect.md; node_modules/chat/resources/guides/vercel-connect.md; node_modules/chat/resources/guides/ai-gateway-and-ai-sdk.md; node_modules/chat/resources/guides/daily-digest-bot-with-chat-sdk-and-workflow-sdk.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:create-a-backend
- Category: backend/data
- Purpose: Backend architecture guidance. Use when planning, building, or migrating an API or backend; choosing between Functions, Services, containers, Workflow, Queues, and Marketplace databases; or selecting a supported backend framework or runtime.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=115; sha256=0ac49fd640ce4928588b1f9be65c17540dcec0b51f3a6d5b5fad3e6e1074ba86
- Triggers: Backend architecture guidance. Use when planning, building, or migrating an API or backend; choosing between Functions, Services, containers, Workflow, Queues, and Marketplace databases; or selecting a supported backend framework or runtime.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## vercel:custom-metrics
- Category: deployment/operations
- Purpose: Emit and query Vercel Custom Metrics. Use when instrumenting application or business measurements in Vercel Functions, using metric() from @vercel/functions, choosing metric names and attributes, or querying emitted values with vc metrics.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=157; sha256=dda9871df28f58001367e6ee923912c3b41d3ed77a4ef665ce0552227760d4f1
- Triggers: Emit and query Vercel Custom Metrics. Use when instrumenting application or business measurements in Vercel Functions, using metric() from @vercel/functions, choosing metric names and attributes, or querying emitted values with vc metrics.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: Response.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:deployments-cicd
- Category: deployment/operations
- Purpose: Vercel deployment and CI/CD expert guidance. Use when deploying, promoting, rolling back, inspecting deployments, building with --prebuilt, or configuring CI workflow files for Vercel.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=363; sha256=61c628114c8703a9dc753ca94ee63f5b3d5cbd70fc5caa2b02d9dfd92ea5fa76
- Triggers: Vercel deployment and CI/CD expert guidance. Use when deploying, promoting, rolling back, inspecting deployments, building with --prebuilt, or configuring CI workflow files for Vercel.
- Prerequisites/evidence: Required Environment Variables
- Dependencies/references: references/deployment-checks.md; references/cli-pipelines.md; references/oidc-federation.md; references/live-status.md
- Approval/safety gates: When to Add a CI Pipeline
- Verification evidence: Preview Deployment; Deploy from project root (creates preview URL); Build locally (uses preview env vars by default); Release Only Tested Builds
- Artifacts mentioned: .gitlab-ci.yml; bitbucket-pipelines.yml; vercel.json; references/deployment-checks.md; .vercel/project.json; references/cli-pipelines.md; references/oidc-federation.md; references/live-status.md; package.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:domains
- Category: deployment/operations
- Purpose: Search, register, connect, transfer, and renew domain names on Vercel using the CLI or Domains Registrar API. Use for domain availability and pricing, custom domains, DNS records, nameservers, ownership verification, and domain orders.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=138; sha256=48d2b24366dae02b0e8bfe989b30127263f99105308687ab541518e96b613e49
- Triggers: Search, register, connect, transfer, and renew domain names on Vercel using the CLI or Domains Registrar API. Use for domain availability and pricing, custom domains, DNS records, nameservers, ownership verification, and domain orders.
- Prerequisites/evidence: Search before asking for credentials
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Connect and diagnose an existing domain
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:env-vars
- Category: deployment/operations
- Purpose: Vercel environment variable expert guidance. Use when working with .env files, vercel env commands, Secret or Config variable types, OIDC tokens, or managing environment-specific configuration.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=313; sha256=081d79b5b046276631c10b3db6ff07dbff4a59c057fc9bbc64aa364f82bb3045
- Triggers: Vercel environment variable expert guidance. Use when working with .env files, vercel env commands, Secret or Config variable types, OIDC tokens, or managing environment-specific configuration.
- Prerequisites/evidence: 3) Verify required keys from .env.example exist in .env.local; Save custom vars before pulling
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Add to production and preview in one command; 3) Verify required keys from .env.example exist in .env.local; Pulled Files Omit Production and Preview Secrets
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:eve
- Category: deployment/operations
- Purpose: eve framework guidance for durable AI agents and agent-powered applications. Use when creating, editing, or debugging an eve project, when the user explicitly asks for eve, or when the build-agents skill has selected eve as the default framework. Covers eve's filesystem-first runtime, durable sessions, tools, skills, connections, channels, sandboxes, subagents, schedules, evals, frontend clients, and Agent Runs observability. Do not use for incidental agent mentions, generic agent-building prompts, or established non-eve stacks unless the user asks for comparison or migration.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=138; sha256=5e8f3f3d79569288918a31381301e55a9a686dc92ec053f10eb5eda93d58d037
- Triggers: eve framework guidance for durable AI agents and agent-powered applications. Use when creating, editing, or debugging an eve project, when the user explicitly asks for eve, or when the build-agents skill has selected eve as the default framework. Covers eve's filesystem-first runtime, durable sessions, tools, skills, connections, channels, sandboxes, subagents, schedules, evals, frontend clients, and Agent Runs observability. Do not use for incidental agent mentions, generic agent-building prompts, or established non-eve stacks unless the user asks for comparison or migration.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: node_modules/eve/docs/README.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:flags-sdk
- Category: deployment/operations
- Purpose: Set up and use feature flags and A/B tests with the Flags SDK (`flags` npm package) and Vercel Flags. Use when installing or configuring the SDK, adding a new or existing flag, wiring `vercelAdapter` (OIDC or SDK keys), declaring flags with `flag()`, using the `vercel flags` CLI (create, inspect, list, enable, disable, set, update, split, rollout, rules, segments, use-targeting, evaluations, versions, open, archive, unarchive, rm, sdk-keys, override, prepare), setting up providers/adapters (Vercel, Statsig, LaunchDarkly, PostHog, GrowthBook, Global Config, OpenFeature, Split, Flagsmith, Reflag, Optimizely, or custom), precompute, `identify`/`dedupe`, Flags Explorer/Toolbar, Next.js or SvelteKit, or encrypting flag values. Triggers: feature flags, feature gates, A/B testing, experimentation, gradual rollout, traffic split, targeting rules, flag overrides, precompute, Flags Explorer, Vercel Flags, vercel flags CLI, `flags/next`, `flags/sveltekit`, `flags/react`, `@flags-sdk/*`.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=527; sha256=2149f8b2ff5ac44022103cd3f36895504bfc436698bd90fa7fe1bcd9b4e99cb4
- Triggers: Set up and use feature flags and A/B tests with the Flags SDK (`flags` npm package) and Vercel Flags. Use when installing or configuring the SDK, adding a new or existing flag, wiring `vercelAdapter` (OIDC or SDK keys), declaring flags with `flag()`, using the `vercel flags` CLI (create, inspect, list, enable, disable, set, update, split, rollout, rules, segments, use-targeting, evaluations, versions, open, archive, unarchive, rm, sdk-keys, override, prepare), setting up providers/adapters (Vercel, Statsig, LaunchDarkly, PostHog, GrowthBook, Global Config, OpenFeature, Split, Flagsmith, Reflag, Optimizely, or custom), precompute, `identify`/`dedupe`, Flags Explorer/Toolbar, Next.js or SvelteKit, or encrypting flag values. Triggers: feature flags, feature gates, A/B testing, experimentation, gradual rollout, traffic split, targeting rules, flag overrides, precompute, Flags Explorer, Vercel Flags, vercel flags CLI, `flags/next`, `flags/sveltekit`, `flags/react`, `@flags-sdk/*`.
- Prerequisites/evidence: Before you start; Flag with evaluation context; Flags Explorer setup
- Dependencies/references: references/nextjs.md; references/providers.md; references/api.md; references/sveltekit.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: pnpm-lock.yaml; package-lock.json; package.json; references/nextjs.md; references/providers.md; references/api.md; references/sveltekit.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:is-agentic
- Category: deployment/operations
- Purpose: Score how ready a website, domain, or public MCP endpoint is for AI agents using Is Agentic, and read or act on the resulting report. Use when asked to check a site's agent readiness, get its Is Agentic score, fetch a scored report as JSON, or fix the issues that lower a site's score.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=72; sha256=de940bb2d220866c0172f133bb58ed1c0687a858a5d024ef219781a6653b4ee4
- Triggers: Score how ready a website, domain, or public MCP endpoint is for AI agents using Is Agentic, and read or act on the resulting report. Use when asked to check a site's agent readiness, get its Is Agentic score, fetch a scored report as JSON, or fix the issues that lower a site's score.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:knowledge-update
- Category: deployment/operations
- Purpose: Corrects outdated LLM knowledge about the Vercel platform and introduces new products. Injected at session start.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=104; sha256=9849b61e6bf847d9dc1f263ea6c7777f4c248ec53c93af43225e15c03f818aad
- Triggers: Corrects outdated LLM knowledge about the Vercel platform and introduces new products. Injected at session start.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: vercel.json; node_modules/eve/docs/README.md; AGENTS.md; CLAUDE.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:marketplace
- Category: deployment/operations
- Purpose: Vercel Marketplace expert guidance — discovering, installing, and managing third-party integrations via the `vercel integration` CLI. Use when building any app that needs an external capability without a dedicated skill — commerce (stores, storefronts, selling products), payments (checkout, subscriptions, billing), observability/monitoring, messaging/email, search, or CMS — or when discovering, installing, or managing integrations.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=127; sha256=580f3cd836488f0c09ff092c498cbdfa04cd15f8404e465ae48845b53294300c
- Triggers: Vercel Marketplace expert guidance — discovering, installing, and managing third-party integrations via the `vercel integration` CLI. Use when building any app that needs an external capability without a dedicated skill — commerce (stores, storefronts, selling products), payments (checkout, subscriptions, billing), observability/monitoring, messaging/email, search, or CMS — or when discovering, installing, or managing integrations.
- Prerequisites/evidence: The sequence — do this BEFORE scaffolding or writing any app code
- Dependencies/references:
- Approval/safety gates: MUST FOLLOW — How to choose which provider to recommend
- Verification evidence:
- Artifacts mentioned: integration.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:microfrontends
- Category: deployment/operations
- Purpose: Guide for building, configuring, and deploying microfrontends on Vercel. Use this skill when the user mentions microfrontends, multi-zones, splitting an app across teams, independent deployments, cross-app routing, incremental migration, composing multiple frontends under one domain, microfrontends.json, @vercel/microfrontends, the microfrontends local proxy, or path-based routing between Vercel projects. Also use when the user asks about shared layouts across projects, navigation between microfrontends, fallback environments, asset prefixes, or feature flag controlled routing.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=81; sha256=9dbe1a3db8bfa3441b1412b019f518e3b6af341564a3e84a7b1d0073af8eba05
- Triggers: Guide for building, configuring, and deploying microfrontends on Vercel. Use this skill when the user mentions microfrontends, multi-zones, splitting an app across teams, independent deployments, cross-app routing, incremental migration, composing multiple frontends under one domain, microfrontends.json, @vercel/microfrontends, the microfrontends local proxy, or path-based routing between Vercel projects. Also use when the user asks about shared layouts across projects, navigation between microfrontends, fallback environments, asset prefixes, or feature flag controlled routing.
- Prerequisites/evidence:
- Dependencies/references: references/configuration.md; references/path-routing.md; references/local-development.md; references/managing-microfrontends.md; references/troubleshooting.md; references/security.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: microfrontends.json; references/configuration.md; references/path-routing.md; references/local-development.md; references/managing-microfrontends.md; references/troubleshooting.md; references/security.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:queues
- Category: backend/data
- Purpose: Vercel Queues guidance — durable topics with at-least-once delivery, independent consumer groups, retries, delays, and idempotency keys via @vercel/queue (JS) or vercel-queue (Python). Use when deferring background work, buffering traffic, fanning out events, or choosing between Queues and Workflows.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=238; sha256=38ad06c8c9785b944ce887a94bdb60511f4f6e8eda3b2fef01cadd5a1b16342b
- Triggers: Vercel Queues guidance — durable topics with at-least-once delivery, independent consumer groups, retries, delays, and idempotency keys via @vercel/queue (JS) or vercel-queue (Python). Use when deferring background work, buffering traffic, fanning out events, or choosing between Queues and Workflows.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: vercel.json; request.json; Response.json
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## vercel:react-best-practices
- Category: deployment/operations
- Purpose: React best-practices reviewer for TSX files. Triggers after editing multiple TSX components to run a condensed quality checklist covering component structure, hooks usage, accessibility, performance, and TypeScript patterns.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=187; sha256=5c1b1512e76413a9706309569c4c88827ed86b00dff9338849bf64caae7d3921
- Triggers: React best-practices reviewer for TSX files. Triggers after editing multiple TSX components to run a condensed quality checklist covering component structure, hooks usage, accessibility, performance, and TypeScript patterns.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Apply
- Verification evidence:
- Artifacts mentioned: rules/async-parallel.md; rules/bundle-barrel-imports.md; AGENTS.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:routing-middleware
- Category: deployment/operations
- Purpose: Vercel Routing Middleware guidance — request interception before cache, rewrites, redirects, personalization. Works with any framework. Supports Edge, Node.js, and Bun runtimes. Use when intercepting requests at the platform level.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=291; sha256=521821d60f7af332239ffcf896151e9eb625334c14202430ff60a91af3248165
- Triggers: Vercel Routing Middleware guidance — request interception before cache, rewrites, redirects, personalization. Works with any framework. Supports Edge, Node.js, and Bun runtimes. Use when intercepting requests at the platform level.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Use; When NOT to Use
- Verification evidence: A/B Testing via Global Config
- Artifacts mentioned: vercel.json; openapi.vercel.sh/vercel.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:runtime-cache
- Category: backend/data
- Purpose: Vercel Runtime Cache API guidance — ephemeral per-region key-value cache with tag-based invalidation. Shared across Functions, Routing Middleware, and Builds. Use when implementing caching strategies beyond framework-level caching.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=283; sha256=b05ffa80629040a4a736946346befdc777bc0b67bd65838800f0656aca9fcae7
- Triggers: Vercel Runtime Cache API guidance — ephemeral per-region key-value cache with tag-based invalidation. Shared across Functions, Routing Middleware, and Builds. Use when implementing caching strategies beyond framework-level caching.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When to Use; When NOT to Use
- Verification evidence: Next.js 16 Invalidation APIs; Image invalidation
- Artifacts mentioned: Response.json; r.json
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## vercel:vercel-agent
- Category: deployment/operations
- Purpose: Vercel Agent guidance — dashboard and Slack chat, code review, production investigation, approved actions, and product installation. Use when configuring or working with Vercel's AI assistant.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=102; sha256=8e21f56eff1dea900988fddbd13971d21fb61dc692b9b76a102f02297a245144
- Triggers: Vercel Agent guidance — dashboard and Slack chat, code review, production investigation, approved actions, and product installation. Use when configuring or working with Vercel's AI assistant.
- Prerequisites/evidence: Installation
- Dependencies/references:
- Approval/safety gates: When to Use
- Verification evidence: Code Review
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-cli
- Category: deployment/operations
- Purpose: Vercel CLI expert guidance. Use when deploying, managing environment variables, linking projects, viewing logs, querying metrics, managing domains, managing feature flags with vercel flags, or interacting with the Vercel platform from the command line.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=173; sha256=6399a7d4f2fc8b7202c46ae4a63380c32ff8a994bd952985ee3f9b0fbf25b756
- Triggers: Vercel CLI expert guidance. Use when deploying, managing environment variables, linking projects, viewing logs, querying metrics, managing domains, managing feature flags with vercel flags, or interacting with the Vercel platform from the command line.
- Prerequisites/evidence:
- Dependencies/references: references/deployment.md; references/project-infra.md; references/local-development.md; references/environment-variables.md; references/ci-automation.md; references/domains-and-dns.md; references/projects-and-teams.md; references/comments.md; references/monitoring-and-debugging.md; references/platform-ops.md; references/storage.md; references/container-registry.md; references/integrations.md; references/connectors.md; references/routing.md; references/firewall.md; references/advanced.md; references/node-backends.md; references/monorepos.md; references/bun.md; references/flags.md; references/microfrontends.md; references/sandbox.md; references/agent-and-ai.md; references/global-options.md; references/getting-started.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: vercel.json; now.json; .vercel/project.json; project.json; .vercel/repo.json; references/deployment.md; references/project-infra.md; references/local-development.md; references/environment-variables.md; references/ci-automation.md; references/domains-and-dns.md; references/projects-and-teams.md; references/comments.md; references/monitoring-and-debugging.md; references/platform-ops.md; references/storage.md; references/container-registry.md; references/integrations.md; references/connectors.md; references/routing.md; references/firewall.md; references/advanced.md; references/node-backends.md; references/monorepos.md; references/bun.md; references/flags.md; references/microfrontends.md; references/sandbox.md; references/agent-and-ai.md; references/global-options.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-connect
- Category: deployment/operations
- Purpose: Vercel Connect expert guidance for securely obtaining scoped credentials for third-party services on behalf of apps or users. Use when wiring up provider API access, OAuth, API-key services, MCP servers, triggers, framework adapters, or eve agent connections.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=416; sha256=07ad7f7cfe4ebd68cebf66c120086de49900381ba0f42a3a822adb13d922c49c
- Triggers: Vercel Connect expert guidance for securely obtaining scoped credentials for third-party services on behalf of apps or users. Use when wiring up provider API access, OAuth, API-key services, MCP servers, triggers, framework adapters, or eve agent connections.
- Prerequisites/evidence: Inspect supported setup options, then create a connector; Project links, installations, and environments
- Dependencies/references:
- Approval/safety gates: When to Use Vercel Connect
- Verification evidence:
- Artifacts mentioned: connect_response.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-firewall
- Category: deployment/operations
- Purpose: Vercel Firewall expert guidance — automatic DDoS mitigation, the Vercel WAF (custom rules, IP blocking, managed rulesets, rate limiting), Attack Mode, system bypass, bot management, and the `vercel firewall` CLI. Use when configuring platform-level security, responding to attacks, or staging firewall rules.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=367; sha256=cc490dddcced6d2db0bdaa59aeebd3f38e9108b97ca8e9baae17afee685b3f7d
- Triggers: Vercel Firewall expert guidance — automatic DDoS mitigation, the Vercel WAF (custom rules, IP blocking, managed rulesets, rate limiting), Attack Mode, system bypass, bot management, and the `vercel firewall` CLI. Use when configuring platform-level security, responding to attacks, or staging firewall rules.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: vercel.json; .vercel/project.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-functions
- Category: deployment/operations
- Purpose: Vercel Functions expert guidance — Node.js/Bun/Python runtimes, Fluid Compute, long-duration (30 min) functions, large functions (5 GB bundles), Docker/OCI container images, plan limits, streaming, WebSockets, and Cron Jobs. Use when configuring, debugging, or optimizing server-side code running on Vercel.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=967; sha256=ac162ecba80415929a1c40f65beea13cb25f09baf3bfa87ce6d6e404962040c6
- Triggers: Vercel Functions expert guidance — Node.js/Bun/Python runtimes, Fluid Compute, long-duration (30 min) functions, large functions (5 GB bundles), Docker/OCI container images, plan limits, streaming, WebSockets, and Cron Jobs. Use when configuring, debugging, or optimizing server-side code running on Vercel.
- Prerequisites/evidence: Invocation Failure Diagnostics
- Dependencies/references:
- Approval/safety gates: When 30 minutes is not enough; When to reach for a container
- Verification evidence: Function Runtime Diagnostics; Timeout Diagnostics; 500 Error Diagnostics; Invocation Failure Diagnostics; Cold Start Diagnostics; Edge Function Timeout Diagnostics
- Artifacts mentioned: vercel.json; Response.json; req.json; openapi.vercel.sh/vercel.json; now.json
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-sandbox
- Category: deployment/operations
- Purpose: Vercel Sandbox guidance — ephemeral Firecracker microVMs for running untrusted code safely. Supports AI agents, code generation, and experimentation. Use when executing user-generated or AI-generated code in isolation.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=423; sha256=db68a13177ba78c3eeabbe61256829c9b801d4332a05c8692e0c728124041d20
- Triggers: Vercel Sandbox guidance — ephemeral Firecracker microVMs for running untrusted code safely. Supports AI agents, code generation, and experimentation. Use when executing user-generated or AI-generated code in isolation.
- Prerequisites/evidence: Install; Installing system packages
- Dependencies/references:
- Approval/safety gates:
- Verification evidence: Ports and preview URLs; Best-practice checklist
- Artifacts mentioned:
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-services
- Category: deployment/operations
- Purpose: Configure and troubleshoot Vercel Services for multiple frontends and backends in one project. Use when composing a polyglot or multi-service application on one Vercel deployment; defining the `services` key, service-targeted rewrites, or service bindings in `vercel.json`; or running all services with `vercel dev`.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=253; sha256=eb82b6a1aef40230c6a24ba58d7a4377e34c274aa83f910ba326992c93b7c384
- Triggers: Configure and troubleshoot Vercel Services for multiple frontends and backends in one project. Use when composing a polyglot or multi-service application on one Vercel deployment; defining the `services` key, service-targeted rewrites, or service bindings in `vercel.json`; or running all services with `vercel dev`.
- Prerequisites/evidence:
- Dependencies/references: references/experimental-services.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: vercel.json; references/experimental-services.md; index.html
- Lifecycle situations: during development; deployment; production incident; release preparation

## vercel:vercel-storage
- Category: backend/data
- Purpose: Vercel storage expert guidance — Blob, Global Config (formerly Edge Config), and Marketplace storage (Neon Postgres, Upstash Redis). Use when choosing, configuring, or using data storage with Vercel applications.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=547; sha256=b294915c90706b86edfc4f1dca4c33b519ecf5eee8acdbda2d7466f1b0f35bf4
- Triggers: Vercel storage expert guidance — Blob, Global Config (formerly Edge Config), and Marketplace storage (Neon Postgres, Upstash Redis). Use when choosing, configuring, or using data storage with Vercel applications.
- Prerequisites/evidence: Option 1: Source env vars before running; Installing Marketplace Storage; Install a storage integration (auto-provisions env vars); List installed integrations
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: docs/secret.pdf
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## vercel:verification
- Category: deployment/operations
- Purpose: Full-story verification — infers what the user is building, then verifies the complete flow end-to-end: browser → API → data → response. Triggers on dev server start and 'why isn't this working' signals.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=197; sha256=1dd50aa65a4f8a287f8d8e2fbbaf4e52a3998451a9011659ab0ab38d19539932
- Triggers: Full-story verification — infers what the user is building, then verifies the complete flow end-to-end: browser → API → data → response. Triggers on dev server start and 'why isn't this working' signals.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: When This Triggers; Stop Conditions
- Verification evidence: Full-Story Verification; Verification Report: [Feature Name]; Verified Working; Suggest Verification After Implementation
- Artifacts mentioned: package.json
- Lifecycle situations: during development; bug diagnosis; test failure; code review; release preparation; deployment; production incident

## vercel:workflow
- Category: deployment/operations
- Purpose: Vercel Workflow SDK expert guidance. Use when building durable workflows, long-running tasks, API routes or agents that need pause/resume, retries, step-based execution, or crash-safe orchestration with Vercel Workflow.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=1246; sha256=23c2875814cbe17ea2f16f0f80b082a05943f59bb09bcc3631d392f6cbe33de3
- Triggers: Vercel Workflow SDK expert guidance. Use when building durable workflows, long-running tasks, API routes or agents that need pause/resume, retries, step-based execution, or crash-safe orchestration with Vercel Workflow.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates: Run size & concurrency: know when to split
- Verification evidence: Check workflow endpoints are reachable; --env defaults to "production"; use --env preview for preview deployments; Testing workflows
- Artifacts mentioned: next.md; express.md; hono.md; workflows-and-steps.md; hooks.md; streaming.md; sleep.md; create-hook.md; fatal-error.md; start.md; get-run.md; resume-hook.md; get-world.md; storage.md; streams.md; queue.md; hydrate-resource-io.md; parse-workflow-name.md; vercel.md; local.md; postgres.md; response.json; Response.json; req.json; api-reference/workflow-runtime/world/storage.md
- Lifecycle situations: during development; deployment; production incident; release preparation

## visualize:visualize
- Category: frontend/UI
- Purpose: Create visualizations and interactive tools directly in conversation. Proactively use to show how something works; explore 'what happens when', 'what changes', or 'help me understand'; compare or inspect; create simulations, maps, charts, graphs, and mockups. Use standard tools for static scientific figures.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=272; sha256=e99b3dbd273d81a42ba20ed4b6e574435bdfa8ef4782f71f177a02fbe3871309
- Triggers: Create visualizations and interactive tools directly in conversation. Proactively use to show how something works; explore 'what happens when', 'what changes', or 'help me understand'; compare or inspect; create simulations, maps, charts, graphs, and mockups. Use standard tools for static scientific figures.
- Prerequisites/evidence:
- Dependencies/references:
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: index.html; tweak.md; widgets/calendar.md; examples/calendar.html; 3/counties-10m.json
- Lifecycle situations: during development; start of day; new feature; refactoring; end of day

## work-pets:create-pet
- Category: specialized or usually unrelated
- Purpose: Create, repair, validate, preview, upload, or activate an animated v2 pet in ChatGPT Work mode from a character idea, brand cue, or reference image. Use for new ChatGPT Pets, custom mascots, non-pixel styles, and unattached sprite sheets requiring nine animation states plus sixteen look directions. Preserve Library artifacts and Pets MCP lifecycle behavior. Exclude real pets, standalone images, and other-app pets; clarify before invoking.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=172; sha256=841354fb8116f8fdfd3b643b30828f5180196c594d3fed9b669b948b88892af1
- Triggers: Create, repair, validate, preview, upload, or activate an animated v2 pet in ChatGPT Work mode from a character idea, brand cue, or reference image. Use for new ChatGPT Pets, custom mascots, non-pixel styles, and unattached sprite sheets requiring nine animation states plus sixteen look directions. Preserve Library artifacts and Pets MCP lifecycle behavior. Exclude real pets, standalone images, and other-app pets; clarify before invoking.
- Prerequisites/evidence:
- Dependencies/references: ../../references/sprite-sheet-contract.md; references/animation-rows.md; ../../references/upload-session.md
- Approval/safety gates: Discover brand cues when needed
- Verification evidence: Assemble, review, and converge; Create and verify the pet
- Artifacts mentioned: ../../references/sprite-sheet-contract.md; references/animation-rows.md; pet_request.json; imagegen-jobs.json; review.json; qa/direction-semantics.json; RUN_DIR/final/spritesheet-extended.png; RUN_DIR/final/validation-extended.json; RUN_DIR/qa/chroma-despill-extended.json; RUN_DIR/qa/review.json; RUN_DIR/qa/direction-semantics.json; RUN_DIR/qa/look-continuity.json; RUN_DIR/qa/pet-quality.json; ../../references/upload-session.md
- Lifecycle situations: during development

## work-pets:pets
- Category: specialized or usually unrelated
- Purpose: List, inspect, select, download, or delete animated pets in ChatGPT Work mode. Use for an explicit pet in ChatGPT or established ChatGPT Pets context. Exclude real-world and other-app pets; clarify before invoking.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=50; sha256=1bf5d45fd6a6390aab777229293fb05cef7cf898aac882f8955e40c378e52fcd
- Triggers: List, inspect, select, download, or delete animated pets in ChatGPT Work mode. Use for an explicit pet in ChatGPT or established ChatGPT Pets context. Exclude real-world and other-app pets; clarify before invoking.
- Prerequisites/evidence:
- Dependencies/references: ../create-pet/SKILL.md; ../update-pet/SKILL.md
- Approval/safety gates:
- Verification evidence:
- Artifacts mentioned: ../create-pet/SKILL.md; ../update-pet/SKILL.md
- Lifecycle situations: during development

## work-pets:update-pet
- Category: specialized or usually unrelated
- Purpose: Inspect, validate, preview, repair, or update a custom pet in ChatGPT Work mode, including its name, description, or sprite sheet. Use for a pet in ChatGPT or established ChatGPT Pets context. Exclude real-world and other-app pets; clarify before invoking.
- Source: catalog://reviewed-skill
- Status: reviewed; lines=44; sha256=c63c98d67b6ad781a72a8f9837ba1fb5e2d2a8054a2562e4025890a97d8a0e67
- Triggers: Inspect, validate, preview, repair, or update a custom pet in ChatGPT Work mode, including its name, description, or sprite sheet. Use for a pet in ChatGPT or established ChatGPT Pets context. Exclude real-world and other-app pets; clarify before invoking.
- Prerequisites/evidence:
- Dependencies/references: ../../references/sprite-sheet-contract.md; ../../references/upload-session.md
- Approval/safety gates:
- Verification evidence: Verify the update
- Artifacts mentioned: ../../references/sprite-sheet-contract.md; ../../references/upload-session.md
- Lifecycle situations: during development

## Audit limitations and out-of-catalog files
- The session catalog is the authoritative availability boundary. Additional cached SKILL.md files were inventoried separately and are not treated as callable skills unless they appear in the declared catalog.

### Cache-only skills not in the declared session catalog

`ask-matt`, `grill-with-docs`, `implement-spec`, `implement`, `improve-codebase-architecture`, `retro`, `setup-matt-pocock-skills`, `to-spec`, `to-tickets`, `triage`, `wayfinder`, `chief-of-staff`, `claude-handoff`, `loop-me`, `setup-ts-deep-modules`, `writing-beats`, `writing-fragments`, `writing-shape`, `git-guardrails-claude-code`, `migrate-to-shoehorn`, `scaffold-exercises`, `setup-pre-commit`, `grill-me`, `handoff`, `teach`, `to-questionnaire`, `wait-what`, `supabase-best-practices`, `artifact-template-analytics-dashboard`, `artifact-template-business-review`, `artifact-template-design-report`, `artifact-template-experiment-analysis`, `artifact-template-financial-budget`, `artifact-template-investment-committee-memo`, `artifact-template-legal-memorandum`, `artifact-template-market-trends-report`, `artifact-template-minimal-letterhead`, `artifact-template-operating-calendar`, `artifact-template-operating-review`, `artifact-template-project-kickoff`, `artifact-template-project-tracker`, `artifact-template-sales-pipeline`, `artifact-template-simple-dark-mode`, `artifact-template-simple-light-mode`, `artifact-template-strategy-memorandum`, `artifact-template-system-design`, `artifact-template-team-alignment`, `artifact-template-three-statement-forecast`, `design-qa`, `get-context`, `research`, `share`, `user-context`, `review-agent`.

Count: 54 cache-only files. They were not included in the verified catalog registry because the current session did not declare them available.

