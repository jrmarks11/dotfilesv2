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
        return 1
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

deploy_stage_api() {
    local branch=$(git rev-parse --abbrev-ref HEAD)
    echo "Deploying branch '$branch' to api-staging..."
    gh workflow run deploy_to_ecs.yml -f app=api-staging --ref "$branch"
}

jj() { __zoxide_zi "$@"; }
