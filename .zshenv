[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh

[[ -d $(brew --prefix)/share/python ]] && PATH="$(brew --prefix)/share/python:$PATH"
[[ -f $(brew --prefix)/share/python/virtualenvwrapper_lazy.sh ]] && . $(brew --prefix)/share/python/virtualenvwrapper_lazy.sh

alias b="bundle exec"
