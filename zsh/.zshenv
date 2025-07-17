if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export EDITOR=nvim
export VISUAL=nvim
