export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

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

export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls *:vim *:v *:sh:sj:sk:sl:ss:sv:gs:gc *:gd:gdm:gdc:j *:jj *:ga:gb:gh:gl:gn:gpu:gu:gp:cd *:vim:ls'
shopt -s histappend
stty -ixon
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export VISUAL=vim
export EDITOR="$VISUAL"
