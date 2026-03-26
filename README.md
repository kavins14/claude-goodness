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

### Option 1: Symlink (Recommended)
```bash
# Clone this repo
git clone <your-repo-url> ~/claude-goodness

# Backup existing .claude directory
mv ~/.claude ~/.claude.backup

# Symlink this repo as your .claude directory
ln -s ~/claude-goodness ~/.claude
```

### Option 2: Direct Clone
```bash
# Backup existing .claude
mv ~/.claude ~/.claude.backup

# Clone directly as .claude
git clone <your-repo-url> ~/.claude
```

### After Setup
Your Claude Code configuration is now synced! Any changes to skills or settings will be reflected across all machines where you've set this up.

## Structure

```
claude-goodness/
├── skills/              # Custom skills (synced)
├── plugins/             # Custom plugins (synced)
├── settings.json        # Claude settings (synced)
└── .gitignore          # Excludes cache/temp/local files
```

**Note:** `settings.local.json` is excluded - it stays machine-specific.

## Cool Claude-Related Resources

- [skills.sh](https://skills.sh) - Claude Code skills and utilities
- [Teams E2E Testing Skill](https://github.com/heyitsaamir/teams-e2e-testing/blob/main/SKILL.md) - Custom skill for Teams end-to-end testing
