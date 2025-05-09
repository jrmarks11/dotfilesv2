eval "$(/opt/homebrew/bin/brew shellenv)"

SSH_ENV="$HOME/.ssh/agent-env"

if [[ -f $SSH_ENV ]]; then
    source "$SSH_ENV" >/dev/null
fi

if [[ ! -S $SSH_AUTH_SOCK ]] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
    eval "$(ssh-agent -s)" >/dev/null
    printf 'export SSH_AUTH_SOCK=%q\nexport SSH_AGENT_PID=%q\n' \
        "$SSH_AUTH_SOCK" "$SSH_AGENT_PID" >"$SSH_ENV"
fi

ssh-add --apple-load-keychain -q 2>/dev/null || true
