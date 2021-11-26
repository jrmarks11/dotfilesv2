#!/usr/bin/env zsh

source ~/.zsh-files/functions.zsh

if [[ -z "$TMUX" ]]; then
  tm
fi

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

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

[ -f /usr/local/opt/asdf/asdf.sh ] && . /usr/local/opt/asdf/asdf.sh

export BAT_THEME="ansi"

if [[ $(command -v fasd) ]]; then
  fasd_cache="$HOME/.fasd-init-zsh"
  if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
  fi
  . "$fasd_cache"
  unset fasd_cache
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

source <(antibody init)
antibody bundle < ~/.zsh-files/plugins.txt
antibody bundle zdharma-continuum/fast-syntax-highlighting

prompt_newline='%666v'
PROMPT=" $PROMPT"

source ~/.zsh-files/aliases.zsh
source ~/.zsh-files/keybindings.zsh
[ -f ~/.zsh-local ] && source ~/.zsh-local
