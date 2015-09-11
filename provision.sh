function install_xcode() {
  xcode-select --install
}

function install_homebrew() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_brews() {
  brew tap caskroom/homebrew-cask

  brews=( vim git node the_silver_searcher chruby ruby-install \
          tmux reattach-to-user-namespace phantomjs gnu-sed \
          rename tree wget cmake terminal-notifier irssi \
          brew-cask siege ctags wireshark )

  for item in "${brews[@]}"
  do
    if [[ $item == "weechat" ]]; then
      brew install $item --with-perl --with-python --with-ruby
    elif [[ $item == "vim" ]]; then
      brew install $item --override-system-vim
    elif [[ $item == "wireshark" ]]; then
      brew install wireshark --with-qt
    else
      brew install $item
    fi
  done
}

function install_software() {
  casks=( dropbox box-sync appcleaner cloudapp vlc xscope \
          cleanmymac vienna google-chrome firefox qlcolorcode qlstephen \
          qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql \
          webp-quicklook suspicious-package )

  for item in "${casks[@]}"
  do
    brew cask install $item
  done
}

function install_npm_packages() {
  packages=( vtop is-up dnc )

  for item in "${packages[@]}"
  do
    npm install -g $item
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

function install_dotfiles() {
  git clone git@github.com:Integralist/dotfiles.git ~/dotfiles
  cd ~/dotfiles && mv .*~.git ..
  cd ~/ && rm -rf dotfiles
}

install_xcode && \
install_homebrew && \
install_brews && \
install_software && \
install_npm_packages && \
install_php_repl && \
switch_to_zsh && \
configure_git && \
install_dotfiles && \
echo "We've installed all the software we can.
Check the README to see if there is anything else.
Don't forget to start Dropbox and login so it starts sync'ing files."
