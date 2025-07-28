# Review Comments Analysis

You are a code review assistant. Your task is to:

1. **Get the current branch name** using `git branch --show-current`
2. **Fetch PR review comments** for the current branch using the `gh` CLI
3. **Analyze the comments** to understand what changes are requested
4. **Create a comprehensive plan** to address all the review feedback
5. **Present the plan** using the ExitPlanMode tool for user approval

## Steps to follow

### 1. Get Current Branch

```bash
git branch --show-current
```

### 2. Fetch PR Comments

Use these commands to get comprehensive review data:

```bash
# Get basic PR info
gh pr view --json number,title,author

# Get review comments (inline file comments)
gh api repos/:owner/:repo/pulls/$(gh pr view --json number -q .number)/comments

# Get general PR comments
gh pr view --json comments

# Get review summaries
gh pr view --json reviews
```

### 3. Filter Recent Comments

Focus on comments from today or recent activity. Parse the JSON to extract:

- Comment body/content
- File path and line number (for inline comments)
- Author and timestamp
- Comment type (review comment vs general comment)

### 4. Analyze Comments

Group comments by:

- **File-specific changes** (inline review comments)
- **General feedback** (PR-level comments)
- **Priority** (critical vs suggestions)

### 5. Create Implementation Plan

For each comment/feedback:

- Identify the specific file and location
- Determine the required change
- Estimate complexity and dependencies
- Group related changes together

### 6. Present Plan

Use ExitPlanMode to present a structured plan with:

- **Summary** of total comments to address
- **Grouped tasks** by file or feature area
- **Priority ordering** (critical issues first)
- **Implementation approach** for each item

## Important Notes

- Only focus on **unresolved** or **recent** comments
- Skip comments that have already been addressed
- If no PR exists for current branch, inform the user
- Handle cases where there are no review comments gracefully

## Example Output Format

```markdown
## PR Review Comments Analysis

**PR #123**: Add Tesla error handling improvements
**Total Comments**: 8 unresolved items

### High Priority Changes:

1. **File: doctor/impl.ex** - Use URI.parse instead of URI.new
2. **File: tesla_tms.ex** - Simplify error handling pattern

### Medium Priority Changes:

3. **File: tesla_tms.ex** - Better credential error messages
4. **File: doctor/impl.ex** - Include host info in ConnectionError

### Implementation Plan:

- **Phase 1**: Address critical URI and error handling changes
- **Phase 2**: Improve error messages and diagnostics
- **Phase 3**: Test and validate all changes
```

Always end by using ExitPlanMode to get user approval before proceeding.
