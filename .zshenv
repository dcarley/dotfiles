# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

alias emacs="emacs -nw"
alias vi=emacs
export VISUAL=emacs
export EDITOR="$VISUAL"

# Use emacs mode to prevent vi mode from disabling ^R, ^[b, ^[f.
bindkey -e

alias b="bundle exec"
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Pretty page JSON
alias jless='jq -C . | less -R'
# Allow square brackets for passing args.
alias rake="noglob rake"

export GOPATH=~/projects/go
export PATH=${PATH}:${GOPATH}/bin
CDPATH=.:$GOPATH/src/github.com

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'

export GPG_TTY=$(tty)

if [ -x "$(command -v osascript)" ]; then
  export AWS_VAULT_PROMPT=osascript
fi
export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_PREFIX=aws-vault/

export RIPGREP_CONFIG_PATH=~/.ripgreprc
