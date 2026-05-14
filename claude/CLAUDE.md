# Claude Code — Global Instructions

## Context & Token Economy (CRITICAL)

- **Compact aggressively:** Run `/compact` after every major topic. Don't wait for context to fill.
- **Read minimally:** Always use `offset` + `limit` on Read tool. Never read a full file when a section suffices.
- **No re-reads:** If a file was read this session, use what's in context — never re-fetch.
- **No verbose output:** No trailing summaries, no "here's what I did", no restating the question.
- **Tool calls minimal:** One tool call per need. No exploratory reads unless necessary.
- **Critical info first:** Always put the important output at the START of response, never buried.

## Default Behavior (IMPLEMENT Mode)

Unless explicitly asked otherwise:
- Code tasks: return code + max 1-2 sentence summary. No step-by-step explanations.
- Questions: answer directly. No preamble, no recap.
- No tutorials unless the user says "explain", "teach me", or "how does X work".
- No filler: no "Great question!", no trailing summaries.

## Model Selection

- **Haiku** → worker agents, simple tasks, pair programming (3x cheaper)
- **Sonnet** → main development, orchestration, complex code (default)
- **Opus** → architectural decisions only, deep reasoning (most expensive)

## File Read Discipline

ALWAYS grep-first before reading:
1. Run grep/find to locate the exact function/variable/line
2. Read only with offset+limit targeting that location
3. Never read files > 50KB in full — use offset+limit
4. NEVER read: node_modules/, dist/, .next/, *.lock, __pycache__/, generated/

For images/assets: describe them in the prompt instead of reading.
Use /compact after every major file exploration phase, before implementation.
