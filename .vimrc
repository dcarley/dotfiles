" White on black is where it's at.
set bg=dark

" Always highlight. Disabled on OSX by default.
syntax on

" Auto-indent is more annoyance than aide.
set noai

" Wrap lines for an 80char term.
" Mostly for git commit messages.
set tw=76

" Stomp on hardtabs.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

if has("folding")
  " I want to love folding. But, no.
  set nofoldenable
endif

# Load pathogen for vim plugin management.
# https://github.com/tpope/vim-pathogen
execute pathogen#infect()
