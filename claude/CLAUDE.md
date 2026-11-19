# CLAUDE.md

Personal coding preferences and style guidelines for Claude Code.

## Implementation Scope

I like to ask questions. When a question is asked, answer it, and stop. Do not
edit files. Do not run commands that would modify/undo changes.

Mannered prose substitutes metaphor and flourish for direct statement. Instead
of "a parameter worth varying," the mannered writer produces "a dial worth
turning." Instead of "this point still matters," they write "this point earns
its keep." The phrases exist to display the writer, not to convey the idea, and
readers can tell. That is why mannered prose irritates: it makes the reader work
harder so the writer can perform. It is also imprecise. Metaphors drag in
connotations the writer did not choose and cannot control. The fix is to say
what you mean. When a literal phrase is available, use it.

Never use em dashes, in any medium. Restructure the sentence rather than
substituting an en dash or a hyphen.

## Do only what is asked

When implementing a feature or fix, do not:

- Refactor adjacent code
- Add extra error handling unless requested
- Create helper functions for single uses
- Add debug logging or console output
- Improve or clean up related code
- Add documentation or comments unless asked
- Add "while we're here" improvements

Why: Unnecessary additions create review overhead and often need to be removed.
The user knows their priorities better than the AI.

Exception: Critical bug fixes directly related to the change are acceptable.

Exception: When the change would copy existing logic, refactor so both places
share it.

When in doubt, do less. It's easier to add something later than remove
unwanted code.

## Use Existing Code First

Fix at component level rather than per-instance.

## When to Ask Before Implementing

Ask for clarification when:

1. **Ambiguous requirements**:
   - "Investigate X" might mean research only, not fix
   - "Add feature X" might not include related features Y and Z

1. **Multiple valid approaches**:
   - Briefly explain your planned approach and why
   - Ask if a simpler alternative would work
   - Example: "I could do X with approach A (simpler) or B (more robust).
     Which do you prefer?"

1. **Introducing new patterns**:
   - "I don't see an existing pattern for X. Should I create one or is there
     something I missed?"

1. **Critical missing details**:
   - Module names (verify exact names in codebase)
   - Whether to modify V1 or V2 version

1. **Solution feels wrong**:
   - "This feels hacky. Is there a better way?"
   - "This requires changing every resolver. Is there a middleware approach?"

Better to ask than to implement something that needs to be rolled back.

## Code Style Preferences

- **Readability over conciseness**: Always prefer the clearer form, even when it
  takes more lines. Don't lean on a shorter construct that the next reader has to
  decode. In Elixir, don't use `x && value` as a conditional expression; write an
  explicit `if`.
- **Duplication**: Don't copy existing logic; refactor so both places share it
- **Implementation Focus**:
  Prioritize current functionality over backwards compatibility unless explicitly
  requested
