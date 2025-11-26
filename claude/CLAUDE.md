# CLAUDE.md

Personal coding preferences and style guidelines for Claude Code.

## Implementation Scope - CRITICAL

**Golden Rule: Do ONLY What Is Asked**

When implementing a feature or fix:
- ❌ Do NOT refactor adjacent code
- ❌ Do NOT add extra error handling unless requested
- ❌ Do NOT create helper functions for single uses
- ❌ Do NOT add debug logging or console output
- ❌ Do NOT improve or clean up related code
- ❌ Do NOT add tests, documentation, or comments unless asked
- ❌ Do NOT add "while we're here" improvements

**Why:** Unnecessary additions create review overhead and often need to be removed.
The user knows their priorities better than the AI.

**Exception:** Critical bug fixes directly related to the change are acceptable.

**When in doubt, do less.** It's easier to add something later than remove unwanted code.

## Use Existing Code First - HIGH PRIORITY

Before implementing new code:

1. **Search for existing solutions**:
   ```bash
   # Find similar implementations
   rg "pattern_im_about_to_implement" apps/api/lib

   # Check for helpers in related modules
   rg "def.*error" apps/api/lib/bitfreighter/edi_pipeline
   ```

2. **Use established patterns**:
   - Error handling: Check `edi_pipeline` helpers like `catch_errors/2`
   - API patterns: Look at `Doctor.with` usage for with-style pipelines
   - GraphQL: Check existing resolvers for authorization patterns
   - Middleware: Can existing middleware be extended vs. creating new?

3. **Avoid duplication**:
   - Call existing functions rather than duplicating logic
   - Extend existing middleware rather than creating new ones
   - Fix at component level rather than per-instance

**If you find yourself writing something that feels like it might already exist, it probably does.**

## When to Ask Before Implementing - HIGH PRIORITY

Ask for clarification when:

1. **Ambiguous requirements**:
   - "Investigate X" might mean research only, not fix
   - "Add feature X" might not include related features Y and Z

2. **Multiple valid approaches**:
   - Briefly explain your planned approach and why
   - Ask if a simpler alternative would work
   - Example: "I could do X with approach A (simpler) or B (more robust). Which do you prefer?"

3. **Introducing new patterns**:
   - "I don't see an existing pattern for X. Should I create one or is there something I missed?"

4. **Critical missing details**:
   - Package manager (npm vs yarn vs pnpm)
   - Module names (verify exact names in codebase)
   - Whether to modify V1 or V2 version

5. **Solution feels wrong**:
   - "This feels hacky. Is there a better way?"
   - "This requires changing every resolver. Is there a middleware approach?"

**Better to ask than to implement something that needs to be rolled back.**

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
