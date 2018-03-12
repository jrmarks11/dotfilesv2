[ -f ~/.asdf/asdf.sh ] &&
  {
    . "$HOME/.asdf/asdf.sh"
    . "$HOME/.asdf/completions/asdf.bash"
  }

command -v brew >/dev/null 2>&1 &&
  [[ -f $(brew --prefix)/etc/bash_completion ]] &&
  { . $(brew --prefix)/etc/bash_completion
    __git_complete gco _git_checkout
    __git_complete gb _git_branch
  }

if [[ $(command -v fasd) ]]; then
  fasd_cache="$HOME/.fasd-init-bash"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }
