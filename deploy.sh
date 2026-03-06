#!/bin/bash
# Peliharaan AI Deployment Script for GitHub Pages
# Usage: ./deploy.sh

set -e

echo "🚀 Deploying Peliharaan AI to GitHub Pages..."
echo ""

# Check if index.html exists
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found in current directory"
    exit 1
fi

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository"
    exit 1
fi

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"

# Ensure we're on main branch
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Switching to main branch..."
    git checkout main
fi

# Check for uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    echo "📦 Committing changes..."
    git add -A
    git commit -m "Deploy to GitHub Pages - $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push origin main

echo ""
echo "✨ Push complete!"
echo ""
echo "🌐 To enable GitHub Pages:"
echo "   1. Go to https://github.com/Therealratoshen/Peliharan.AI/settings/pages"
echo "   2. Under 'Source', select 'GitHub Actions'"
echo "   3. Wait 1-2 minutes for deployment"
echo ""
echo "🌍 Your site will be live at:"
echo "   https://therealratoshen.github.io/Peliharan.AI/"
echo ""
echo "⚠️  NOTE: AI features may not work due to CORS restrictions"
echo "   when hosted on GitHub Pages. This is a browser security limitation."
