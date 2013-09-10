" switch syntax highlighting on, when the terminal has colors
syntax on

" use vim, not vi api
set nocompatible

" no backup files
set nobackup

" no write backup
set nowritebackup

" no swap file
set noswapfile

" command history
set history=100

" always show cursor
set ruler

" show incomplete commands
set showcmd

" incremental searching
set incsearch

" highlight search
set hlsearch

" ignore case in search
set smartcase

" clear search buffer
:nnoremap § :nohlsearch<cr>

" make sure undo history is kept for files in buffer.
set hidden

" turn indentation on
filetype indent on

" enable filetype plugins
filetype plugin on

" disable folding because it is evil
set nofoldenable

" turn word wrap off
set nowrap

" scroll with more context
set scrolloff=10

" allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" convert tabs to spaces
set expandtab

" set tab size
set tabstop=4

" the number of spaces inserted for a tab
set shiftwidth=4

" turn on line numbers
set number

" highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" always show status bar
set laststatus=2

" set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" hide the toolbar
set guioptions-=T

" utf encoding
set encoding=utf-8

" read local config, if it exists
if filereadable(".vimlocal")
  source .vimlocal
endif


" autoload files that have changed outside of vim
set autoread

" command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" Declare bundles are handled via Vundle
" filetype off " required!
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github color scheme
" Bundle 'croaky/vim-colors-github'

" ctrlp
Bundle 'kien/ctrlp.vim'

map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>

let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" solarized
" Bundle 'altercation/vim-colors-solarized'

" set background=dark
" :silent! :colorscheme solarized

Bundle 'jlangston/tomorrow-night-vim'
:silent! :colorscheme tomorrow-night-bright

" markdown
Bundle 'tpope/vim-markdown'

" allow piping of markdown files to the browser
au BufEnter,BufNew *.md map <enter> :wa\|!rbfu rdiscount % \| bcat<cr>

" cucumber
Bundle 'tpope/vim-cucumber'

" coffee-script
Bundle 'kchmck/vim-coffee-script'

" tags
Bundle 'xolox/vim-misc'
Bundle 'majutsushi/tagbar'
"Bundle 'xolox/vim-easytags'

let g:tagbar_ctags_bin='/opt/boxen/homebrew/bin/ctags'

"Open Tagbar when pressing <leader>b and automatically close it after
""selecting something
:map <leader>b :TagbarOpenAutoClose<cr>

" super tabs
Bundle 'ervandew/supertab'

" repeat
Bundle 'tpope/vim-repeat'

" comments
Bundle 'tpope/vim-commentary.git'

" ack (but uses Ag behind the scenes)
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" end stuff
Bundle 'tpope/vim-endwise'

" powerline
Bundle 'Lokaltog/vim-powerline'

let g:Powerline_symbols='fancy'

" gists
Bundle 'mattn/webapi-vim'
Bundle 'vim-scripts/Gist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

"Github settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN

" don't show intro
set shortmess+=I
" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" File Formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal textwidth=80
autocmd FileType yaml setl sw=2 sts=2 et


" better splits
set splitbelow
set splitright

" no longer needs ctrl+w + key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Rename
Bundle 'vim-scripts/rename.vim'

" tmux switcher
" http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
Bundle 'christoomey/vim-tmux-navigator'


" Unite
" Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/unite.vim'

" " Always start insert mode
" let g:unite_enable_start_insert = 1

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#set_profile('files', 'smartcase', 1)

" let g:unite_source_grep_command='ag'
" let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
" let g:unite_source_grep_recursive_opt=''

" nnoremap <Leader>f :Unite grep:. -no-quit -no-start-insert<cr>
" nnoremap <Leader>t :Unite file_rec/async<cr>
" nnoremap <Leader>y :Unite -quick-match buffer<cr>

" git gutter
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn


Bundle 'AndrewRadev/gapply.vim'
Bundle 'vim-scripts/The-NERD-tree'
