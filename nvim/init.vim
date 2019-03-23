""""""""""""""""""""""""""""
""" Neovim Configuration ###
""""""""""""""""""""""""""""
""" Plug Plugin Manager
call plug#begin('~/.data/nvim/site/plugged')

" Locally installed
Plug '/usr/bin/fzf'

" Git installed
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'maximbaz/lightline-ale'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'simnalamburt/vim-mundo'
Plug 'suan/vim-instant-markdown'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


"""""""""""""""""""""""""""""
""" General Configuration ###
"""""""""""""""""""""""""""""
" Disable vi compatibility
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Save undo history
set undofile
set undodir=~/.data/nvim/undo_history

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
set timeoutlen=2000

" See buffer list
nmap <leader>b :ls<CR>:b

" :W sudo saves the file 
command! W w !SUDO_ASKPASS=/usr/bin/qt4-ssh-askpass sudo -A tee % > /dev/null

" Show a few lines below the current line
set scrolloff=10
" The same horizontally
set sidescrolloff=5

" Allow backspace to work over everything
set backspace=indent,eol,start

" Always show line numbers
set number

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
set matchtime=0

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" hide buffers instead of closing
set hidden

" Enable syntax highlighting
syntax enable

" Set UTF-8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" No linebreaks
set nolinebreak
" set tw=500

" Visible whitespace with :set list
set list
set listchars=tab:▸\ ,eol:¬,space:·

" Split window with invisible separator
set fillchars+=vert:\ 

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

" Highlight the 80th column
if exists("+colorcolumn")
    set colorcolumn=80
endif

" Do not insert comment leaders automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Duplicate a line / selection and comment out the first
nmap <Leader>c Ypkgccj
vmap <Leader>c gcgvyPgvgc

" Copy and paste to system clipboard with <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Use english messages
language en_US.UTF-8

" Insert current date
map <Leader>date "=strftime("%a, %d %b %Y")<CR>p

" Insert current time
map <Leader>time "=strftime("%Hh%M")<CR>p
map <Leader>ctime "=strftime("%H:%M:%S")<CR>p

" Toggle wrap
nnoremap <leader>tw :set wrap!<CR>

" Toggle hybrid line numbers
nnoremap <leader>tl :set relativenumber!<CR>

" Toggle Undo tree
nnoremap <leader>tu :MundoToggle<CR>

" Show TODO's, FIXME's, XXX's and NOTE's
nnoremap <leader>todo :Ag \(FIXME\)\\|\(TODO\)\\|\(XXX\)\\|\(NOTE\)<cr>

" Highlight used TODO's comments
augroup vimrc_todo
	au!
	au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|XXX)/
			  \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Disable arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" Toggle paste mode on and off
nnoremap <leader>tp :setlocal paste!<cr>

" Keep session
set sessionoptions=blank,buffers,curdir,help,tabpages,winsize

function! MakeSession()
  let b:sessiondir = getcwd()
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" au VimEnter * nested :call LoadSession()
" au VimLeave * :call MakeSession()
nnoremap <leader>ss :call MakeSession()
nnoremap <leader>ll :call LoadSession()

" Color scheme
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme gruvbox

" Switch active window
nmap ]w <C-W>w
nmap [w <C-W>W

" Switch active tab 
nmap ]g :tabn<cr>
nmap [g :tabp<cr>

" Escape Terminal Mode
:tnoremap <Esc><Esc> <C-\><C-n>


""""""""""""""""""""""""""""
""" Plugin Configuration ###
""""""""""""""""""""""""""""
""" NerdTree toggle
nnoremap <leader>tn :NERDTreeToggle<CR>

""" Git Gutter
autocmd BufWritePost * GitGutter

""" Nvim GDB
nmap <Leader>db :GdbStart gdb 

""" Deoplete configuration
let g:deoplete#enable_at_startup = 1

""" ALE
let g:ale_linters_explicit = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

let g:ale_c_parse_makefile = 1

let g:ale_linters = {'cpp': ['gcc'],
                  \  'c': ['gcc'],
                  \  'tex': ['chktex'],
                  \  'verilog': ['iverilog'],}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],}

nmap <leader>gd <Plug>(ale_go_to_definition)<CR>

""" LanguageClient
let g:LanguageClient_serverCommands = {
  \ 'c': [ 'clangd' ],
  \ 'cpp': [ 'clangd' ],
  \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

""" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'relativepath', 'readonly', 'modified' ] ],
      \   'right': [ [ 'linter_ok', 'linter_warnings', 'linter_errors' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left':  [ [ 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ]
      \ },
      \ 'tabline' : {
	   \   'left':  [ [ 'tabs' ] ],
      \   'right': []
      \ },
      \ 'tab' : {
      \   'active':   [ 'tabnum', 'absolutepath', 'modified', 'spacer', 'gitbranch' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'tab_component': {
      \   'spacer' : ' | '
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'tab_component_function': {
      \   'filename': 'lightline#tab#filename',
      \   'modified': 'lightline#tab#modified',
      \   'readonly': 'lightline#tab#readonly',
      \   'tabnum': 'lightline#tab#tabnum',
      \   'absolutepath' : 'TabAbsolutepath',
      \   'gitbranch' : 'fugitive#head'
      \ }, 
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left'
      \ },
      \ }

function! TabAbsolutepath(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':F')
  return _ !=# '' ? _ : '[No Name]'
endfunction

""" Gruvbox theme
let g:gruvbox_contrast_dark = 'medium'

""" C++ Enhanced Highlight
let g:cpp_member_variable_highlight = 1

""" Instant Markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

""" VimWiki
let g:vimwiki_list = [ { 'path': '~/projects/journal',
                       \ 'diary_header': 'Journal Entries',
                       \ 'diary_index': 'journal',
                       \ 'diary_rel_path': '',
                       \ 'auto_toc': 1
                    \  },
                    \  { 'path': '~/projects/wiki',
                       \ 'diary_header': 'Wiki Journal',
                       \ 'diary_rel_path': 'journal/',
                       \ 'auto_toc': 1 } ]
let g:vimwiki_auto_chdir = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

nmap <Leader>ewi 2<Plug>VimwikiIndex
nmap <Leader>eji <Plug>VimwikiDiaryIndex<CR><Plug>VimwikiDiaryGenerateLinks
nmap <Leader>ejt <Plug>VimwikiMakeDiaryNote
nmap <Leader>eju <Plug>VimwikiDiaryGenerateLinks

