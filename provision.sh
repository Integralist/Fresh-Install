function install_xcode() {
  xcode-select --install
}

function install_homebrew() {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

function install_brews() {
  brew tap caskroom/homebrew-cask

  brews=( vim git node the_silver_searcher chruby ruby-install \
          tmux reattach-to-user-namespace phantomjs gnu-sed \
          rename tree wget cmake terminal-notifier weechat \
          brew-cask siege ctags )

  for item in "${brews[@]}"
  do
    if [[ $item == "weechat" ]]; then
      brew install $item --with-perl --with-python --with-ruby
    elif [[ $item == "vim" ]]; then
      brew install $item --override-system-vim
    else
      brew install $item
    fi
  done
}

function install_software() {
  casks=( dropbox box-sync alfred appcleaner rightzoom cloudapp vlc xscope \
          cleanmymac vienna google-chrome firefox qlcolorcode qlstephen \
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

function configure_git() {
  git config --global merge.tool vimdiff        # automatically use vimdiff
  git config --global merge.conflictstyle diff3 # inside conflict, display a baseline
  git config --global mergetool.prompt true     # always prompt me
}

install_xcode && \
install_homebrew && \
install_brews && \
install_software && \
install_php_repl && \
switch_to_zsh && \
configure_git && \
echo "We've installed all the software we can.
Check the README to see if there is anything else.
Don't forget to start Dropbox and login so it starts sync'ing files.
Then execute provision-complete.sh after Dropbox has finished sync'ing (see README for instructions)"
