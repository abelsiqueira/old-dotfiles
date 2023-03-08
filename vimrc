" vim-plug - https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'PProvost/vim-markdown-jekyll'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'Shougo/neocomplete'
Plug 'alvan/vim-closetag'
Plug 'aperezdc/vim-template'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim'
Plug 'parkr/vim-jekyll'
Plug 'reedes/vim-colors-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

" Colorscheme
colorscheme apprentice
" No background color for transparency
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Comment ctermfg=gray ctermbg=none
" syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*```*.*$" end="^\s*```*\ze\s*$" keepend
hi markdownCode ctermfg=green
" hi markdownCodeBlock ctermfg=red
" hi markdownHighlight ctermfg=red

" Additional package configurations
" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Unicode
let g:latex_to_unicode_file_types = ['julia', 'jmd', 'markdown', 'conf', 'toml']
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


" Personal choices
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set ignorecase
set number

map <Tab> >>
map <S-Tab> <<
map n nzz

" from :h last-position-jump
:au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
