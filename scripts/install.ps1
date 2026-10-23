[CmdletBinding()]
param(
  [switch]$All,
  [switch]$ProjectOnly,
  [string]$ProjectPath = (Get-Location).Path,
  [string]$CodexHome = $(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' })
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$skillSource = Join-Path $repo 'skills\codex-app-agent'
$skillDestination = Join-Path $CodexHome 'skills\codex-app-agent'
$referenceSource = Join-Path $repo 'references'
$promptSource = Join-Path $repo 'prompts'

function Copy-BundleFile([string]$source, [string]$destination) {
  New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
  Copy-Item -LiteralPath $source -Destination $destination -Force
}

function Install-Skill {
  New-Item -ItemType Directory -Path $skillDestination -Force | Out-Null
  Copy-Item -Path (Join-Path $skillSource '*') -Destination $skillDestination -Recurse -Force
  Write-Host "Installed skill: $skillDestination"
}

function Install-ProjectBundle {
  $projectRoot = (Resolve-Path -LiteralPath $ProjectPath).Path
  $targetRoot = Join-Path $projectRoot '.codex-app-agent'
  New-Item -ItemType Directory -Path (Join-Path $targetRoot 'references'),(Join-Path $targetRoot 'prompts') -Force | Out-Null
  Copy-Item -Path (Join-Path $referenceSource '*') -Destination (Join-Path $targetRoot 'references') -Recurse -Force
  Copy-Item -Path (Join-Path $promptSource '*') -Destination (Join-Path $targetRoot 'prompts') -Recurse -Force
  Copy-BundleFile (Join-Path $repo 'templates\AGENTS.md') (Join-Path $targetRoot 'AGENTS.md.template')
  Copy-BundleFile (Join-Path $repo 'templates\agent-session.md') (Join-Path $targetRoot 'agent-session.md.template')
  Write-Host "Installed project references: $targetRoot"
}

if ($ProjectOnly) { Install-ProjectBundle; exit 0 }
if ($All) { Install-Skill; Install-ProjectBundle; exit 0 }

Write-Host 'Codex App Agent guided installer'
Write-Host '1. Install the Codex skill'
Write-Host '2. Install project references and prompts'
Write-Host '3. Install both'
$choice = Read-Host 'Choose 1, 2, or 3'
switch ($choice) {
  '1' { Install-Skill }
  '2' { Install-ProjectBundle }
  '3' { Install-Skill; Install-ProjectBundle }
  default { throw 'Choose 1, 2, or 3.' }
}
