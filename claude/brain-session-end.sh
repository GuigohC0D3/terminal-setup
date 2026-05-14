#!/bin/bash
# Write session end marker to session history
TARGET="$HOME/.claude/session-history.md"
touch "$TARGET"
tail -n 10 "$TARGET" > /tmp/session_tail 2>/dev/null && mv /tmp/session_tail "$TARGET" || true
echo "## Session End: $(date '+%Y-%m-%d %H:%M') — $(basename "$PWD")" >> "$TARGET"
