# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

export VISUAL="flox activate -r dcarley/emacs -- emacsclient"
export EDITOR="$VISUAL"

# Don't muddy stats with Flox employees.
export FLOX_DISABLE_METRICS="true"

alias kc=kubectl
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Pretty page JSON
alias jless='jq -C . | less -R'

ft() {
    flox "$1" --dir ~/tmp "${@:2}"
}

gc() {
    org=$1
    repo=$2
    dir=~/projects/${org}/${repo}
    git clone git@github.com:${org}/${repo} ${dir}
}
CDPATH=.:~/projects

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'

export RIPGREP_CONFIG_PATH=~/.ripgreprc
