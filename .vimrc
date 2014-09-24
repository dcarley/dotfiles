" Load pathogen for vim plugin management.
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Enable plugin and indent rules from ftdetect.
filetype plugin indent on

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

" Except for golang. Just make them look like 2sp.
autocmd FileType go setlocal noexpandtab

" Disable extra space when joining sentences.
set nojoinspaces

if has("folding")
  " I want to love folding. But, no.
  set nofoldenable
  let g:vim_markdown_folding_disabled=1
endif
