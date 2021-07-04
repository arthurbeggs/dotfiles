""""""""""""""""""""""""""""
""" Neovim Configuration ###
""""""""""""""""""""""""""""

""" Plug Plugin Manager
call plug#begin('$XDG_DATA_HOME/nvim/site/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/suda.vim'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'udalov/kotlin-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

""" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

call plug#end()

"""""""""""""""""""""""""""""
""" General Configuration ###
"""""""""""""""""""""""""""""
" Disable vi compatibility
set nocompatible

" Disable modeline
set nomodeline

" Sets how many lines of history VIM has to remember
set history=256

" Save undo history
set undofile
set undodir=~/.local/share/nvim/undo_history

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = " "
let maplocalleader = ","
set timeoutlen=2000

" See buffer list
nmap <leader>b :ls<CR>:b

" :W sudo saves the file
command -bar W SudaWrite

" Detect external changes in file when buffer gains focus
au FocusGained,BufEnter * :silent! !

" Auto save buffer when focus is lost
au FocusLost,WinLeave * :silent! noautocmd w

" Show a few lines below the current line
set scrolloff=10
" The same horizontally
set sidescrolloff=5

" Allow backspace to work over everything
set backspace=indent,eol,start

" Always show line numbers
set number

" Highlight cursor line
set cursorline

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
language en_US.UTF-8

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

" Visible whitespace with :set list
set list
set listchars=tab:▸\ ,eol:¬,space:·

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

" Spell checker TODO
"set spell spelllang=en_us,pt_br

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Highlight the 80th column
if exists("+colorcolumn")
    set colorcolumn=80
endif

" Do not insert comment leaders automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Duplicate a line / selection and comment out the first
nmap <Leader>ch Ypkgccj
vmap <Leader>ch gcgvyPgvgc

" Copy and paste to system clipboard with <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

" Set GUI font
set guifont=monospace:h10

" Switch active window
nmap ]w <C-W>w
nmap [w <C-W>W

" Switch active tab
nmap ]g :tabn<cr>
nmap [g :tabp<cr>

" Open terminal below all splits
nmap <leader>' :botright split \| resize 10 \| term<CR>

" Start terminal in insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" Escape Terminal Mode
:tnoremap <Esc><Esc> <C-\><C-n>

" Replace all alias
nnoremap S :%s//g<Left><Left>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Navigate through windows easily
nnoremap <leader>w <C-w>

" Enables mouse
set mouse=a

" Enhances comments
autocmd FileType c          setlocal commentstring=//\ %s
autocmd FileType cpp        setlocal commentstring=//\ %s
autocmd FileType verilog    setlocal commentstring=//\ %s

" Treat underscore as a delimiter
set iskeyword-=_

" Always open LaTeX files as TeX type
let g:tex_flavor = "latex"


""""""""""""""""""""""""""""
""" Plugin Configuration ###
""""""""""""""""""""""""""""

""" Gruvbox theme
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

""" NerdTree toggle
nnoremap <leader>tn :NERDTreeToggle<CR>
" Map some windows like Spacemacs
nnoremap <leader>0 :NERDTreeToggle<CR>

""" Indent Guide
nnoremap <leader>ti :IndentGuidesToggle<CR>

