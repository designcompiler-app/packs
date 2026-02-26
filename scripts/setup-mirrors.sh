#!/bin/bash
# Setup push mirrors for the packs registry repo.
# Run once after initial clone from GitHub.
#
# Primary: GitHub (designcompiler-app/packs)
# Mirrors: GitLab, Bitbucket, Azure DevOps
#
# After setup, `git push` sends to all 4 remotes.

set -euo pipefail

echo "Setting up multi-platform push mirrors..."

# Primary origin (GitHub)
git remote set-url origin https://github.com/designcompiler-app/packs.git

# Add push URLs for all platforms
git remote set-url --add --push origin https://github.com/designcompiler-app/packs.git
git remote set-url --add --push origin https://gitlab.com/design-compiler/packs.git
git remote set-url --add --push origin https://bitbucket.org/designcompiler/packs.git
git remote set-url --add --push origin https://designcompiler@dev.azure.com/designcompiler/packs/_git/packs

echo ""
echo "✅ Push mirrors configured. Verify with:"
echo "   git remote -v"
echo ""
echo "Now 'git push' will push to all 4 platforms simultaneously."
