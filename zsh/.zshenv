if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"

export EDITOR=vim
export VISUAL=vim
