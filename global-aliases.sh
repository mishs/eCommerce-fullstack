#!/bin/bash

# Global Git and Development Aliases
# Add these to your ~/.bashrc, ~/.zshrc, or ~/.bash_profile

echo "Setting up global development aliases..."

# Detect shell configuration file
if [ -f ~/.zshrc ]; then
    SHELL_RC=~/.zshrc
elif [ -f ~/.bashrc ]; then
    SHELL_RC=~/.bashrc
else
    SHELL_RC=~/.bash_profile
fi

echo "Adding aliases to $SHELL_RC"

# Backup existing config
cp $SHELL_RC ${SHELL_RC}.backup

# Add development aliases
cat >> $SHELL_RC << 'EOF'

# ============================================
# eCommerce Project Aliases
# ============================================

# Project initialization
alias create-ecommerce='bash ~/dev-scripts/setup-monorepo.sh'

# Development
alias dev='npm run dev'
alias dev:fe='cd frontend && npm run dev'
alias dev:be='cd backend && npm run dev'

# Testing
alias test='npm test'
alias test:watch='npm test -- --watch'
alias test:ui='npm run test:ui'
alias test:coverage='npm test -- --coverage'

# Building
alias build='npm run build'
alias build:fe='cd frontend && npm run build'
alias build:be='cd backend && npm run build'

# Code quality
alias lint='npm run lint'
alias lint:fix='npm run lint -- --fix'
alias format='npm run format'
alias type-check='npm run type-check'

# Git workflows
alias gst='git status'
alias gaa='git add .'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --graph --all --decorate'

# Git commit with conventional format
function gc() {
    if [ -z "$1" ]; then
        echo "Usage: gc <type> <scope> <message>"
        echo "Example: gc feat cart 'add quantity increment'"
        return 1
    fi

    type=$1
    scope=$2
    shift 2
    message=$@

    git commit -m "${type}(${scope}): ${message}"
}

# Quick commit and push
function gcp() {
    git add .
    git commit -m "$1"
    git push
}

# Install all dependencies in monorepo
alias install-all='npm install && cd frontend && npm install && cd ../backend && npm install && cd ../shared && npm install && cd ..'

# Clean all node_modules
alias clean-modules='rm -rf node_modules frontend/node_modules backend/node_modules shared/node_modules'

# Reinstall everything
alias reinstall='clean-modules && install-all'

# View package.json scripts
alias scripts='cat package.json | grep -A 20 "scripts"'

# Docker (if using Docker later)
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'

# ============================================
# Reusable Project Setup Functions
# ============================================

# Create a new React + TypeScript + Vite project
function create-react-ts() {
    if [ -z "$1" ]; then
        echo "Usage: create-react-ts <project-name>"
        return 1
    fi

    npm create vite@latest $1 -- --template react-ts
    cd $1
    npm install
    echo "✅ React + TypeScript project created: $1"
}

# Setup Tailwind in current directory
function setup-tailwind() {
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p

    # Create basic config
    cat > tailwind.config.js << 'TAILWIND'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
TAILWIND

    # Create CSS file
    mkdir -p src/styles
    cat > src/styles/index.css << 'CSS'
@tailwind base;
@tailwind components;
@tailwind utilities;
CSS

    echo "✅ Tailwind CSS configured"
}

# Setup testing with Vitest
function setup-vitest() {
    npm install -D vitest @vitest/ui jsdom @testing-library/react @testing-library/jest-dom @testing-library/user-event

    echo "✅ Vitest and Testing Library installed"
    echo "⚠️  Don't forget to update vite.config.ts with test config"
}

# Initialize git with first commit
function git-init-project() {
    git init
    git add .
    git commit -m "chore: initial project setup"
    echo "✅ Git initialized with first commit"
}

# Create a feature branch with conventional naming
function create-feature() {
    if [ -z "$1" ]; then
        echo "Usage: create-feature <feature-name>"
        echo "Example: create-feature add-user-auth"
        return 1
    fi

    git checkout -b "feature/$1"
    echo "✅ Created and switched to feature/$1"
}

# Create a fix branch
function create-fix() {
    if [ -z "$1" ]; then
        echo "Usage: create-fix <fix-name>"
        return 1
    fi

    git checkout -b "fix/$1"
    echo "✅ Created and switched to fix/$1"
}

# Quick project health check
function health-check() {
    echo "🏥 Running project health check..."
    echo ""
    echo "📦 Checking dependencies..."
    npm outdated || echo "✅ All dependencies up to date"
    echo ""
    echo "🔍 Running linter..."
    npm run lint || echo "⚠️  Linting issues found"
    echo ""
    echo "🧪 Running tests..."
    npm test || echo "⚠️  Tests failing"
    echo ""
    echo "🏗️  Checking build..."
    npm run build || echo "⚠️  Build failing"
    echo ""
    echo "✅ Health check complete"
}

EOF

echo "✅ Aliases added to $SHELL_RC"
echo ""
echo "Run 'source $SHELL_RC' or restart your terminal to use the aliases"
echo ""
echo "📋 Available aliases:"
echo "  create-ecommerce       - Create new ecommerce monorepo"
echo "  dev                    - Start dev server"
echo "  test                   - Run tests"
echo "  lint                   - Run linter"
echo "  format                 - Format code"
echo "  gc <type> <scope> <msg>- Conventional commit"
echo "  create-feature <name>  - Create feature branch"
echo "  health-check           - Run project health check"
echo ""
echo "Run 'cat $SHELL_RC' to see all aliases"
