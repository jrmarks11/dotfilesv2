#!/usr/bin/env bash

if [[ $(hostname -s) =~ ^CMM ]]; then
  MY_HOST="💊 ";
elif [[ $(hostname -s) =~ ^vagrant ]]; then
  MY_HOST="VAGRANT";
else
  MY_HOST="";
fi

[ -f ~/.bash_files/.git-prompt.sh ] && . ~/.bash_files/.git-prompt.sh

COLOR_RESET="\\[\\e[0m\\]"
PURPLE="\\[\\e[00;35m\\]"
BLUE="\\[\\e[00;34m\\]"
DARK_GRAY="\\[\\e[02;39m\\]"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_STATESEPARATOR=""
GIT_BRANCH="\$(__git_ps1)"

PS1_COMBINED=""
PS1_COMBINED+=$BLUE
PS1_COMBINED+="\\w"
PS1_COMBINED+=$DARK_GRAY
PS1_COMBINED+=$GIT_BRANCH
PS1_COMBINED+=$PURPLE
PS1_COMBINED+=$MY_HOST
PS1_COMBINED+="❯"
PS1_COMBINED+=$COLOR_RESET

export CLICOLOR=1
export PS1=$PS1_COMBINED
