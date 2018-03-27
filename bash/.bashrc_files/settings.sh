export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--reverse'

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
export HISTIGNORE='?:??:&:[ ]*:cd *:clear:exit:gc *:gco *:gdc:gdl:gdm:gn *:gull:gush:history:j *:jj *:ls -la:v *:vim:'

bind Space:magic-space

shopt -s cdspell checkwinsize cmdhist direxpand dirspell globstar histappend nocaseglob
stty -ixon -ixoff

PROMPT_DIRTRIM=2
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export VISUAL=vim
export EDITOR="$VISUAL"
