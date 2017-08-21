if command -v brew >/dev/null 2>&1; then
  [[ -d $(brew --prefix)/share/python ]] && PATH="$(brew --prefix)/share/python:$PATH"
  [[ -f $(brew --prefix)/bin/virtualenvwrapper_lazy.sh ]] && . $(brew --prefix)/bin/virtualenvwrapper_lazy.sh
fi

alias b="bundle exec"
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Allow square brackets for passing args.
alias rake="noglob rake"

export GOPATH=~/projects/gocode
export PATH=${PATH}:${GOPATH}/bin
CDPATH=.:$GOPATH/src/github.com

alias drun='docker run --rm -ti -v $(pwd):/mnt -w /mnt'

# VirtualBox host-only networks frequently stop working. Possibly related to
# AnyConnect. This fixes them by switching it off and back on again.
func fixvboxnet() {
  for IF in $(ifconfig | awk -F: '/^vboxnet/ { print $1 }'); do
    sudo bash -c "ifconfig $IF down && ifconfig $IF up"
  done
}
