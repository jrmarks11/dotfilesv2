export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--reverse --border'

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=500000
export HISTSIZE=100000
IGNORE_LIST='&:[ ]*:bg:cd:cd *:clear:exit:fg:ga:gb:gc *:gco *:gd:gdc:gdl:gdm:gh'
IGNORE_LIST+=':gn *:gs:gu:gull:gush:history:j *:jj *:ls:ls -la:tm:v *:vim:'
export HISTIGNORE=$IGNORE_LIST
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
stty -ixon -ixoff

PROMPT_DIRTRIM=2
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export VISUAL=vim
export EDITOR="$VISUAL"
