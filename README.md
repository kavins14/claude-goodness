# Claude Goodness

A portable `.claude` directory - sync your Claude Code configuration, skills, and settings across all your machines.

## Purpose

This repository serves as my `.claude` directory, allowing me to:
- ✅ Sync Claude Code settings across machines
- ✅ Version control my custom skills
- ✅ Share configurations between work and personal devices
- ✅ Back up my Claude Code setup

## What's Inside

- **Skills** - Custom Claude Code skills and workflows
- **Settings** - Claude Code configuration (settings.json)
- **Plugins** - Custom plugins and integrations

## Setup on a New Machine

### Step 1: Clone and Link
```bash
# Clone this repo
git clone https://github.com/kavins14/claude-goodness.git ~/.claude

# Or if you prefer symlink:
git clone https://github.com/kavins14/claude-goodness.git ~/claude-goodness
mv ~/.claude ~/.claude.backup
ln -s ~/claude-goodness ~/.claude
```

### Step 2: Install Skills
```bash
cd ~/.claude
chmod +x setup-skills.sh
./setup-skills.sh
```

This will automatically install all skills.sh skills from the manifest.

### Done! 🎉
Your Claude Code configuration is now synced! Custom skills and settings work immediately.

## Structure

```
claude-goodness/
├── skills/
│   ├── skills.json              # Manifest of skills.sh skills to install
│   ├── *.SKILL.md               # Your custom skills (synced)
│   └── */                       # CLI-installed skills (not synced)
├── plugins/                     # Custom plugins (synced)
├── settings.json                # Claude settings (synced)
├── setup-skills.sh              # Auto-install skills on new machines
└── .gitignore                   # Excludes cache/temp/local files
```

**Note:** `settings.local.json` is excluded - it stays machine-specific.

## Managing Skills

### Custom Skills (Your Creations)
- Create `skills/my-skill.SKILL.md` files
- These are version controlled and synced via git
- Example: `capture-session-learnings.SKILL.md`

### Skills.sh Skills (Community Skills)
- Add to `skills/skills.json` manifest
- Run `./setup-skills.sh` or install manually with `npx skills add <package> -g --agent claude-code`
- These are managed by the skills CLI and auto-update with `npx skills update`
- Example: `grill-me`

### Adding a New Skill from skills.sh

1. **Add to manifest:**
   ```json
   {
     "name": "skill-name",
     "package": "owner/repo/skill-name",
     "description": "What it does"
   }
   ```

2. **Install it:**
   ```bash
   npx skills add owner/repo/skill-name -g --agent claude-code
   ```

3. **Commit the manifest:**
   ```bash
   git add skills/skills.json
   git commit -m "Add skill-name to manifest"
   ```

## Cool Claude-Related Resources

- [skills.sh](https://skills.sh) - Claude Code skills and utilities
- [Teams E2E Testing Skill](https://github.com/heyitsaamir/teams-e2e-testing/blob/main/SKILL.md) - Custom skill for Teams end-to-end testing
