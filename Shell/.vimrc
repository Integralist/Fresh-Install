" Seems the best way to source a load of custom vim scripts is to load them
" within the .vim/plugin directory (as this is handled automatically).
"
" Here is a manual example you can use to load your custom .vim files:
"
" (Note that $DROPBOX is exported from within our .zshrc file)
"
set runtimepath+=$DROPBOX/Fresh\ Install/Shell/vim
runtime 1.settings.vim
runtime 2.pathogen.vim
runtime 3.plugins.vim
runtime 4.mapping.vim
runtime 5.commands.vim
"
" Apparently the following examples should work, but they didn't for me?
" although they do work when executed via :echo {command}
"
" if isdirectory(expand('%:p:h').'/vim')
" if isdirectory("$DROPBOX/Fresh Install/Shell/vim/")
  " for file in split(globpath('$DROPBOX/Fresh Install/Shell/vim/', '*.vim'), '\n')
  "   execute 'source ' . file
  " endfor
" endif

" if isdirectory("$DROPBOX/Fresh Install/Shell/vim/")
  " execute join(map(split(glob("$DROPBOX/Fresh Install/Shell/vim/*.vim"), "\n"), '"source " . v:val'), "\n")
  " let files = split(glob("$DROPBOX/Fresh Install/Shell/vim/*.vim"), "\n")
  " let sfiles = map(files, '"source " . v:val')
  " execute join(map(files, '"source " . v:val'), "\n")
" endif

" Read local config, if it exists
if filereadable(".vimlocal")
  source .vimlocal
endif
