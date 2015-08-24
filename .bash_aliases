function show () {
    while [ $# -gt 0 ]; do
        chronic xdg-open "$1" &
        shift
    done
}

function kfind () {
    local dir="."
    local maxdepth=4
    local name=""

    if [ $# -lt 1 ]; then
        echo "kfind name [dir [maxdepth]]"
        return 1
    fi
    if [ $# -gt 0 ]; then
        name="$1"
    fi
    if [ $# -gt 1 ]; then
        dir="$2"
    fi
    if [ $# -gt 2 ]; then
        maxdepth="$3"
    fi

    find "${dir}" -maxdepth ${maxdepth} -iname "${name}"
}

alias cgrep='egrep --color=auto -rni --include="*.[ch]" --include="*.cpp"'
