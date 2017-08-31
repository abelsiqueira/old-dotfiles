" Using vim-plug
" See https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'lervag/vimtex'
Plug 'Shougo/neocomplete'
Plug 'aperezdc/vim-template'
Plug 'parkr/vim-jekyll'
Plug 'PProvost/vim-markdown-jekyll'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'

call plug#end()

colorscheme seti
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
map vimrc :e~/.vimrc<ENTER>

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\%('
      \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(include%(only)?|input)\s*\{[^}]*'
      \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . ')'

let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_compiler_latexmk = {'callback' : 0}

let g:templates_directory = '/home/abel/projetos/templates-for-vim/'
let g:templates_debug = 1

" Abel personal stuff
map <Tab> >>
map <S-Tab> <<
map n nzz

" from :h last-position-jump
:au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
