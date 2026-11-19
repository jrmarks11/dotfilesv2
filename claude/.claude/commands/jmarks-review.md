---
description: Two-reader review (inline + blind Opus verifier) that reports only postable findings and drafts the GitHub review
argument-hint: "[PR number | branch | Jira key | title fragment]... [--full] [--fresh] [--draft], defaults to current branch vs master"
---

Review the target(s) in $ARGUMENTS. Two independent readers, one merged list, one draft GitHub review. Report only what would be posted.

## Step 1: resolve target(s) and gather state

Arguments may contain one or more targets and the flags `--full`, `--fresh`, and `--draft`.

For each target:
- PR number or URL: use as is.
- Otherwise resolve in order: `gh pr list --state all --head <arg> --json number,title,headRefName,author,state`, then `gh pr list --state all --search "<arg>" --json ...`, then `git branch -r --list "*<arg>*"`. Exactly one match: print `Reviewing PR #n: <title> (<branch>)` and continue. Zero or several: list the candidates and stop. Never guess.
- No argument: current branch vs master (`git diff master...HEAD`), no PR.

Per PR, gather once:

```bash
gh pr view <n> --json title,body,author,state,baseRefName,headRefName,headRefOid,additions,deletions,reviews,reviewDecision,comments,commits,statusCheckRollup
gh api repos/bitfreighter/bitfreighter/pulls/<n>/comments --paginate
gh pr diff <n> > <scratchpad>/pr-<n>.diff
```

Before anything else, record the current branch and the local branches: `git branch --show-current` and `git branch --format='%(refname:short)'`. Keep the list in context; do not write it to a file.

Branch targets: `git fetch origin <branch>` then `git diff origin/master...origin/<branch>`. Record changed-line count (additions + deletions) for the cap.

Decide the mode:
- **Re-review** if a review by jmarks already exists on the PR. Read his prior inline comments and the author's replies. The diff to review is only the commits after his last review. Report which prior questions are addressed or answered, then new findings on the new commits only.
- **Author** if the PR author is jmarks, or the target is the current branch with no PR. Run the review, skip the GitHub draft, end with "say which to fix". Do not fix or commit anything unless told.
- **Batch** if several targets: run steps 2 to 6 per target, then present drafts one at a time in order.
- **Full** if `--full`: report every confirmed finding (still no nits); the draft is a COMMENT with body `Ran a review pass on this and added the findings inline.`
- **Fresh** if `--fresh`: ignore existing reviews and threads and review the whole diff as a first review (for calibrating against a past review). Print the report and draft but do not offer to submit.
- **Draft** if `--draft`, or if you are running as a subagent with no user to say "go": run steps 1 to 6, print the step 7 payload, then go straight to step 8. Do not wait, do not submit, and post nothing to GitHub (no review, comment, reply, reaction, or approval). End your final message with the step 6 report and the payload so the caller can post it.

## Step 2: launch the blind reader before you read the diff

Launch ONE Agent (`subagent_type: blind-reader`, background) before reading any of the diff yourself. Do not pass `model`; the agent profile sets it. The profile holds the review instructions, the exclusion list, and the output schema, so the brief is only the target and how to fetch the diff. Never give it your findings or anything from this conversation. Brief, verbatim:

> Review the diff for <target>. Fetch it with `<command>` from `<worktree path>`; base is master.

If the `blind-reader` agent type is not available, stop and say so. Do not fall back to another agent type.

## Step 3: inline pass while the subagent runs

Invoke the `bf-review` skill against the target and diff already resolved in step 1. That command owns what counts as a finding: the trigger rule, the exclusion list, where to look, the priority order, and the reference doc check. Do not restate any of it here, and edit it there when the standard changes.

It returns its own report with severities and stated triggers. Convert each finding into this schema privately, which is what makes step 4 a merge:

```
{file, line, tier: blocker|question, likelihood: routine|occasional|rare, introduced_by_pr: true|false, trigger, one_line_question}
```

`critical` becomes `blocker`, `warning` becomes `question`, nits are dropped. `likelihood` is yours to assign: `routine` means normal traffic or data hits it, `occasional` means deploys, retries, or config changes hit it, `rare` means it needs a manual operator action or an outside failure. `one_line_question` is yours to write, a single friendly sentence ending in "?" phrased as a question about behavior rather than a claim. Do not show the list yet.

## Step 4: merge and refute

Wait for the blind reader. Its result arrives on its own when it finishes; do not poll for it and do not start step 4 without it. Then:

- Corroborated (both lists, same root cause): keep, tier is the higher of the two, likelihood is the more frequent of the two.
- Yours only: try to refute each with a concrete callsite, fixture, or test. Refuted: drop. Otherwise keep.
- Subagent's only: `SendMessage` the list back to the same agent: "Attack each of these. Return REFUTED with evidence or CONFIRMED with the trigger." Refuted: drop.
- Anything without a stated trigger after this step: drop. Unsure findings are dropped here, never shown. Reference doc findings are exempt, as bf-review says, but drop them unless they name the sentence that no longer matches.
- Pre-existing (not introduced by this PR): drop unless blocker.
- Rare questions: drop. Rare blockers stay.
- Already raised in an existing review thread on the PR: if you agree and it is not yet addressed or answered, keep it as a 👍 on that comment (no text reply) and count its tier when choosing the event; otherwise drop.
- Optional, for a blocker only: temp checkout `git checkout -q -B review-<n> origin/<branch>`, run one targeted `mix test <file>`, then `git checkout -` and delete the temp branch.

If the subagent failed or was cut off, continue with your list alone and say so in the Coverage line.

## Step 5: cap

All blockers, always. Questions capped at `2 * ceil(changed_lines / 300)`, ranked correctness > security > consistency > reference docs. Dropped questions are not mentioned.

## Step 6: report (terminal only)

```
PR #<n>: <title>   <changed_lines> lines   CI: <pass|fail|pending>   <already reviewed by you on <date> | first review>
https://github.com/bitfreighter/bitfreighter/pull/<n>
Coverage: bf-review inline pass (<session model>) + blind reader (<reader model>, <finished | failed: reason>)

Blockers
  <file:line>  <one-line question exactly as it would be posted>
               why (<likelihood>): <one sentence, for you only>

Questions
  <file:line>  <one-line question>
               why (<likelihood>): <one sentence>

Dropped as rare
  <file:line>  <trigger in a few words>
```

Omit the `Dropped as rare` section when nothing was dropped for rarity.

Rules for the question lines: one short friendly sentence ending in "?", about behavior, never a declarative claim. No suggested fix unless it is a blocker. No code recap. No em dashes anywhere. No Claude attribution on the question lines themselves; the attribution trailer goes on the review body (step 7). A finding with no diff line to anchor to becomes one sentence in the review body instead. Nothing survives: print `<target>: nothing to post.` and still draft the approval.

Re-review mode adds a section above Blockers:

```
Prior questions
  <file:line>  <your question>  ->  <addressed in <sha> | answered: <one line> | open>
```

## Step 7: draft the GitHub review and wait

PR targets only (author mode and branch targets skip this). Print the exact payload, then stop and wait for "go". In draft mode, print the payload and skip to step 8.

Event and body:
- Any blockers: `COMMENT`, body counts the inline questions: `one question`, `a couple of questions`, or `a few questions`
- Questions only: `APPROVE`, body `lgtm`
- Nothing: `APPROVE`, body `lgtm`
- `--full`: `COMMENT`, body `Ran a review pass on this and added the findings inline.`
- Re-review with everything addressed and no blockers: `APPROVE`, body `lgtm`

Attribution trailer: every review body ends with a blank line and then `Assisted-by: <models>`. `<models>` is the display name of the model running this session, taken from your system prompt, followed by a comma and the blind reader's model, taken from the `model:` line at the end of its output (for example `Assisted-by: Claude Fable 5.2, Claude Opus 5.5`). If both are the same model, name it once. If the blind reader failed or gave no `model:` line, name only the session model. Never write just `Claude`, and never guess a model name. The trailer goes on the review body once, not on each inline comment. A text reply to an existing thread ends with the same trailer. A 👍 reaction carries none.

Payload, printed verbatim (the `why` lines are never included):

```json
{
  "commit_id": "<headRefOid>",
  "event": "<APPROVE|COMMENT>",
  "body": "<body>\n\nAssisted-by: <models>",
  "comments": [
    {"path": "<file>", "line": <line>, "side": "RIGHT", "body": "<one-line question>"}
  ]
}
```

One word from John switches the event ("approve" / "comment"); edits to any line are applied and the payload reprinted. On "go": write the JSON to the scratchpad, submit with `gh api repos/bitfreighter/bitfreighter/pulls/<n>/reviews --input <file>`, re-read `/pulls/<n>/comments` to confirm the inline comments landed, and report the review URL. No comments and an approval: `gh pr review <n> --approve --body $'lgtm\n\nAssisted-by: <models>'`. Re-review replies to an existing thread: `gh api repos/bitfreighter/bitfreighter/pulls/<n>/comments/<id>/replies -f body=...`. Agreed existing findings are listed under the payload as `👍 <comment id>` and posted on "go" with `gh api repos/bitfreighter/bitfreighter/pulls/comments/<id>/reactions -f content=+1`.

Never submit without the explicit go.

## Step 8: clean up local branches

After the review is submitted, or after the report when there is no submit, make sure you are on the branch recorded in step 1. Then delete every local branch that was not in the list recorded in step 1 with `git branch -D <branch>`. Report which branches were deleted.
