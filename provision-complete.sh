function symlink_dotfiles() {
  sync_directory="$HOME/Dropbox/Fresh Install/Shell"

  # Create an Array holding a list of dotfiles to symlink: foo=( bar baz qux )
  # Run a command substitution: $(foo) -> which returns result of sub command being run
  # List all files including those prefixed with a dot: ls -a
  # Then search (grep) for the dotfiles and ignore those we're not interested in: --invert-match
  files=( $(ls -a "$sync_directory" | grep '^\.' | grep --invert-match '\.DS_Store\|\.$') )

  # Loop through the Array creating symlinks
  for file in "${files[@]}"
  do
    ln -s "$sync_directory"/$file $HOME/$file
  done
}

function install_weechat_notifications() {
  cd $HOME
  sudo gem install weechat terminal-notifier
  curl https://raw.github.com/wallace/weechat-notification-center-rb/master/notification_center.rb > \
        ~/.weechat/ruby/autoload/notification_center.rb

  # We have to install these gems into the system Ruby
  # So simplest way is to move into the home directory
  # We can't run this function until after we've symlinked our dotfiles
}

function install_vim_plugins() {
  cd "$HOME/.vim/bundle"

  plugins=( airblade/vim-gitgutter \
            ap/vim-css-color \
            bling/vim-airline \
            edkolev/tmuxline.vim \
            ervandew/supertab \
            godlygeek/tabular \
            kien/ctrlp.vim \
            MattesGroeger/vim-bookmarks \
            mattn/emmet-vim \
            mattn/webapi-vim \
            mileszs/ack.vim \
            othree/html5.vim \
            scrooloose/nerdtree \
            scrooloose/syntastic \
            sheerun/vim-polyglot \
            t9md/vim-choosewin \
            tpope/vim-commentary \
            tpope/vim-cucumber \
            tpope/vim-dispatch \
            tpope/vim-endwise \
            tpope/vim-fugitive \
            tpope/vim-haml \
            tpope/vim-markdown \
            tpope/vim-repeat \
            tpope/vim-surround \
            vim-scripts/Gist.vim \
            vim-scripts/Tabmerge \
            vim-scripts/camelcasemotion \
            vim-scripts/textutil.vim \
            wellle/targets.vim )

  for item in "${plugins[@]}"
  do
    git clone "https://github.com/$item.git"
  done
}

symlink_dotfiles && \
install_weechat_notifications && \
install_vim_plugins
