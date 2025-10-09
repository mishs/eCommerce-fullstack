# Setup Global Boilerplate - Step by Step

Follow these commands to make the setup script available globally AND save to GitHub.

---

## Part 1: Make Script Available Globally (5 minutes)

### Step 1: Create Global Scripts Directory

```bash
# Create the directory
mkdir -p ~/dev-scripts

# Copy the setup script
cp setup-monorepo.sh ~/dev-scripts/create-ecommerce-monorepo.sh

# Make it executable
chmod +x ~/dev-scripts/create-ecommerce-monorepo.sh

# Verify it's there
ls -l ~/dev-scripts/
```

### Step 2: Add to PATH and Create Alias

**For Zsh (macOS default):**
```bash
# Add to ~/.zshrc
cat >> ~/.zshrc << 'EOF'

# ============================================
# Global Dev Scripts
# ============================================
export PATH="$HOME/dev-scripts:$PATH"

# eCommerce monorepo boilerplate
alias create-ecommerce='create-ecommerce-monorepo.sh'

# Quick dev commands
alias dev='npm run dev'
alias test='npm test'

# Git shortcuts
alias gst='git status'
alias gaa='git add .'
alias gp='git push'
alias gpl='git pull'
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
EOF

# Reload your shell
source ~/.zshrc
```

**For Bash (Linux/older macOS):**
```bash
# Add to ~/.bashrc
cat >> ~/.bashrc << 'EOF'

# ============================================
# Global Dev Scripts
# ============================================
export PATH="$HOME/dev-scripts:$PATH"

# eCommerce monorepo boilerplate
alias create-ecommerce='create-ecommerce-monorepo.sh'

# Quick dev commands
alias dev='npm run dev'
alias test='npm test'

# Git shortcuts
alias gst='git status'
alias gaa='git add .'
alias gp='git push'
alias gpl='git pull'
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
EOF

# Reload your shell
source ~/.bashrc
```

### Step 3: Test It

```bash
# Test the alias
create-ecommerce --help

# Or test directly
which create-ecommerce-monorepo.sh
```

---

## Part 2: Save to GitHub for Multi-Machine Access (10 minutes)

### Step 1: Create Local Repo for Boilerplates

```bash
# Go to a good location (e.g., your projects folder)
cd ~/Documents/development

# Create the boilerplates repo
mkdir dev-boilerplates
cd dev-boilerplates

# Initialize git
git init

# Create structure
mkdir -p ecommerce-monorepo
mkdir -p scripts
mkdir -p docs
```

### Step 2: Copy All Files from This Project

```bash
# Copy the main setup script
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/setup-monorepo.sh \
   ./ecommerce-monorepo/

# Copy documentation
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/CLAUDE.md \
   ./ecommerce-monorepo/
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/GIT_COMMIT_STRATEGY.md \
   ./ecommerce-monorepo/
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/learnings-and-notes.md \
   ./ecommerce-monorepo/
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/IMPLEMENTATION_GUIDE.md \
   ./ecommerce-monorepo/
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/QUICK_REFERENCE.md \
   ./ecommerce-monorepo/

# Copy install script
cp /Users/mish/Documents/development/practise-and-redo/gpt-focused-cart-redo/install-aliases.sh \
   ./scripts/

# Make executable
chmod +x ecommerce-monorepo/setup-monorepo.sh
chmod +x scripts/install-aliases.sh
```

### Step 3: Create README

```bash
cat > README.md << 'EOF'
# Dev Boilerplates

Collection of production-ready project boilerplates and setup scripts.

## Available Boilerplates

### 📦 eCommerce Monorepo

Full-stack eCommerce application with React, TypeScript, Express, TanStack Query, and Zustand.

**Quick Start:**
```bash
# Create new project
mkdir my-ecommerce-app
cd my-ecommerce-app

# Run setup script
bash /path/to/dev-boilerplates/ecommerce-monorepo/setup-monorepo.sh

# Install dependencies
npm install

# Start development
npm run dev
```

**Includes:**
- ✅ React 18 + TypeScript + Vite
- ✅ Express + TypeScript backend
- ✅ TanStack Query (server state)
- ✅ Zustand (client state)
- ✅ Tailwind CSS
- ✅ Vitest testing setup
- ✅ ESLint + Prettier
- ✅ Rate limiting + Caching
- ✅ JWT Authentication
- ✅ Monorepo with npm workspaces

**Documentation:**
- [Git Commit Strategy](./ecommerce-monorepo/GIT_COMMIT_STRATEGY.md)
- [Learning Notes](./ecommerce-monorepo/learnings-and-notes.md)
- [Implementation Guide](./ecommerce-monorepo/IMPLEMENTATION_GUIDE.md)
- [Quick Reference](./ecommerce-monorepo/QUICK_REFERENCE.md)

---

## Installation

### On New Machine

```bash
# 1. Clone this repo
git clone https://github.com/YOUR_USERNAME/dev-boilerplates.git ~/dev-boilerplates

# 2. Install global aliases (optional)
bash ~/dev-boilerplates/scripts/install-aliases.sh

# 3. Add to PATH (add to ~/.zshrc or ~/.bashrc)
export PATH="$HOME/dev-boilerplates/scripts:$PATH"
```

### Update from Remote

```bash
cd ~/dev-boilerplates
git pull
```

---

## Usage

### Create New eCommerce Project

```bash
mkdir my-project
cd my-project
bash ~/dev-boilerplates/ecommerce-monorepo/setup-monorepo.sh
npm install
npm run dev
```

### Or with Global Alias

```bash
# After installing aliases
create-ecommerce
```

---

## Contributing

Add your own boilerplates to this repo!

1. Create a new folder
2. Add setup script
3. Add documentation
4. Update this README

---

## License

MIT - Use freely for your projects!
EOF
```

### Step 4: Create .gitignore

```bash
cat > .gitignore << 'EOF'
.DS_Store
*.log
node_modules/
EOF
```

### Step 5: Commit and Push to GitHub

```bash
# Add all files
git add .

# Initial commit
git commit -m "feat: add eCommerce monorepo boilerplate

- Full-stack React + Express setup
- TanStack Query + Zustand state management
- Complete documentation and learning guides
- Git commit strategy and implementation guide
- Global alias installer"

# Create repo on GitHub (do this manually or use gh cli)
# Option A: Manual - Go to github.com and create 'dev-boilerplates' repo

# Option B: Using GitHub CLI (if installed)
gh repo create dev-boilerplates --public --source=. --remote=origin

# Push to GitHub
git branch -M main
git push -u origin main
```

**If you don't have GitHub CLI:**
1. Go to https://github.com/new
2. Create repo named: `dev-boilerplates`
3. Don't initialize with README
4. Then run:
```bash
git remote add origin https://github.com/YOUR_USERNAME/dev-boilerplates.git
git branch -M main
git push -u origin main
```

---

## Part 3: Use on Another Machine

### First Time Setup on New Machine

```bash
# 1. Clone your boilerplates
git clone https://github.com/YOUR_USERNAME/dev-boilerplates.git ~/dev-boilerplates

# 2. Install aliases
bash ~/dev-boilerplates/scripts/install-aliases.sh

# 3. Add to PATH (in ~/.zshrc or ~/.bashrc)
echo 'export PATH="$HOME/dev-boilerplates/ecommerce-monorepo:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Create New Project

```bash
# Anywhere on your machine
mkdir awesome-shop
cd awesome-shop
setup-monorepo.sh
npm install
npm run dev
```

---

## ✅ Verification Checklist

After setup, verify:

- [ ] `create-ecommerce` command works globally
- [ ] `gc` function works (try: `gc test example "test commit"`)
- [ ] GitHub repo is public and accessible
- [ ] Can clone repo on different machine
- [ ] Documentation is readable on GitHub

---

## 🎯 What You Now Have

1. **Local Global Access**: Run `create-ecommerce` from anywhere
2. **GitHub Backup**: All your boilerplates saved online
3. **Multi-Machine**: Clone on any computer
4. **Reusable**: Start new projects in seconds
5. **Learning Resource**: All documentation preserved

---

## 📚 Next Steps

1. Test creating a new project in a different folder
2. Add more boilerplates (React SPA, Next.js, etc.)
3. Share with teammates
4. Keep it updated as you learn new patterns
EOF
