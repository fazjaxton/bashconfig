function show () {
    while [ $# -gt 0 ]; do
        chronic xdg-open "$1" &
        shift
    done
}

alias cgrep='egrep -rni --include="*.[ch]" --include="*.cpp"'
alias kfind='find . -maxdepth 4 -iname'
