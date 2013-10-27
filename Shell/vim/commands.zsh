" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal textwidth=80
autocmd FileType cucumber,ruby,yaml setl sw=2 sts=2 et
