cd "$HOME/.vim/bundle"

plugins=( kien/ctrlp.vim jlangston/tomorrow-night-vim tpope/vim-markdown tpope/vim-cucumber \
          scrooloose/syntastic ervandew/supertab tpope/vim-repeat tpope/vim-commentary \
          mileszs/ack.vim tpope/vim-endwise bling/vim-airline edkolev/tmuxline.vim \
          mattn/webapi-vim vim-scripts/Gist.vim mattn/emmet-vim airblade/vim-gitgutter \
          scrooloose/nerdtree tpope/vim-haml tpope/vim-surround othree/html5.vim \
          godlygeek/tabular vim-scripts/camelcasemotion tpope/vim-fireplace tpope/vim-classpath \
          guns/vim-clojure-static rizzatti/funcoo.vim rizzatti/dash.vim sheerun/vim-polyglot \
          tpope/vim-fugitive vim-scripts/textutil.vim )

for item in "${plugins[@]}"
do
  git clone "https://github.com/$item.git"
done
