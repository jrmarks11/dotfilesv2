# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Overview

This is a personal dotfiles repository for macOS development using nvim, tmux,
and zsh. The neovim configuration uses snacks.nvim picker
as the primary fuzzy finder and navigation tool, with a focus on Elixir
development.

## Setup Commands

```sh
# Initial setup (requires Homebrew)
./macos/brew.sh
stow config
stow tmux
stow zsh
```

## Key Tools Installed

- **nvim**: Primary editor with snacks.nvim for navigation/picking
- **tmux**: Terminal multiplexer
- **zsh**: Shell with zinit plugin manager
- **asdf**: Version manager
- **bat, eza, fd, ripgrep**: Modern CLI utilities
- **sesh**: Session manager for tmux
- **stow**: Symlink farm manager for dotfiles
- **fzf**: Used for tmux session selection (sesh_picker)

## Architecture

The repository is organized by application configuration:

### Configuration Directory (`config/.config/`)

**Terminal Applications:**

- `ghostty/`: Terminal emulator (primary)

**Development Tools:**

- `nvim/`: Primary editor with extensive plugin ecosystem
- `git/`: Global git ignore patterns
- `gh/`: GitHub CLI configuration
- `github-copilot/`: GitHub Copilot authentication
- `claude/`: Claude Code configuration

**System Tools:**

- `karabiner/`: Keyboard customization (Option+hjkl → arrows)
- `yamllint/`: YAML linting configuration
- `filezilla/`: FTP client configuration

### Other Directories

- `tmux/`: Terminal multiplexer configuration
- `zsh/`: Shell configuration and environment
- `git/`: Global git configuration
- `bfgit/`: Work-specific git configuration
- `scripts/bin/`: Custom utility scripts
- `macos/`: macOS setup and Homebrew scripts

## Neovim Configuration

**Primary Navigation:** Uses snacks.nvim picker for all fuzzy finding:

- `Space+t`: Frecency file picker
- `Space+j`: Live grep
- `Space+b`: Branch files
- `Space+g`: Git status
- `Space+r`: Recent files
- `Space+h`: Help tags
- `Space+n`: All files

**Key Plugins:**

- `snacks.nvim`: Primary fuzzy finder with picker for all navigation, plus utilities and notifications
- `blink.cmp`: Modern completion engine
- `catppuccin`: Colorscheme
- `conform.nvim`: Code formatting
- `nvim-lint`: Linting
- `gitsigns.nvim`: Git integration
- `vim-test`: Test runner (Elixir-focused)

**Language Focus:** Heavily configured for Elixir development with LSP,
formatting, testing, and project navigation.

## Custom Scripts

Located in `scripts/bin/`:

- `sesh_picker`: Interactive tmux session selector using fzf
- `git-bclean`: Cleanup merged git branches (preserves master/production)
- `bf-*`: BitFreighter project-specific development scripts
- `docker-clean.sh`: Docker cleanup utility

## Development Workflow

The setup assumes heavy use of:

- **snacks.nvim** for all file/symbol navigation (primary picker), notifications, undo history, and utility functions
- **fzf** for tmux session management (via sesh)
- **tmux** for session management
- **stow** for symlink management of dotfiles
- **Elixir-focused** development with comprehensive tooling

## Important Notes

- Neovim uses snacks.nvim for primary navigation and utilities
- Configuration is optimized for Elixir development
- Uses stow for symlink management - avoid manual symlinking
- Custom scripts in `scripts/bin/` are designed for specific workflows
- Karabiner remaps Option+hjkl to arrow keys for navigation
