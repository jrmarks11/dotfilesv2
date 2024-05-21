#!/usr/bin/env zsh

stty start undef
stty stop undef

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt append_history
setopt correct
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt noflowcontrol
setopt inc_append_history
setopt share_history

export ERL_AFLAGS="-kernel shell_history enabled"

[ -f /opt/homebrew/asdf/libexec/asdf.sh ] && . opt/homebrew/asdf/libexec/asdf.sh
[ -f  /opt/homebrew/opt/zinit/zinit.zsh ] && . /opt/homebrew/opt/zinit/zinit.zsh
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export BAT_THEME="ansi"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)"
    ssh-add
fi

autoload -Uz compinit
compinit -i -C

zinit ice wait"0" lucid; zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice wait"1" lucid; zinit light zsh-users/zsh-completions
zinit ice wait"1" lucid; zinit light zsh-users/zsh-history-substring-search
zinit ice wait"1" lucid; zinit light zsh-users/zsh-autosuggestions
zinit ice wait"2" lucid; zinit light zdharma-continuum/fast-syntax-highlighting

source ~/.zsh-files/aliases.zsh
source ~/.zsh-files/functions.zsh
source ~/.zsh-files/keybindings.zsh

[ -f ~/.zsh-local ] && source ~/.zsh-local
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
