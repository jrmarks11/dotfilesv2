if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
fzf --fish | source

abbr j z
abbr gs 'git status -s'
