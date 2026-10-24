# Project instructions for Claude Code

@AGENTS.md

## App agent
For app-development work, use the `app-agent` skill (`/app-agent`). Before saying a change is done, run the `app-agent-verifier` subagent. Project settings for the agent live in `.claude/app-agent.json`.

<!-- Put project-only rules (database access model, release flow, secrets) in AGENTS.md so Codex and Claude read the same rules. Keep this file to Claude-specific notes. -->
