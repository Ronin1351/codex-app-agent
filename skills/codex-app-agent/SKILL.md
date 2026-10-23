---
name: codex-app-agent
description: Coordinate app-development work across planning, implementation, debugging, testing, security, review, release, and handoff using the repository's available skills and approval gates.
metadata:
  short-description: Run cross-project app work with evidence and gates
---

# Codex App Agent

Use this skill for app-development work in any repository. Select the smallest workflow that fits the request, preserve unrelated working-tree changes, and finish with evidence.

## Workflow

1. Read the target project's `AGENTS.md`, inspect `git status`, and identify the requested situation.
2. Read [agent-dispatch-rules.md](../../references/agent-dispatch-rules.md) and select a primary skill plus only the supporting skills required by the task.
3. Read the selected skill files before applying their workflows. Use [agent-skill-situation-matrix.md](../../references/agent-skill-situation-matrix.md) for lifecycle combinations.
4. Inspect the relevant code or artifacts, make only in-scope changes, and preserve unrelated edits.
5. Run the required verification and record fresh command output before claiming completion.
6. Ask for approval immediately before external mutations such as hosted-data writes, deployments, secret/settings changes, commits, pushes, or destructive operations.
7. Report changed files, commands and evidence, gates, fallbacks, and the next action.

## Reusable modes

- Start of day: [prompts/start-of-day.md](../../prompts/start-of-day.md)
- End of day: [prompts/end-of-day.md](../../prompts/end-of-day.md)
- Feature work: [prompts/feature-development.md](../../prompts/feature-development.md)
- Bug diagnosis: [prompts/bug-diagnosis.md](../../prompts/bug-diagnosis.md)
- Release/deployment: [prompts/release-and-deployment.md](../../prompts/release-and-deployment.md)

Read [agent-prompt-library.md](../../references/agent-prompt-library.md) only when composing or adapting a prompt.

## ADHD-friendly mode

When the user includes `$i-have-adhd`, lead with one next action, offer no more than three choices, use Now / Next / Later, checkpoint after each step, and keep an open-loop list. Approval gates and verification still apply.
