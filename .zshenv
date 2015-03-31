[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh
# hub makes the zsh prompt sloooow.
unalias git

[[ -d $(brew --prefix)/share/python ]] && PATH="$(brew --prefix)/share/python:$PATH"
[[ -f $(brew --prefix)/share/python/virtualenvwrapper_lazy.sh ]] && . $(brew --prefix)/share/python/virtualenvwrapper_lazy.sh

alias b="bundle exec"
# Output headers only from GET
alias curlh="curl -s -D- -o/dev/null"
# Allow square brackets for passing args.
alias rake="noglob rake"

export GOPATH=~/projects/gocode
export PATH="${GOPATH}/bin:${PATH}"

eval $(boot2docker shellinit 2>/dev/null)

# VirtualBox host-only networks frequently stop working. Possibly related to
# AnyConnect. This fixes them by switching it off and back on again.
func fixvboxnet() {
  for IF in $(ifconfig | awk -F: '/^vboxnet/ { print $1 }'); do
    sudo bash -c "ifconfig $IF down && ifconfig $IF up"
  done
}
