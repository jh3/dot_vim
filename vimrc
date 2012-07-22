" ----------------------------------------
" Vundle
" ----------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Navigation
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'wgibbs/vim-irblack'
Bundle 'tomasr/molokai'
" Commands
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
" Libraries
Bundle 'benjifisher/Vim-Plugin-for-Drupal'
" Automatic Helpers
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'chrisbra/SudoEdit.vim'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

let mapleader=","
set t_Co=256
set background=dark

if has("gui_running")
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  " set guifont=Inconsolata-dz\ for\ Powerline:h12
  set guifont=Inconsolata:h14
  " Hide toolbar and scrollbar in MacVim
  set guioptions=egmrt
  set guioptions+=LlRrb
  set guioptions-=LlRrb
  " Use option (alt) as meta key.
  set macmeta
  colorscheme molokai
  let g:molokai_original = 1
else
  colorscheme ir_black
endif

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set showcmd
set ruler           " Ruler on
set relativenumber  " Relative line numbers on
set laststatus=2    " Always show the statusline
set encoding=utf-8

set statusline=
set statusline+=[%n%H%M%R%W]\  " flags and buf no
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%y\     " filetype
set statusline+=%t      " tail of filename
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L\  " cursor line/total lines
set statusline+=%P      " percent through file

syntax enable
set clipboard=unnamed
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql

set tabstop=2
set softtabstop=2
set backspace=2   " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set linebreak
set wrap

set ignorecase  " Case insensitive search
set smartcase   " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc

set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

set noerrorbells
set novisualbell
set t_vb=

set mousehide   " Hide mouse after chars typed
set mouse=a     " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" Fix crappy pasting of already formatted code
imap <Leader>p <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

" Exit insert mode faster    
inoremap jw <Esc>

" Common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
" Double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Toggle invisible characters
nnoremap <Leader>i :set list!<CR>

" Clear recent search highlighting
nnoremap <Leader><space> :noh<CR>

" Toggle spelling mode with ,s
nmap <silent> <Leader>s :set spell!<CR>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>
" Equal Size Windows
nmap <silent> <Leader>w= :wincmd =<CR>
" Window Splitting
nmap <silent> <Leader>sh :split<CR>
nmap <silent> <Leader>sv :vsplit<CR>
" Because I'm dyslexic
nmap <silent> <Leader>hs :split<CR>
nmap <silent> <Leader>vs :vsplit<CR>
nmap <silent> <Leader>sc :close<CR>

if has("autocmd")
  " cd to the current directory of the open buffer
  autocmd BufRead,BufNewFile * lcd %:p:h

  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " Change indentation for perl files
  autocmd FileType perl setl sw=4 ts=4 sts=4 et

  " Help make nice commit messages
  autocmd FileType gitcommit highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd FileType gitcommit match OverLength /\%72v.*/
  autocmd FileType gitcommit setl tw=72 fo=cq wm=0

  " This is for commentary
  autocmd FileType php set commentstring=//\ %s

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Plugin Configurations
" ---------------------
" SuperTab
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" Neocachecompl
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1
" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Required to make neocomplcache_cursor_hold_i_time work
" See https://github.com/Shougo/neocomplcache/issues/140
let s:update_time_save = &updatetime
autocmd InsertEnter * call s:on_insert_enter()

function! s:on_insert_enter()
  if &updatetime > g:neocomplcache_cursor_hold_i_time
    let s:update_time_save = &updatetime
    let &updatetime = g:neocomplcache_cursor_hold_i_time
  endif
endfunction

autocmd InsertLeave * call s:on_insert_leave()

function! s:on_insert_leave()
  if &updatetime < s:update_time_save
    let &updatetime = s:update_time_save
  endif
endfunction

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" let g:syntastic_mode_map = { 'mode': 'active',
"       \ 'active_filetypes': ['install', 'module', 'inc', 'info', 'php'],
"       \ 'passive_filetypes': ['perl', 'bash', 'sh'] }
let g:syntastic_phpcs_disable=1

" Fugitive
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gx :wincmd h<CR>:q<CR> " Exit a diff by closing the diff window
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gs :Gstatus<CR>

" CtrlP
let g:ctrlp_working_path_mode = 1 " Set the working path to the parent dir of the current file
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'cd %s && git ls-files'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Vundle
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR>
nmap <Leader>bc :BundleClean<CR>

" Functions
" ---------
" Fix Trailing White Space
map <Leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" Quick spelling fix (first item in z= list)
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <Leader>z :QuickSpellingFix<CR>
