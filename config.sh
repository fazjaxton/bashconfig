# Add the following line to ~/.bashrc:
#   source ~/.bashconfig/config.sh ~/.bashconfig
# (Or whatever directory this is checked out to)

if [ $# -lt 1 ]; then
	echo "Pass this script's directory its only argument"
	exit 1
fi

mydir=$1

alias_file=${mydir}/.bash_aliases
local_file=${mydir}/.bash_local
common_file=${mydir}/.bash_common

if [ -f "${alias_file}" ]; then
	source "${alias_file}"
fi

if [ -f "${local_file}" ]; then
	source "${local_file}"
fi

if [ -f "${common_file}" ]; then
	source "${common_file}"
fi
