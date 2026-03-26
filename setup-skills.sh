#!/bin/bash
# Setup script for installing skills from skills.json manifest

set -e

echo "🚀 Setting up claude-goodness skills..."

# Check if skills CLI is available
if ! command -v npx &> /dev/null; then
    echo "❌ Error: npx not found. Please install Node.js first."
    exit 1
fi

# Read skills from manifest
SKILLS_FILE="./skills/skills.json"

if [ ! -f "$SKILLS_FILE" ]; then
    echo "❌ Error: skills.json not found at $SKILLS_FILE"
    exit 1
fi

echo "📋 Reading skills manifest..."

# Get the absolute path to the project root
PROJECT_ROOT="$(cd "$(dirname "$SKILLS_FILE")/.." && pwd)"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"

# Ensure Claude skills directory exists
mkdir -p "$CLAUDE_SKILLS_DIR"

# Check if jq is available for better JSON parsing
if command -v jq &> /dev/null; then
    # Use jq for proper JSON parsing
    echo "📦 Installing skills..."
    cat "$SKILLS_FILE" | jq -r '.skills[] | @json' | while read -r skill_json; do
        package=$(echo "$skill_json" | jq -r '.package')
        skill_name=$(echo "$skill_json" | jq -r '.skill // empty')
        name=$(echo "$skill_json" | jq -r '.name')
        location=$(echo "$skill_json" | jq -r '.location // empty')

        if [ "$package" = "local" ]; then
            # Handle local skills by creating symlinks
            if [ -z "$location" ]; then
                echo "  ⚠️  Skipping $name: no location specified for local skill"
                continue
            fi

            SOURCE_PATH="$PROJECT_ROOT/$location"
            TARGET_PATH="$CLAUDE_SKILLS_DIR/$name"

            if [ ! -d "$SOURCE_PATH" ]; then
                echo "  ⚠️  Skipping $name: source path not found at $SOURCE_PATH"
                continue
            fi

            # Remove existing symlink or directory if it exists
            if [ -L "$TARGET_PATH" ]; then
                echo "  → Updating symlink for $name"
                rm "$TARGET_PATH"
            elif [ -d "$TARGET_PATH" ]; then
                echo "  ⚠️  Warning: $TARGET_PATH exists but is not a symlink, skipping"
                continue
            fi

            # Create symlink
            ln -s "$SOURCE_PATH" "$TARGET_PATH"
            echo "  ✓ Linked local skill: $name"
        else
            # Handle skills.sh registry skills
            if [ -n "$skill_name" ]; then
                echo "  → Installing $name from $package"
                npx skills add "$package" --skill "$skill_name" -g --agent claude-code -y
            else
                echo "  → Installing $package"
                npx skills add "$package" -g --agent claude-code -y
            fi
        fi
    done
else
    # Fallback: simple grep-based parsing
    echo "⚠️  Warning: jq not found. Install jq for full local skill support."
    packages=$(cat "$SKILLS_FILE" | grep -o '"package": "[^"]*"' | cut -d'"' -f4 | grep -v "local")

    if [ -z "$packages" ]; then
        echo "⚠️  No registry skills found in manifest"
    else
        echo "📦 Installing registry skills..."
        for package in $packages; do
            echo "  → Installing $package"
            npx skills add "$package" -g --agent claude-code -y
        done
    fi

    echo "⚠️  Note: Install jq to enable automatic local skill linking"
fi

echo ""
echo "✅ All skills installed successfully!"
echo ""
echo "📁 Local skills (symlinked from this repo):"
for skill_dir in "$CLAUDE_SKILLS_DIR"/*; do
    if [ -L "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        target=$(readlink "$skill_dir")
        if [[ "$target" == "$PROJECT_ROOT"* ]]; then
            echo "  ✓ $skill_name -> $target"
        fi
    fi
done
echo ""
echo "📦 Registry skills (managed by skills.sh CLI):"
npx skills list -g 2>/dev/null || echo "  (none installed)"
