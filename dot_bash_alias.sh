function ls() {
    if [[ -f .hidden ]]; then 
        exa --icons --long --ignore-glob="$(cat .hidden | tr '\n' '|')"
    else
        exa --icons --long 
    fi 
}
alias grep="ugrep"
alias cd="z"
alias cat="bat -p"
