
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc



" Download Vundle: https://github.com/VundleVim/Vundle.vim
" git clone url ~/.vim/bundle/Vundle.vim

" set nocompatible
" filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'jdonaldson/vaxe'

" call vundle#end()
filetype plugin indent on


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  set grepprg=grep\ -nH\ $*
  let g:tex_flavor = "latex"

  let g:Tex_DefaultTargetFormat='pdf'

  "To solve the propleme with vim-latexsuite has with ã and â
  "imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
  "imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
  "imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
  "imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
  "imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
  "imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
  "map <buffer> <silent> é é
  "map <buffer> <silent> á á
  "map <buffer> <silent> ã ã

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  "
  " Comandos especificos para tipos de arquivos especificos
  "
  " Para octave - m - octave
  " Para C - c
  au FileType c  map <C-c> 0i/*<Esc>A*/<Esc>
  au FileType c  map <C-x> 0xx$xx
  au FileType c  map <F12> :w<CR>:!make<CR>
  " Para C++ - cpp
  au FileType cpp  map <C-c> 0i//<Esc>
  au FileType cpp  map <C-x> 0xx
  au FileType cpp  map <F12> :w<CR>:!make<CR>
  " Para fortran
  au FileType fortran  map <C-c> 0rC
  au FileType fortran  map <C-x> 0s <Esc>
  " Para tex
  au BufNewFile,BufRead *.tex map ,c :w<CR>:!pdflatex --shell-escape --enable-write18 --halt-on-error %<CR>
  au BufNewFile,BufRead *.tex map ,b :w<CR>:!bibtex %<.aux<CR>
  au BufNewFile,BufRead *.tex map ,p :!evince %<.pdf &<CR>
  au BufNewFile,BufRead *.tex map ,m :w<CR>:!make<CR>
  " Para action script
  au BufNewFile,BufRead *.as map <C-c> 0i//<Esc>
  au BufNewFile,BufRead *.as map <C-x> 0xx

  au BufNewFile,BufRead *.hx map <C-c> 0i//<Esc>
  au BufNewFile,BufRead *.hx map <C-x> 0xx

  au FileType octave  map <C-c> 0i% <Esc>
  au FileType octave  map <C-x> 0xx

  au BufNewFile,BufRead *.py map <C-c> 0i#<Esc>
  au BufNewFile,BufRead *.py map <C-x> 0x

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

let g:latex_to_unicode_file_types = ['julia', 'markdown']

set tabstop=2
set shiftwidth=2

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.jl set tabstop=2
au BufNewFile,BufRead *.jl set shiftwidth=2

set expandtab
set tw=80
nnoremap <silent> <C-l> :nohl<CR><C-l>

set number

set ignorecase
:map G Gzz
:map n nzz
:map N Nzz
:map \beq i\begin{equation}
:map \eeq i\end{equation}<Esc>
:map \hh :set hlsearch<CR>
:map \nhh :set nohlsearch<CR>
:map \cl ^v$y
:map \br i<br><Esc>
:imap \<CR><CR> <br><CR>
:map \abr A<br><Esc>
:map vimrc :e $MYVIMRC<CR>
:map syntax :e $HOME/.vim/after/syntax/c.vim<CR>
:map <Tab> >>
:map <S-Tab> <<
:imap <S-tab> <Esc><<i
":imap ii <Esc>

" Add this line to filetype.vim
"au BufNewFile,BufRead *.as set syntax=actionscript
au BufNewFile,BufRead *.as set cindent
au BufNewFile,BufRead *.as set autoindent
au BufNewFile,BufRead *.as set smarttab
set autoindent
set smarttab

" Download theme vendetta: https://github.com/evgenyzinoviev/vim-vendetta
colorscheme vendetta

highlight ShowTrailingWhitespace ctermbg=Red guibg=Red
