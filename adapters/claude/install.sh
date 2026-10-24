#!/usr/bin/env bash
# Copies files only. No network, dependency installs, commits, pushes or hosted-service calls.
#   ./install.sh                                   user install into ~/.claude
#   ./install.sh --project --path=/path/to/app     project install into /path/to/app/.claude
#   ./install.sh --templates --path=/path/to/app   also copy CLAUDE.md.template and app-agent.json (if missing)
# --path defaults to the current directory. Same switches as install.ps1 (-Project, -ProjectPath, -Templates).
set -euo pipefail

PROJECT=false
TEMPLATES=false
PROJECT_PATH="$(pwd)"
for arg in "$@"; do
  case "$arg" in
    --project) PROJECT=true ;;
    --path=*) PROJECT_PATH="${arg#*=}" ;;
    --templates) TEMPLATES=true ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

ADAPTER="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if $PROJECT; then ROOT="$PROJECT_PATH/.claude"; else ROOT="${CLAUDE_HOME:-$HOME/.claude}"; fi

mkdir -p "$ROOT/skills/app-agent" "$ROOT/agents"
cp -R "$ADAPTER/skills/app-agent/." "$ROOT/skills/app-agent/"
cp "$ADAPTER/agents/app-agent-verifier.md" "$ROOT/agents/"
echo "Installed skill:    $ROOT/skills/app-agent"
echo "Installed subagent: $ROOT/agents/app-agent-verifier.md"

if $TEMPLATES; then
  mkdir -p "$PROJECT_PATH/.claude"
  if [ -e "$PROJECT_PATH/.claude/app-agent.json" ]; then echo "Kept existing:      $PROJECT_PATH/.claude/app-agent.json"
  else cp "$ADAPTER/templates/app-agent.json" "$PROJECT_PATH/.claude/app-agent.json"; echo "Created config:     $PROJECT_PATH/.claude/app-agent.json"; fi
  cp "$ADAPTER/templates/CLAUDE.md" "$PROJECT_PATH/.claude/CLAUDE.md.template"
  echo "Template:           $PROJECT_PATH/.claude/CLAUDE.md.template (merge into your CLAUDE.md by hand)"
fi
echo "Restart Claude Code (or start a new session) so it picks up the skill and subagent."
