# CLAUDE.md

Personal coding preferences and style guidelines for Claude Code.

## Code Style Preferences

- **Duplication**: Always look out for excessive duplication and refactor when found
- **Comments**: Remove all comments from new code
- **Existing Comments**:
  Preserve all existing comments unless explicitly asked to modify them
- **Implementation Focus**:
  Prioritize current functionality over backwards compatibility unless explicitly
  requested
- **Elixir nits**
  use List.wrap() instead of something || []
