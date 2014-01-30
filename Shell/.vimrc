" if [[ -d $SYNCFOLDERALIAS/Fresh\ Install/Shell/vim ]]; then
"   for conf in $SYNCFOLDERALIAS/Fresh\ Install/Shell/vim/*.zsh; do
"     source $conf
"   done
" fi

" $SYNCFOLDERALIAS is set via .zshrc file
set runtimepath+=$DROPBOX/Fresh\ Install/Shell/vim
runtime settings.vim
runtime vundle.vim
runtime mapping.vim
runtime commands.vim

" note:
" we could also of used...
"
"   execute 'source' vimfolder . '/settings.vim'
"
" ...as the execute command evaluates a variable

" read local config, if it exists
if filereadable(".vimlocal")
  source .vimlocal
endif
