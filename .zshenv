# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

export VISUAL=emacs
export EDITOR="$VISUAL"

# Don't muddy stats with Flox employees.
export FLOX_DISABLE_METRICS="true"

alias kc=kubectl
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Pretty page JSON
alias jless='jq -C . | less -R'

gc() {
    org=$1
    repo=$2
    dir=~/projects/${org}/${repo}
    git clone git@github.com:${org}/${repo} ${dir}
}
CDPATH=.:~/projects

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'

export RIPGREP_CONFIG_PATH=~/.ripgreprc

# Use fzf from nix.
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi

if [ -e /Users/dcarley/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/dcarley/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -n "${commands[direnv]}" ]; then
    eval "$(direnv hook zsh)"
fi
