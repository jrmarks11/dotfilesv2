if test -d /opt/homebrew
  set -gx HOMEBREW_PREFIX "/opt/homebrew"
  set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
  set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/homebrew"
end

fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;

if test -f (brew --prefix asdf)/libexec/asdf.fish
    source (brew --prefix asdf)/libexec/asdf.fish
end

fzf --fish | source

abbr --add .. 'cd ..'
abbr --add cat 'bat'
abbr --add cd 'z'
abbr --add d 'docker'
abbr --add dc 'docker-compose'
abbr --add dps 'docker ps --format "table {{.Names}}\t{{.Status}}"'
abbr --add dsp 'docker system prune'
abbr --add gco 'git checkout'
abbr --add gd 'git diff'
abbr --add gdm 'git diff master'
abbr --add ghs 'git hs'
abbr --add gs 'git status -s'
abbr --add gull 'git pull'
abbr --add j 'z'
abbr --add l. 'fd -Hd 1 -t l -0 | xargs -0 eza -lad'
abbr --add l2 'eza -laT -L 2'
abbr --add l3 'eza -laT -L 3'
abbr --add l 'eza -l'
abbr --add la 'eza -la'
abbr --add ls 'eza'
abbr --add lt 'eza -laT'
abbr --add s. 'source ~/.config/fish/config.fish'
abbr --add sc 'sesh connect (sesh list | fzf)'
abbr --add up 'brew upgrade; brew cleanup -s; nvim --headless "+Lazy! update" +qa'
abbr --add vim 'nvim'

zoxide init fish | source

set -Ux TERM xterm-256color
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git'

set -gx BAT_THEME "base16"
set -Ux GIT_PAGER delta
set -Ux EDITOR nvim

if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add
end

fish_default_key_bindings -M insert
fish_vi_key_bindings --no-erase insert

set fish_key_timeout 10

function ll
    for file in (fd -Hd 1 -t l)
        eza -lad "$file"
    end
end

function fzf_down
    fzf --height 50% $argv --border
end

function is_in_git_repo
    git rev-parse HEAD > /dev/null 2>&1
end

function not_bf_master
    if test (basename (git rev-parse --show-toplevel)) != "bitfreighter"
        return
    end

    set CURRENTBRANCH (git status | awk 'NR==1{print $3}')

    if test $CURRENTBRANCH = "master"
        echo "You are on master you donkey!"
        true > /dev/null 2>&1
    end
end

function ga
    is_in_git_repo; and not_bf_master; or return

    if test (count $argv) -eq 0
        echo "git add ."
        git add .
    else
        echo "git add $argv"
        git add $argv
    end
end

function gb
    is_in_git_repo; or return

    if test (count $argv) -eq 0
        git branch -a --color=always | grep -v '/HEAD\s' | sort |
        fzf_down --ansi --multi --tac | sed 's/^..//' | cut -d' ' -f1 |
        sed 's#^remotes/origin/##' | xargs git checkout
    else
        git branch $argv
    end
end

function gc
    is_in_git_repo; and not_bf_master; or return

    if test (count $argv) -eq 0
        git commit --verbose
    else
        git commit -m "$argv[1]"
    end
end

function gush
    is_in_git_repo; and not_bf_master; or return
    git push
end

function gdl
    if test (count $argv) -eq 0
        git diff @~
    else
        git diff @~$argv
    end
end

function gpr
    gh pr view --web
    if test $status -ne 0
        gh pr create --web
    end
end
