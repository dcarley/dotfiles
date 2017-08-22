if command -v brew >/dev/null 2>&1; then
  [[ -d $(brew --prefix)/share/python ]] && PATH="$(brew --prefix)/share/python:$PATH"
  [[ -f $(brew --prefix)/bin/virtualenvwrapper_lazy.sh ]] && . $(brew --prefix)/bin/virtualenvwrapper_lazy.sh
fi

alias vi=vim
alias b="bundle exec"
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Allow square brackets for passing args.
alias rake="noglob rake"

export GOPATH=~/projects/gocode
export PATH=${PATH}:${GOPATH}/bin
CDPATH=.:$GOPATH/src/github.com

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'
