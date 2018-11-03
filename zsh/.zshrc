source ~/.zsh-files/functions.zsh

if [[ -z "$TMUX" ]]; then
  tm
fi

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt append_history
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

_JM_git_branch_names () {
  compadd "${(@)${(f)$(git branch -a)}#??}"
}
compdef _JM_git_branch_names gb

[ -f /usr/local/opt/asdf/asdf.sh ] && . /usr/local/opt/asdf/asdf.sh
[ -f /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash ] &&
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

export BAT_THEME="GitHub"

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
export FZF_DEFAULT_OPTS='--reverse'

command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zdharma/fast-syntax-highlighting

zplugin ice silent wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice silent wait'0' blockf
zplugin light zsh-users/zsh-history-substring-search

zplugin ice silent wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

prompt_newline='%666v'
PROMPT=" $PROMPT"

source ~/.zsh-files/aliases.zsh
source ~/.zsh-files/keybindings.zsh
source ~/.zsh-local
