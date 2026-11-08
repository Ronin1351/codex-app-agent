#!/usr/bin/env bash
# Copies files only. No network, dependency installs, commits, pushes or hosted-service calls,
# except --plugins, which asks the Claude Code CLI to add the plugins in plugins/plugins.json.
#   ./install.sh                                   user install into ~/.claude
#   ./install.sh --plugins                         also install the bundled Claude Code plugins
#   ./install.sh --project --path=/path/to/app     project install into /path/to/app/.claude
#   ./install.sh --templates --path=/path/to/app   also copy CLAUDE.md.template and app-agent.json (if missing)
# --path defaults to the current directory. Same switches as install.ps1 (-Project, -ProjectPath, -Templates, -Plugins).
set -euo pipefail

PROJECT=false
TEMPLATES=false
PLUGINS=false
PROJECT_PATH="$(pwd)"
for arg in "$@"; do
  case "$arg" in
    --project) PROJECT=true ;;
    --path=*) PROJECT_PATH="${arg#*=}" ;;
    --templates) TEMPLATES=true ;;
    --plugins) PLUGINS=true ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

ADAPTER="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if $PROJECT; then ROOT="$PROJECT_PATH/.claude"; else ROOT="${CLAUDE_HOME:-$HOME/.claude}"; fi

mkdir -p "$ROOT/skills/app-agent" "$ROOT/agents"
cp -R "$ADAPTER/skills/app-agent/." "$ROOT/skills/app-agent/"
cp "$ADAPTER/agents/app-agent-verifier.md" "$ROOT/agents/"
echo "Installed skill:    $ROOT/skills/app-agent"
# Shared skill: single source in skills/execution-checklist (agents/ is Codex-only metadata).
mkdir -p "$ROOT/skills/execution-checklist"
cp "$ADAPTER/../../skills/execution-checklist/SKILL.md" "$ROOT/skills/execution-checklist/"
echo "Installed skill:    $ROOT/skills/execution-checklist"
# Shared skill: doc-coauthoring (Apache-2.0, see THIRD_PARTY_NOTICES.md).
mkdir -p "$ROOT/skills/doc-coauthoring"
cp "$ADAPTER/../../skills/doc-coauthoring/SKILL.md" "$ROOT/skills/doc-coauthoring/"
echo "Installed skill:    $ROOT/skills/doc-coauthoring"
# Shared skills: Lancer Loop + Lancer Foundation (agents/ is Codex-only metadata).
for LANCER in lancer-loop lancer-foundation; do
  mkdir -p "$ROOT/skills/$LANCER"
  cp "$ADAPTER/../../skills/$LANCER/SKILL.md" "$ROOT/skills/$LANCER/"
  echo "Installed skill:    $ROOT/skills/$LANCER"
done
echo "Installed subagent: $ROOT/agents/app-agent-verifier.md"

if $TEMPLATES; then
  mkdir -p "$PROJECT_PATH/.claude"
  if [ -e "$PROJECT_PATH/.claude/app-agent.json" ]; then echo "Kept existing:      $PROJECT_PATH/.claude/app-agent.json"
  else cp "$ADAPTER/templates/app-agent.json" "$PROJECT_PATH/.claude/app-agent.json"; echo "Created config:     $PROJECT_PATH/.claude/app-agent.json"; fi
  cp "$ADAPTER/templates/CLAUDE.md" "$PROJECT_PATH/.claude/CLAUDE.md.template"
  echo "Template:           $PROJECT_PATH/.claude/CLAUDE.md.template (merge into your CLAUDE.md by hand)"
fi

# Bundled Claude Code plugins (plugins/plugins.json). Opt-in because it reaches the network.
MANIFEST="$ADAPTER/../../plugins/plugins.json"
if $PLUGINS; then
  if $PROJECT; then SCOPE=project; else SCOPE=user; fi
  LIST="$(node -e 'for (const p of require(process.argv[1]).plugins) console.log(p.marketplace + " " + p.plugin)' "$MANIFEST")"
  if command -v claude >/dev/null 2>&1; then
    FAILED=0
    while read -r MARKET PLUGIN; do
      [ -n "$MARKET" ] || continue
      if (cd "$PROJECT_PATH" && claude plugin marketplace add "$MARKET" --scope "$SCOPE" && claude plugin install "$PLUGIN" --scope "$SCOPE") < /dev/null; then
        echo "Installed plugin:   $PLUGIN ($SCOPE)"
      else
        echo "Plugin FAILED:      $PLUGIN  (run: claude plugin marketplace add $MARKET && claude plugin install $PLUGIN)" >&2; FAILED=1
      fi
    done <<< "$LIST"
    [ "$FAILED" = 0 ] || echo "Some plugins did not install; the skills above are installed either way." >&2
  else
    echo "Claude Code CLI ('claude') not found. Install the bundled plugins from inside Claude Code:"
    while read -r MARKET PLUGIN; do [ -n "$MARKET" ] && echo "  /plugin marketplace add $MARKET" && echo "  /plugin install $PLUGIN"; done <<< "$LIST"
  fi
else
  echo "Bundled plugins not installed (rerun with --plugins): $(node -e 'console.log(require(process.argv[1]).plugins.map(p => p.name).join(", "))' "$MANIFEST")"
fi
echo "Restart Claude Code (or start a new session) so it picks up the skills, subagent and plugins."
