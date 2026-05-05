Perform a detailed code review of the current branch or github pull request.

if its a branch First, determine the base branch by checking if "master" exists, otherwise use "main":

```bash
git rev-parse --verify master >/dev/null 2>&1 && echo master || echo main
```

Then get the full diff of this branch against the base branch:

```bash
git diff <base_branch>...HEAD
```

Also get the list of commits on this branch:

```bash
git log <base_branch>..HEAD --oneline
```

if its a pull request look at the diff using gh cli

Before reviewing, read the surrounding code and related modules to understand existing patterns, conventions, and standards used in the codebase. The review should check that new code follows established patterns rather than introducing divergent approaches.

Review the diff for the following, in priority order:

1. **Correctness**: Logic errors, off-by-one errors, null/nil handling, race conditions, broken functionality
2. **Security**: Injection risks, auth issues, sensitive data exposure, OWASP top 10
3. **Consistency with codebase**: Does the new code follow existing patterns, naming conventions, error handling approaches, and architectural standards already established in the project? Call out where it diverges.
4. **Performance**: N+1 queries, unnecessary allocations, missing indexes, unbounded loops
5. **Error handling**: Unhandled edge cases, swallowed errors, missing validations
6. **Design**: Coupling, cohesion, single responsibility, API design
7. **Readability**: Naming, complexity, dead code, confusing control flow

For each finding, include:
- **Severity**: critical / warning / nit
- **File and line reference**
- **What the issue is**
- **Suggested fix**

**Reporting rules:**
- If there are any **critical** findings, report ONLY criticals.
- If there are zero criticals, report **warnings** only.
- If there are zero criticals and zero warnings, report **nits**.
- If the diff is clean at all levels, say so — don't manufacture issues.
