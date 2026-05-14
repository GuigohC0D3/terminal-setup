#!/bin/bash
# Blocks brainstorm/plan skills when prompt signals direct implementation.
# Reads prompt from stdin as JSON, checks for bypass keywords.

PROMPT=$(cat | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('prompt',''))" 2>/dev/null)

# Keywords that signal "skip brainstorm, just implement"
if echo "$PROMPT" | grep -qiE "^(IMPLEMENT|FIX|BUILD|HOTFIX|PATCH|UPDATE):|direto$|direto\.|directly$"; then
  echo '{"inject":"SKIP_SKILLS: The user has provided a complete specification. Do NOT invoke brainstorming, writing-plans, or any planning skill. Implement directly."}'
fi
