" if [[ -d $syncfolder/Fresh\ Install/Shell/vim ]]; then
"   for conf in $syncfolder/Fresh\ Install/Shell/vim/*.zsh; do
"     source $conf
"   done
" fi

source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/settings.zsh
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/vundle.zsh
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/mapping.zsh
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/filetypes.zsh
source ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/vim/commands.zsh

" read local config, if it exists
if filereadable(".vimlocal")
  source .vimlocal
endif











