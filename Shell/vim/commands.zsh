" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" remove whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal textwidth=80
autocmd FileType cucumber,ruby,yaml setl sw=2 sts=2 et

" specify syntax highlighting for specific files
au Bufread,BufNewFile *.spv set filetype=php
au Bufread,BufNewFile *.zsh set filetype=vim
