" Declare bundles are handled via Vundle
filetype off " required by Vundle Plugin Manager
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" CtrlP
Bundle 'kien/ctrlp.vim'
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" Tomorrow Night Theme
Bundle 'jlangston/tomorrow-night-vim'
:silent! :colorscheme tomorrow-night-bright

" Markdown
Bundle 'tpope/vim-markdown'

" Cucumber
" Press ctrl-] on a step to jump to its Ruby definition
Bundle 'tpope/vim-cucumber'

" Tags
" First run `ctags -R` within the root directory (this is installed via Homebrew)
" Second within your file, on a method/class/object (whatever) press `Ctrl+]`
Bundle 'xolox/vim-misc'
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" Tags
" Open Tagbar when pressing <leader>b
" And automatically close it after selecting something
:map <leader>b :TagbarOpenAutoClose<cr>

" Tab completion (previously used 'ervandew/supertab')
Bundle 'Valloric/YouCompleteMe'

" Enable repeating supported plugin maps with '.'
Bundle 'tpope/vim-repeat'

" Comment out stuff
Bundle 'tpope/vim-commentary.git'

" Ack (uses Ag behind the scenes)
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Applies `end` keyword to relevant lines of ruby code
Bundle 'tpope/vim-endwise'

" Status line design improvements
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1

    " Bundle 'Lokaltog/powerline'
    "     " set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim

" Status line support within tmux
Bundle 'edkolev/tmuxline.vim'

" Gists
Bundle 'mattn/webapi-vim'
Bundle 'vim-scripts/Gist.vim'
Bundle 'tpope/vim-fugitive'

" Gists (Github settings)
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN

" HTML generation (in NORMAL mode Ctrl+y then , <C-y,>)
Bundle 'mattn/emmet-vim'

" Rename variables and files in your code (:Rename[!] {newname})
Bundle 'vim-scripts/rename.vim'

" Git gutter
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" File System
Bundle 'scrooloose/nerdtree'
map <leader>' :NERDTreeToggle<cr>

" SCSS, Sass & Haml Syntax Support
Bundle 'tpope/vim-haml'

" Surround text with HTML or punctuation
Bundle 'tpope/vim-surround'

" HTML5 syntax
Bundle 'othree/html5.vim'

" Tabularize
Bundle 'godlygeek/tabular'
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>

" Camel Case Motion (for dealing with programming code)
Bundle 'vim-scripts/camelcasemotion'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

filetype plugin indent on " required by Vundle Plugin Manager
