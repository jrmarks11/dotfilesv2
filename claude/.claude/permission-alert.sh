#!/bin/bash

# Check if user is viewing this tmux window
if [ -n "$TMUX" ]; then
  THIS_PANE=$(tmux display-message -p '#{pane_id}')
  ACTIVE_PANE=$(tmux list-clients -F '#{client_activity}:#{pane_id}' | sort -t: -k1 -nr | head -1 | cut -d: -f2)

  if [ "$THIS_PANE" = "$ACTIVE_PANE" ]; then
    exit 0
  fi
fi

PROJECT=$(basename "$PWD")
TITLE="${1:-Permission Required}"
MESSAGE="Claude needs attention in $PROJECT"

osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\" sound name \"Ping\""
