#!/usr/bin/env zsh

fzf_down() {
    fzf --height 50% "$@" --border
}

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

not_bf_master() {
    if [[ $(basename `git rev-parse --show-toplevel`) != "bitfreighter" ]]; then
        return
    fi

    CURRENTBRANCH=$(git status|awk 'NR==1{print $3}')

    if [[ $CURRENTBRANCH == "master" ]]; then
        echo "You are on master you donkey!"
        1 > /dev/null 2>&1
    fi
}

ga() {
    is_in_git_repo && not_bf_master || return

    if [[ $# -eq 0 ]] ; then
        echo "git add ."
        git add .
    else
        echo "git add $@"
        git add "$@"
    fi
}

gb() {
    is_in_git_repo || return

    if [[ $# -eq 0 ]] ; then
        git branch -a --color=always | grep -v '/HEAD\s' | sort |
        fzf_down --ansi --multi --tac | sed 's/^..//' | cut -d' ' -f1 |
        sed 's#^remotes/origin/##' | xargs git checkout
    else
        git branch "$@"
    fi
}
_JM_git_branch_names () {
    compadd "${(@)${(f)$(git branch)}#??}"
}
compdef _JM_git_branch_names gb

gc() {
    is_in_git_repo && not_bf_master || return

    if [[ $# -eq 0 ]] ; then
        git commit --verbose
    else
        git commit -m "$1"
    fi
}

gush() {
    is_in_git_repo && not_bf_master || return
    git push
}

tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ "$1" ]; then
        tmux $change -t "$1" 2>/dev/null ||
        (tmux new-session -d -s "$1" && tmux $change -t "$1"); return
    fi
    if (( $(tmux list-sessions | wc -l) == 1 )); then
        session=$(tmux list-sessions -F "#{session_name}")
    else
        session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0)
    fi
    tmux $change -t "$session" || tm "$(whoami)"
}

gdl() {
    if [[ "$#" == "0" ]]; then
        git diff @~
    else
        git diff "@~$@"
    fi
}

gpr() {
    gh pr view --web
    if [ $? -ne 0 ]; then
        gh pr create --web
    fi
}

deploy_api() {
    gh workflow run deploy_to_ecs.yml -f app=api
}

deploy_app() {
    gh workflow run run_playbook.yml -f playbook=deploy_app.yml
}

deploy_as2lib() {
    gh workflow run deploy_to_ecs.yml -f app=as2lib
}

deploy_timezones() {
    gh workflow run deploy_to_ecs.yml -f app=timezones
}

gs_code() {
    is_in_git_repo || return

    FILE=$(git status --porcelain | sed 's/^.. //' | fzf --ansi --layout=reverse \
            --preview 'git diff --color=always HEAD -- {}' \
        --bind 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up')
    [ -n "$FILE" ] && cursor "$FILE"
}

gd_code() {
    is_in_git_repo || return

    FILE=$(git diff --name-only master | fzf --ansi --layout=reverse \
            --preview 'git -C $(git rev-parse --show-toplevel) diff master --color=always -- {}' \
        --bind 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up')

    [ -n "$FILE" ] && cursor "$FILE"
}

rg_code() (
    RELOAD='reload:rg --column --color=always --smart-case --hidden {q} || :'
    local selected=$(
        fzf --disabled --ansi --multi \
            --bind "start:$RELOAD" --bind "change:$RELOAD" \
            --delimiter : \
            --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
            --query "$*"
    )

    if [[ -n "$selected" ]]; then
        # Split out file and line number
        local file="$(echo "$selected" | cut -d: -f1)"
        local line="$(echo "$selected" | cut -d: -f2)"
        cursor -g "$file:$line"
    fi
)
