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

# Handle ill-advised resets with modified files.  Add a --force-hard option to
# overwrite anyway.
function git_reset {
    if [ "$1" == "--hard" ]; then
        if command git status --porcelain | egrep "^(M.|.M)" > /dev/null; then
            # If there are working-directory changes, warn and list
            echo "Modified files will be overwritten!" \
                "Use --force-hard to overwrite."
            command git status --porcelain | egrep "^(M.|.M)"
        else
            # If no changes, perform the hard reset
            command git reset "$@"
        fi
    elif [ "$1" == "--force-hard" ]; then
        # --force-hard actually uses the --hard option
        shift;
        command git reset --hard "$@"
    else
        # All other commands are handled normally
        command git reset "$@"
    fi
}

# Git does not allow you to alias built-in functions.  Make a "git" function
# to do some manual command-line parsing before calling the real git.
function git {
    if [ "$1" == "reset" ]; then
        shift
        git_reset "$@"
    else
        command git "$@"
    fi
}

alias cgrep='egrep --color=auto -rni --include="*.[ch]" --include="*.cpp"'
