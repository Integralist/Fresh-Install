function install_xcode() {
  xcode-select --install
}

function install_homebrew() {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

function install_brews() {
  brew tap phinze/homebrew-cask

  brews=( vim git node the_silver_searcher chruby ruby-install \
          tmux reattach-to-user-namespace phantomjs gnu-sed rename \
          tree wget cmake weechat brew-cask )

  for item in "${brews[@]}"
  do
    if [[ $item == "weechat" ]]; then
      brew install $item --with-perl --with-python --with-ruby
    else
      brew install $item
    fi
  done
}

function install_software() {
  casks=( dropbox box-sync alfred appcleaner right-zoom cloudapp vlc dash xscope \
          cleanmymac vienna-rss google-chrome firefox qlcolorcode qlstephen \
          qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql \
          webp-quicklook suspicious-package )

  for item in "${casks[@]}"
  do
    brew cask install $item
  done
}

function install_php_repl() {
  wget psysh.org/psysh
  chmod +x psysh
  mv ./psysh /usr/local/bin/psysh
}

function switch_to_zsh() {
  chsh -s /bin/zsh
}

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

install_xcode()
install_homebrew()
install_brews()
install_software()
install_php_repl()
switch_to_zsh()

echo "We've installed all the software we can. Check the README to see if there is anything else. \
      Don't forget to execute the symlink_dotfiles function as well once Dropbox is installed"
