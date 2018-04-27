source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'dfurnes/purer', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug load

source ~/.zsh-files/aliases.zsh
source ~/.zsh-files/functions.zsh
source ~/.zsh-files/keybindings.zsh

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

[ -f /usr/local/opt/asdf/asdf.sh ] && . /usr/local/opt/asdf/asdf.sh
[ -f /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash ] &&
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

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

if [[ -z "$TMUX" ]]; then
  tm
fi
