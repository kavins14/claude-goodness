# Skills

This directory contains Claude Code skills — reusable prompt templates that can be invoked as slash commands (e.g. `/resume-builder`).

## Listing Skills

To see all available skills in the current project:

```bash
npx skills list
```

## Using a Skill

Invoke any skill as a slash command in Claude Code:

```
/resume-builder
/grill-me on my API design
/teach-me about transformers
```

## Installing Skills from this Repo

Install a specific skill:
```bash
npx skills add kavins14/claude-goodness --skill resume-builder
```

Install all skills:
```bash
npx skills add kavins14/claude-goodness --all
```

> Requires the repo to be public on GitHub.

## Adding a New Skill

1. Create a folder under `skills/`:
   ```
   skills/my-skill/SKILL.md
   ```

2. Add frontmatter and the skill prompt to `SKILL.md`:
   ```markdown
   ---
   name: my-skill
   description: One-line description of when to use this skill.
   ---

   Your skill prompt here...
   ```

3. Verify it shows up:
   ```bash
   npx skills list
   ```

That's it — no registration needed. Skills are auto-discovered from the `skills/` directory.

## Available Skills

| Skill | Description |
|---|---|
| `resume-builder` | Step-by-step resume builder — interviews you to extract all details |
| `grill-me` | Relentlessly interviews you about a plan or design to stress-test it |
| `teach-me` | Breaks down any topic into simple explanations with a quiz |
| `find-skills` | Helps discover and install skills from the community |
| `capture-session-learnings` | Saves useful patterns and workflows from the current session |
