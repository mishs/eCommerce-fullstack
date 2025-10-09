#!/bin/bash

# Quick install script for global development aliases
# Run with: bash install-aliases.sh

echo "🔧 Installing global development aliases..."

# Detect shell config file
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.bash_profile"
fi

echo "📝 Adding aliases to $SHELL_RC"

# Backup existing config
cp "$SHELL_RC" "${SHELL_RC}.backup-$(date +%Y%m%d-%H%M%S)"
echo "✅ Backup created: ${SHELL_RC}.backup-$(date +%Y%m%d-%H%M%S)"

# Add aliases section
cat >> "$SHELL_RC" << 'EOF'

# ============================================
# eCommerce Project Aliases (Auto-generated)
# ============================================

# Project setup
alias create-ecommerce='bash ~/dev-scripts/setup-monorepo.sh'

# Development shortcuts
alias dev='npm run dev'
alias dev:fe='npm run dev:frontend'
alias dev:be='npm run dev:backend'

# Testing
alias test='npm test'
alias test:watch='npm test -- --watch'
alias test:ui='npm run test:ui'

# Code quality
alias lint='npm run lint'
alias format='npm run format'

# Git shortcuts
alias gst='git status'
alias gaa='git add .'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias glog='git log --oneline --graph --all'

# Conventional commit helper
gc() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: gc <type> <scope> <message>"
        echo "Example: gc feat cart 'add increment button'"
        return 1
    fi
    type=$1
    scope=$2
    shift 2
    git commit -m "${type}(${scope}): $*"
}

# Quick commit and push
gcp() {
    git add .
    git commit -m "$1"
    git push
}

EOF

echo ""
echo "✅ Aliases installed successfully!"
echo ""
echo "📋 To use them now, run:"
echo "   source $SHELL_RC"
echo ""
echo "🔄 Or restart your terminal"
echo ""
echo "📚 Available aliases:"
echo "   dev          - Start dev server"
echo "   test         - Run tests"
echo "   gst          - Git status"
echo "   gc feat cart 'message' - Conventional commit"
echo ""
