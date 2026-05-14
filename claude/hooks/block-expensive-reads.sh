#!/bin/bash
# Blocks file reads of generated dirs and lock files that provide zero reasoning value.

INPUT=$(cat)
TOOL=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null)
PATH_ARG=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); p=d.get('tool_input',{}); print(p.get('path','') or p.get('file_path',''))" 2>/dev/null)

if [[ "$TOOL" =~ ^(Read|mcp__filesystem__read_file|mcp__filesystem__read_text_file)$ ]]; then
  if echo "$PATH_ARG" | grep -qE "(node_modules|\.next|dist/|\.git/|__pycache__|uv\.lock|package-lock\.json|yarn\.lock|Cargo\.lock)"; then
    echo '{"decision":"block","reason":"File is in a generated/dependency directory. Use grep to extract only what you need instead of reading the whole file."}'
  fi
fi
