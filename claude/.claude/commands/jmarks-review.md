---
description: Two-reader review (inline + blind Opus verifier) that reports only postable findings and drafts the GitHub review
argument-hint: "[PR number | branch | Jira key | title fragment]... [--full] [--fresh], defaults to current branch vs master"
---

Review the target(s) in $ARGUMENTS. Two independent readers, one merged list, one draft GitHub review. Report only what would be posted.

## Step 1: resolve target(s) and gather state

Arguments may contain one or more targets and the flag `--full`.

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

Branch targets: `git fetch origin <branch>` then `git diff origin/master...origin/<branch>`. Record changed-line count (additions + deletions) for the cap.

Decide the mode:
- **Re-review** if a review by jmarks already exists on the PR. Read his prior inline comments and the author's replies. The diff to review is only the commits after his last review. Report which prior questions are addressed or answered, then new findings on the new commits only.
- **Author** if the PR author is jmarks, or the target is the current branch with no PR. Run the review, skip the GitHub draft, end with "say which to fix". Do not fix or commit anything unless told.
- **Batch** if several targets: run steps 2 to 6 per target, then present drafts one at a time in order.
- **Full** if `--full`: report every confirmed finding (still no nits); the draft is a COMMENT with body `Ran a review pass on this and added the findings inline.`
- **Fresh** if `--fresh`: ignore existing reviews and threads and review the whole diff as a first review (for calibrating against a past review). Print the report and draft but do not offer to submit.

## Step 2: launch the blind reader before you read the diff

Launch ONE Agent (`subagent_type: general-purpose`, `model: opus`, background) before reading any of the diff yourself. Give it only the target and how to fetch the diff. Never give it your findings or anything from this conversation. Brief, verbatim:

> Review the diff for <target> (fetch it with `<command>`; base is master). Assume a careful first reviewer has already read this diff top to bottom. Your job is what they structurally miss. Spend your effort on:
> 1. Removed or changed clauses: what depended on the old behavior. Grep every caller of every changed function and every pattern match on every changed return shape.
> 2. State written on one path and read on another: fields, flags, queue states, preloads, Oban job args.
> 3. nil, empty, and NotLoaded paths introduced by the change.
> 4. Schema vs migration vs DB constraint mismatches.
> 5. Error tuples whose shape changed and who matches on them.
>
> Report a finding only if you can state the concrete trigger: this input or state leads to this wrong output or crash, with file:line for both the cause and the consumer. If you cannot state the trigger, do not report it.
>
> Do not report: pre-existing issues on unchanged lines; style, naming, or duplication unless a CLAUDE.md names it; missing tests or docs; anything the compiler, credo, dialyzer, or CI would catch; "consider" suggestions; behavior changes that are the intended purpose of the PR.
>
> Output only a list, no prose. Each item: `{file, line, tier: blocker|question, introduced_by_pr: true|false, trigger, one_line_question}`. `blocker` means it will break in practice or ship a security or data problem. `question` means a real gap worth asking about. `one_line_question` is a single friendly sentence ending in "?" phrased as a question about behavior, not a claim.

## Step 3: inline pass while the subagent runs

Read the diff and the surrounding code. Same priority order as always: correctness, security, consistency with existing patterns, use of existing helpers, performance, error handling. Same reachability rule and exclusion list as the brief. Produce the same schema privately. Do not show it yet.

## Step 4: merge and refute

Wait for the subagent (`TaskOutput`, block). Then:

- Corroborated (both lists, same root cause): keep, tier is the higher of the two.
- Yours only: try to refute each with a concrete callsite, fixture, or test. Refuted: drop. Otherwise keep.
- Subagent's only: `SendMessage` the list back to the same agent: "Attack each of these. Return REFUTED with evidence or CONFIRMED with the trigger." Refuted: drop.
- Anything without a stated trigger after this step: drop. Unsure findings are dropped here, never shown.
- Pre-existing (not introduced by this PR): drop unless blocker.
- Already raised in an existing review thread on the PR: drop.
- Optional, for a blocker only: temp checkout `git checkout -q -B review-<n> origin/<branch>`, run one targeted `mix test <file>`, then `git checkout -` and delete the temp branch.

If the subagent failed or was cut off, continue with your list alone and say so in the Coverage line.

## Step 5: cap

All blockers, always. Questions capped at `2 * ceil(changed_lines / 300)`, ranked correctness > security > consistency. Dropped questions are not mentioned.

## Step 6: report (terminal only)

```
PR #<n>: <title>   <changed_lines> lines   CI: <pass|fail|pending>   <already reviewed by you on <date> | first review>
Coverage: inline pass + blind Opus verifier (<finished | failed: reason>)

Blockers
  <file:line>  <one-line question exactly as it would be posted>
               why: <one sentence, for you only>

Questions
  <file:line>  <one-line question>
               why: <one sentence>
```

Rules for the question lines: one short friendly sentence ending in "?", about behavior, never a declarative claim. No suggested fix unless it is a blocker. No code recap. No em dashes anywhere. No Claude attribution unless `--full`. A finding with no diff line to anchor to becomes one sentence in the review body instead. Nothing survives: print `<target>: nothing to post.` and still draft the approval.

Re-review mode adds a section above Blockers:

```
Prior questions
  <file:line>  <your question>  ->  <addressed in <sha> | answered: <one line> | open>
```

## Step 7: draft the GitHub review and wait

PR targets only (author mode and branch targets skip this). Print the exact payload, then stop and wait for "go".

Event and body:
- Any blockers: `COMMENT`, body `A few questions.`
- Questions only: `APPROVE`, body `lgtm, couple questions`
- Nothing: `APPROVE`, body `lgtm`
- `--full`: `COMMENT`, body `Ran a review pass on this and added the findings inline.`
- Re-review with everything addressed and no blockers: `APPROVE`, body `lgtm`

Payload, printed verbatim (the `why` lines are never included):

```json
{
  "commit_id": "<headRefOid>",
  "event": "<APPROVE|COMMENT>",
  "body": "<body>",
  "comments": [
    {"path": "<file>", "line": <line>, "side": "RIGHT", "body": "<one-line question>"}
  ]
}
```

One word from John switches the event ("approve" / "comment"); edits to any line are applied and the payload reprinted. On "go": write the JSON to the scratchpad, submit with `gh api repos/bitfreighter/bitfreighter/pulls/<n>/reviews --input <file>`, re-read `/pulls/<n>/comments` to confirm the inline comments landed, and report the review URL. No comments and an approval: `gh pr review <n> --approve --body lgtm`. Re-review replies to an existing thread: `gh api repos/bitfreighter/bitfreighter/pulls/<n>/comments/<id>/replies -f body=...`.

Never submit without the explicit go.
