---
name: capture-session-learnings
description: Analyze the current Claude Code session and identify useful patterns, workflows, or configurations worth saving to the claude-goodness repository. Use at the end of a session or after completing something useful.
---

Review the conversation history and identify valuable learnings to save to the claude-goodness repository.

**What to look for:**
- Useful Claude Code workflows or patterns demonstrated
- Reusable configurations or setup steps
- Interesting tool combinations or techniques
- Repeated tasks that could become new skills
- Resources or links mentioned that should be documented

**Analysis Process:**

1. **Review the Current Session**
   - Look for patterns in how Claude Code was used
   - Identify repeated tasks or workflows
   - Note configurations created or discussed

2. **Categorize Findings**
   - **Skills**: Repeated workflows that could be automated
   - **Resources**: Useful links, documentation, or references
   - **Patterns**: Common approaches or best practices discovered
   - **Configurations**: Reusable project settings

3. **Present Recommendations**

Show a summary in this format:

```
# Session Analysis

## Useful Patterns Found
- [Pattern 1]: Description and why it's useful
- [Pattern 2]: Description and why it's useful

## Recommended Additions

### New Skill: [skill-name]
**Location**: skills/[skill-name]/SKILL.md
**Reason**: [Why this would be useful]
**Content Preview**: [Brief description or draft]

### Resource Addition
**What**: [Resource name/link]
**Where**: README.md resources section
**Why**: [Relevance and value]

## Next Steps
- [ ] Create [item 1]
- [ ] Add [item 2]
- [ ] Update [item 3]
```

Ask which items the user wants to save, then offer to create the files if approved.
