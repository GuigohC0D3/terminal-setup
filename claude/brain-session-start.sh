#!/bin/bash
# Auto-inject project vault context
PROJECT=$(basename "$PWD")
VAULT="$HOME/Documents/Projetos/claudeBrain/Projects/${PROJECT}.md"
if [ -f "$VAULT" ]; then
  echo "=== PROJECT CONTEXT: $PROJECT ==="
  cat "$VAULT"
  echo "==================================="
fi
