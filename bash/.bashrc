# which environment am i on?
if [[ $(hostname -s) =~ ^CMM ]]; then
  MY_HOST="💊 ";
elif [[ $(hostname -s) =~ ^vagrant ]]; then
  MY_HOST="💩 ";
else
  MY_HOST="⚡ ";
fi

[ -f ~/.asdf/asdf.sh ] && . ~/.asdf/asdf.sh

command -v brew >/dev/null 2>&1 &&
  [[ -f $(brew --prefix)/etc/bash_completion ]] &&
  { . $(brew --prefix)/etc/bash_completion; }

[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && . /usr/local/opt/chruby/share/chruby/chruby.sh
command -v chruby >/dev/null 2>&1 && [[ "$MY_HOST" =~ '💊'$ ]] && { chruby 2.2.2; }

if [[ $(command -v fasd) ]]; then
  fasd_cache="$HOME/.fasd-init-bash"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  alias j='fasd_cd -d'
  alias jj='fasd_cd -d -i'
  alias v='f -e vim'
  vv() {
    local files
    files=$(grep '^>' ~/.viminfo | cut -c3- |
            while read line; do
              [ -f "${line/\~/$HOME}" ] && echo "$line"
            done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
  }
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
stty -ixon
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/dbrady-bin" ] ; then
  PATH="$PATH:$HOME/dbrady-bin"
fi

export PATH="/usr/local/sbin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

COLOR_RESET="\[\e[0m\]"
WHITE="\[\e[00;37m\]"
PURPLE="\[\e[00;35m\]"
BLUE="\[\e[00;34m\]"
DARK_GRAY="\[\e[02;39m\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_STATESEPARATOR=""
GIT_BRANCH="\$(__git_ps1)"

PS1_COMBINED=""
PS1_COMBINED+=$BLUE
PS1_COMBINED+="\w"
PS1_COMBINED+=$DARK_GRAY
PS1_COMBINED+=$GIT_BRANCH
PS1_COMBINED+=$PURPLE
PS1_COMBINED+=$MY_HOST
PS1_COMBINED+=">"
PS1_COMBINED+=$COLOR_RESET

export CLICOLOR=1
export PS1=$PS1_COMBINED

export VISUAL=vim
export EDITOR="$VISUAL"

cl() { history -p '!!'|tr -d \\n|pbcopy; }
tssh() { tmate display -p '#{tmate_ssh}' | pbcopy; }
rgv() { vim $(rg -l "$@"); }

alias bake='bundle exec rake'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias ber='bundle exec rspec'
alias berfd='bundle exec rspec --format d'
alias berof='bundle exec rspec --only-failures'
alias ga='git add .'
alias gc='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gh='git hs'
alias gl='git pull'
alias gn='git newb'
alias gp='git push'
alias gpu='git push -u'
alias gs='git status -s'
alias gu='git up'
alias rf='rg --files --glob'
