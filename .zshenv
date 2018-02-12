alias vi=vim
export VISUAL=vim
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

export GOPATH=~/projects/gocode
export PATH=${PATH}:${GOPATH}/bin
CDPATH=.:$GOPATH/src/github.com

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'

export GPG_TTY=$(tty)
