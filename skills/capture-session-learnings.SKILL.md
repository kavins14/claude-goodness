# Capture Session Learnings

A skill that analyzes the current Claude Code session and identifies useful patterns, workflows, or configurations worth saving to the claude-goodness repository.

## Description

When invoked, this skill reviews the conversation history and:
- Identifies useful Claude Code workflows or patterns demonstrated
- Extracts reusable configurations or setup steps
- Finds interesting tool combinations or techniques
- Suggests new skills based on repeated tasks
- Recommends resources or links mentioned

## Instructions

When this skill is invoked:

1. **Review the Current Session**
   - Read through the conversation history
   - Look for patterns in how Claude Code was used
   - Identify repeated tasks or workflows
   - Note any configurations created or discussed

2. **Identify Valuable Content**
   - Custom skills or workflows that could be reused
   - Configuration files (CLAUDE.md, settings, etc.)
   - Useful commands or tool combinations
   - Problem-solving patterns
   - Resources or links shared

3. **Categorize Findings**
   - **Skills**: Repeated workflows that could be automated
   - **Resources**: Useful links, documentation, or references
   - **Patterns**: Common approaches or best practices discovered
   - **Configurations**: Reusable project settings

4. **Make Recommendations**
   - Suggest what should be added to the repository
   - Propose file names and locations (skills/, new folders, etc.)
   - Provide draft content for new files
   - Explain why each item is worth saving

5. **Present to User**
   - Show a clear summary of findings
   - List specific actionable items
   - Ask which items they want to save
   - Offer to create the files if approved

## Output Format

```
# Session Analysis

## Useful Patterns Found
- [Pattern 1]: Description and why it's useful
- [Pattern 2]: Description and why it's useful

## Recommended Additions

### New Skill: [skill-name]
**Location**: skills/[skill-name].SKILL.md
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

## Usage

Invoke this skill at the end of a session or when you've completed something useful:

```
/capture-session-learnings
```

Or with context:
```
/capture-session-learnings - focus on git workflows
```
