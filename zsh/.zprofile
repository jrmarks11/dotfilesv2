
eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -z $SSH_AUTH_SOCK ]] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
    eval "$(ssh-agent -s)"
    ssh-add -A 2>/dev/null
fi
