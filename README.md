# Personal Dotfiles

A comprehensive macOS development environment setup focused on terminal-based
development with Neovim, tmux, and zsh. Optimized for Elixir development with
modern tooling.

## Core Tools

- **Neovim**: Heavily configured editor with snacks.nvim for navigation
- **Ghostty**: Primary terminal emulator
- **Tmux**: Terminal multiplexer with custom session management
- **Zsh**: Shell with zinit plugin manager
- **Git**: Version control with custom utilities

## Key Features

- **Smart Navigation**: Snacks picker for fuzzy finding (replaces fzf in neovim)
- **Session Management**: Tmux + sesh for project switching
- **Elixir Development**: Full LSP, testing, and formatting setup
- **Keyboard Optimization**: Karabiner remaps Option+hjkl to arrows
- **Symlink Management**: GNU Stow for organized configuration

## Quick Setup

```sh
# Install dependencies
./macos/brew.sh

# Symlink configurations
stow config
stow tmux
stow zsh
```

## Applications Configured

### **Terminal & Shell**

- Ghostty, iTerm2, Tmux, Zsh

### **Development**

- Neovim (extensive plugin setup), Git, GitHub CLI, GitHub Copilot

### **System Tools**

- Karabiner (keyboard remapping), FileZilla, yamllint

### **Custom Scripts**

- Git branch cleanup, Docker utilities, Development helpers

## Documentation

- `CLAUDE.md`: Detailed architecture and usage guide
- `docs/`: Additional documentation (plugins, workflows)

## Troubleshooting

### Common Issues

- **Stow conflicts**: Remove existing dotfiles before stowing: `rm ~/.zshrc ~/.tmux.conf`
- **Missing dependencies**: Run `./macos/brew.sh` before stowing configurations
- **Node version conflicts**: Copilot uses Homebrew node (`/opt/homebrew/bin/node`), asdf manages command-line node

For detailed configuration information, see [CLAUDE.md](CLAUDE.md).
