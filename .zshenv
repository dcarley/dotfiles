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
