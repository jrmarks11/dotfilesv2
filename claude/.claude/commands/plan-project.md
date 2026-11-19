---
description: Break a Linear project or large card into ordered, parallelizable cards, inline in chat, then draft the cards on approval
argument-hint: "[Linear project name | project URL | issue key], plus any notes on scope"
---

Plan the work in $ARGUMENTS with John. This is a conversation: propose, stop, and revise on his answers. Nothing is created in Linear and no file is written until he says so.

## Step 1: read the current state

- Resolve the target in Linear (project, or a parent issue and its children). Read the project description, every open issue with its status and assignee, and the comments on issues that are in progress or blocked.
- Read the memory files that mention the project. They hold decisions that are not on the cards.
- Read the code the project touches. If that means sweeping many files, spawn one `researcher` agent with a specific question and use its answer; do not spawn one per card.
- Check open PRs and local branches for work already started: `gh pr list --author @me` and `git worktree list`.

## Step 2: state what is done and what is left

Print three short lists: done, in progress (with who and which PR), and not started. Flag any card whose description no longer matches the code.

## Step 3: propose the breakdown

One table, in the order the work should happen:

| # | Card title | What the user gets | Size | Depends on | Agent |
|---|---|---|---|---|---|

- Title and "what the user gets" are non-technical, written as an outcome.
- Size is S (under a day), M (one to two days), or L (should be split; say how).
- Depends on names other rows. Rows with no unmet dependency can run at the same time; say how many worktrees that uses.
- Agent is `engineer` for a scoped change, `senior-engineer` for a row whose cause or design is not yet known, or `John` for a row that is a decision, not code.

Under the table, list:
- Decisions that are John's to make, each as one question with your recommendation.
- Risks: migrations, auth, schema changes that need an API docs changelog entry, anything touching production data.
- What you left out of scope and why.

Keep file paths and implementation approach out of the table. Put them in a short "approach" note per row only where the approach is not obvious.

Then stop and wait.

## Step 4: revise

Apply John's changes and reprint the table. Repeat until he says go. Do not re-argue a decision he has made.

## Step 5: draft the cards

On go, draft each new card with the `bf-linear-card` skill, in table order. Show each draft and create it only after he approves that draft. Set the dependency links between cards after they exist. Existing cards that need a changed description are shown as a before and after and updated only on approval.

## Rules

- The plan stays in chat. Do not write it to a file.
- Never use em dashes.
- Do not start implementing. When the cards exist, say which rows can start now and stop.
