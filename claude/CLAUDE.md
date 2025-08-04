# CLAUDE.md

Personal coding preferences and style guidelines for Claude Code.

## Code Style Preferences

- **Duplication**: Always look out for excessive duplication and refactor when found
- **Comments**: Only add comments when explicitly requested
- **Existing Comments**:
  Preserve all existing comments unless explicitly asked to modify them
- **Implementation Focus**:
  Prioritize current functionality over backwards compatibility unless explicitly
  requested
- **Code Quality**:
  Focus on implementation and functionality - run tests, lint, format, or type-checks
  only when specifically requested

## Development Environment

- **Primary Editor**: nvim with fzf-lua for navigation and snacks.nvim for utilities
- **Terminal**: ghostty with tmux for session management
- **Shell**: zsh with zinit plugin manager
- **Package Manager**: asdf for version management
- **Dotfiles Management**: stow for symlink management

## Key Tools and Utilities

- **File Navigation**: fzf-lua with frecency support
- **Search**: ripgrep (rg), fd
- **Git**: Enhanced with gitsigns.nvim, custom scripts in `~/bin/`
- **Modern CLI**: bat, eza instead of cat, ls
- **Session Management**: sesh for tmux session picking

## Development Focus

- **Primary Language**: Elixir with comprehensive LSP, formatting, and testing setup
- **Workflow**: Heavy use of fuzzy finding and keyboard-driven navigation
- **Project Management**: tmux sessions with sesh for quick switching

## Important Notes

- Configuration optimized for keyboard-driven development
- Prefers refactoring over duplication
- Uses stow for all dotfile symlinking - avoid manual symlinks
- Custom scripts in `~/bin/` for common development tasks

