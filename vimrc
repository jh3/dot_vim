set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rhysd/conflict-marker.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'powerline/fonts'

Plugin 'bling/vim-bufferline'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'ervandew/supertab'
Plugin 'rizzatti/dash.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'wgibbs/vim-irblack'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'mbbill/undotree'

Plugin 'majutsushi/tagbar'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

Plugin 'joonty/vdebug'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'

Plugin 'klen/python-mode'
Plugin 'yssource/python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'

Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'

Plugin 'tpope/vim-markdown'

Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/renamer.vim'

call vundle#end()
filetype plugin indent on

set t_Co=256

syntax enable

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized             " Load a colorscheme
set background=dark

set autoindent
set autoread       " Automatically reload changes if detected
set backspace=2    " Delete everything with backspace

set backup
set backupcopy=yes " see :help crontab"
set backupdir=~/.vim/backup

if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.vimundo/
endif

set cf                 " Enable error files & error jumping.
set cindent
set clipboard=unnamed
set complete=.,w,b,u,U
set completeopt=longest,menu

set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set directory=~/.vim/tmp
set encoding=utf-8
set expandtab
set formatoptions=crql
set foldmethod=manual
set hidden             " Change buffer - without saving
set history=1000        " Number of things to remember in history.
set hlsearch
set ignorecase  " Case insensitive search
set incsearch
set laststatus=2    " Always show the statusline
set linebreak
set list      " show trailing whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set matchtime=2 " How many tenths of a second to blink
set mouse=a     " Mouse in all modes
set mousehide   " Hide mouse after chars typed
set noerrorbells
set novisualbell
set number                      " Line numbers on
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3 " show context above/below cursorline
set shiftwidth=2 " Tabs under smart indent
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set showcmd
set showmatch   " Show matching brackets.
set smartcase   " Non-case sensitive search
set smarttab
set softtabstop=2
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set statusline=
set statusline+=[%n%H%M%R%W]\  " flags and buf no
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%y\     " filetype
set statusline+=%t      " tail of filename
set statusline+=\ %{fugitive#statusline()} " git branch
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L\  " cursor line/total lines
set statusline+=%P      " percent through file
set tabstop=8
set timeoutlen=350     " Time to wait for a command (after leader for example)
set t_vb=
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc
set wildmenu           " Turn on Wild menu
set wildmode=longest,list,full
set winminheight=0              " Windows can be 0 line high
set wrap
scriptencoding utf-8

let mapleader=","
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
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
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
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Toggle spelling mode with ,s
"nmap <silent> <Leader>s :set spell!<CR>
" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
"nmap <silent> <C-p> :wincmd p<CR>
" Equal Size Windows
nmap <silent> <Leader>w= :wincmd =<CR>
" Window Splitting
nmap <silent> <Leader>s :split<CR>
nmap <silent> <Leader>v :vsplit<CR>
nmap <silent> <Leader>c :close<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" md is markdown
"autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile *.install,*.test setfiletype php

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

" CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" When editing a file, always jump to the last cursor position.
" This must be after the uncompress commands.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line ("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Plugin Configurations
" ---------------------
" SuperTab
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" let g:syntastic_mode_map = { 'mode': 'active',
"       \ 'active_filetypes': ['install', 'module', 'inc', 'info', 'php'],
"       \ 'passive_filetypes': ['perl', 'bash', 'sh'] }
let g:syntastic_phpcs_disable=1

" Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
  \ 'py' : ['python'],
  \ 'module' : ['drupal', 'php'],
  \ 'inc' : ['drupal', 'php'],
  \ 'install' : ['drupal', 'php'],
  \ 'profile' : ['drupal', 'php']
  \ }

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <Leader>gx :wincmd h<CR>:q<CR> " Exit a diff by closing the diff window
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode = 1 " Set the working path to the parent dir of the current file
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': s:ctrlp_fallback
      \ }

" TagBar
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" Ctags
set tags=./tags;/,~/.vimtags

" vim-airline
let g:airline_theme = 'solarized'
" Use the default set of separators with a few customizations
let g:airline_left_sep='›'  " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" NerdTree
let g:NERDShutUp=1
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0


" JSON
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0

" Python
let g:pymode = 0
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_trim_whitespaces = 0
let g:pymode_options = 0
let g:pymode_rope = 0

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Use honza's snippets.
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable neosnippet snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1

" Plugin key-mappings {
" These two lines conflict with the default digraph mapping of <C-K>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
inoremap <CR> <CR>
" <ESC> takes you out of insert mode
inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
" <CR> accepts first, then sends the <CR>
inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
" <Down> and <Up> cycle like <Tab> and <S-Tab>
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
" Jump up and down the list
inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Courtesy of Matteo Cavalleri
function! CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " existing text matching
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        else
            return neocomplete#start_manual_complete()
        endif
    endif
endfunction

imap <expr> <Tab> CleverTab()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" indent_guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" Vundle
nmap <Leader>pi :PluginInstall<CR>
nmap <Leader>pu :PluginUpdate<CR>
nmap <Leader>pc :PluginClean<CR>

" ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" vdebug
let g:vdebug_keymap = {
\    "run" : "<Leader>/",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\}

" Shell command
function! s:RunShellCommand(cmdline)
  botright new

  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nowrap
  setlocal filetype=shell
  setlocal syntax=shell

  call setline(1, a:cmdline)
  call setline(2, substitute(a:cmdline, '.', '=', 'g'))
  execute 'silent $read !' . escape(a:cmdline, '%#')
  setlocal nomodifiable
  1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %

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

" Profiling vim
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
