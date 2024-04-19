#!/usr/bin/env zsh

source ~/.zsh-files/functions.zsh

# if [[ "$TERM_PROGRAM" != "vscode" ]]; then
#   if [[ -z "$TMUX" ]]; then
#     exec tmux
#   fi
# fi

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt append_history
setopt correct
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

export ERL_AFLAGS="-kernel shell_history enabled"

stty start undef
stty stop undef
setopt noflowcontrol

autoload -Uz compinit
compinit

[ -f $(brew --prefix asdf)/libexec/asdf.sh ] && . $(brew --prefix asdf)/libexec/asdf.sh

export BAT_THEME="ansi"

eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

eval "$(zoxide init zsh)"

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
source <(antidote init)
antidote bundle < ~/.zsh-files/plugins.txt
antidote bundle zdharma-continuum/fast-syntax-highlighting

prompt_newline='%666v'
PROMPT=" $PROMPT"

source ~/.zsh-files/aliases.zsh
source ~/.zsh-files/keybindings.zsh
[ -f ~/.zsh-local ] && source ~/.zsh-local
