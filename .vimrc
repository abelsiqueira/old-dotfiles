" Using vim-plug
" See https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'

call plug#end()

colorscheme badwolf
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Comment ctermfg=gray ctermbg=none

set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set ignorecase
set number

map <C-n> :NERDTreeToggle<CR>

let g:latex_to_unicode_file_types = ['julia', 'markdown', 'conf']
