" if [[ -d $syncfolder/Fresh\ Install/Shell/vim ]]; then
"   for conf in $syncfolder/Fresh\ Install/Shell/vim/*.zsh; do
"     source $conf
"   done
" fi

source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/settings.vim
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/vundle.vim
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/mapping.vim
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/filetypes.vim
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/commands.vim

" read local config, if it exists
if filereadable(".vimlocal")
  source .vimlocal
endif
