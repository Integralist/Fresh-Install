# Fresh Install

These are my own instructions for a fresh laptop/mac install

- [Homebrew](http://mxcl.github.io/homebrew/)
	- `brew install vim` (you'll need to rename the system Vim `which vim` e.g. `sudo mv /usr/bin/vim /usr/bin/vim-7.3` so the system will then find the brew vim via the `$PATH`)
	- `brew install node` (which installs NPM)
	- `brew install git`
	- `brew install the_silver_searcher` (e.g. `ag 'js\b' ./some-directory`)
	- `brew install phantomjs`
	- `brew install https://raw.github.com/postmodern/chgems/master/homebrew/chgems.rb` && `brew install chruby` && `brew install ruby-install`
		- ruby-build uses older ruby gems version which works on my laptop, where as newer ruby gems from ruby install didn't work? `ruby-build 1.8.7-p302 /opt/rubies/1.8.7-p302`
	- `brew install tmux`
		- `brew install reattach-to-user-namespace` (used by tmux and add `set -g default-command "reattach-to-user-namespace -l \"/bin/zsh\""` to your .tmux.conf)
	- `brew install rename` (change File-A-B.gif to File-AB.gif with `rename 's/(.+)-(.+)$/$1$2/' File-*`)
	- `brew install ctags` for use with Vim (you might need to change the system version of ctags like so `sudo mv /usr/bin/ctags /usr/bin/ctags-original` so the Homebrew version gets picked up when you do `which ctags`)
- `gem install tmuxinator`
- [Pure ZSH](https://github.com/sindresorhus/pure)
	- [Prezto](https://github.com/sorin-ionescu/prezto)
	- [PHPShell](http://www.phpsh.org/)
- [Grunt](http://gruntjs.com/)
	- `npm install -g grunt-cli`
	- `npm install -g grunt-init`
	- `npm init` (creates a package.json file)
- [Lo-Dash](https://npmjs.org/package/lodash)
- [Uglify](https://npmjs.org/package/uglify-js2) (`npm install uglify-js2`)
- Nave (Node Version Manager) `npm install -g nave` (could need `PATH=${NAVEPATH}:$PATH`)
- [Sass](http://sass-lang.com/) (`gem install sass`)
- [Xcode Command Line Tools](http://connect.apple.com/)
- Google Chrome Plugins (should come from Google account sync)
	- [Quick JavaScript Switcher](https://t.co/ryLRETND)
	- [goo.gl URL Shortener](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&ved=0CDcQFjAB&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fgoogl-url-shortener%2Fiblijlcdoidgdpfknkckljiocdbnlagk%3Fhl%3Den&ei=tTDAUen3IImAOIOqgKgG&usg=AFQjCNEkUotK__kdeBXARBUc6WNTQ7rB3A&sig2=gTtTOryLRAYyLIiyL-84HQ&bvm=bv.47883778,d.ZWU)
	- [Stylish](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CC8QFjAA&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fstylish%2Ffjnbnpbmkenffdnngjfgmeleoegfcffe%3Fhl%3Den&ei=BcAIUtODCIPQhAe4xIGwAg&usg=AFQjCNHqQ_jWum-eFNn9yAtVsdvLWn0fkw&bvm=bv.50500085,d.ZG4)
	- [Dimensions](https://chrome.google.com/webstore/detail/dimensions/hdmihohhdcbejdkidbfijmfehjbnmifk?utm_source=chrome-ntp-icon)
- Applications
	- iWriter
	- NotesTab
	- xScope
	- Pocket
	- Regexr
	- Caffeine
	- Alfred
	- AppCleaner
	- RightZoom
	- Dropbox
	- Google Drive
	- CloudApp
	- VLC Player
	- Fantastical
	- Vienna
	- Clean My Mac
	- Colloquy ([Succinct theme](https://github.com/JohnAlbin/succinct-for-colloquy))
	- Memory Clean
	- [LiceCap](http://www.cockos.com/licecap/) (animated GIF from screen recording)
    - Dash

## Dot Files

See the `Shell` directory that includes a .zshrc file which imports a Zsh settings file on Dropbox.

We need to symlink our .zshrc, .vimrc and .tmux.conf files (and our .vim) from our home directory to our Dropbox versions...

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.zshrc ~/.zshrc`

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.vimrc ~/.vimrc`

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.vim ~/.vim`

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.tmux.conf ~/.tmux.conf`

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.gitconfig ~/.gitconfig`

`ln -s ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/.gitignore_global ~/.gitignore_global`


Rather than export a $PATH you *could* (not that I'd recommend it) also edit the file directly: `vim /private/etc/paths`

## Shell Font

We need to make sure the font `Droid+Sans+Mono+for+Powerline.otf` is installed and also the terminal theme (see below is updated to use that font)

## Shell Theme

Use the Tomorrow Night Bright theme which you can find in the `shell` folder. Just double click to install (don't forget to open up the terminal preferences and make sure it's the default theme and to increase the font size).

## VIM, TMUX and VUNDLE

To install tmux see above brew command.

With tmux (once `brew install reattach-to-user-namespace`) make sure to add to your `.vimrc` as it fixes a bug with not being able to paste content between tmux sessions:
```
set -g default-command "reattach-to-user-namespace -l \"/bin/zsh\""
set-option -g default-shell /bin/zsh
```

To install vundle do `git clone https://github.com/gmarik/vundle.git ~/Dropbox/Fresh\ Install/Shell/.vim/bundle/vundle`

The contents of the .vimrc file are taken directly from the sthulb repo [https://github.com/sthulb/dotfiles/tree/master/vim](https://github.com/sthulb/dotfiles/tree/master/vim)

Launch `vim`, run `:BundleInstall` or just run from the command line `vim +BundleInstall`

## Upgrading to Mac OS X Mavericks

There were issues with the C++ compiler.

Seems it changed from `libstdc++` to `libc++` and on top of that my own work set-up was different in that we needed to use a specific Apple based C++ compiler called `apple-gcc42`.

When running `gcc --version` we want to see the Apple version being used.

To swap to `apple-gcc42` we need to rename the existing compilers and then symlink to the new ones...

- `cd /usr/bin`
- `sudo -s` (to switch to `root` user)
- `mv c++ llvm-c++`
- `mv cc llvm-cc`
- `mv gcov llvm-gcov`
- `mv gcc llvm-gcc`
- `mv g++ llvm-g++`
- `mv cpp llvm-cpp`
- `ln -s /usr/local/bin/c++-4.2 /usr/bin/c++`
- `ln -s /usr/local/bin/cpp-4.2 /usr/bin/cpp`
- `ln -s /usr/local/bin/g++-4.2 /usr/bin/g++`
- `ln -s /usr/local/bin/gcc-4.2 /usr/bin/gcc`
- `ln -s /usr/local/bin/gcov-4.2 /usr/bin/gcov`
- `ln -s /usr/local/bin/gcc-4.2 /usr/bin/cc`

### Symlinks

In `/usr/local/bin`, a simple `ls *4.2` will list 6 files (see above) which will need to be symlinked. Symlink these to the same place but without the 4.2 suffix...

```sh
ln -s /usr/local/bin/gcc-4.2 /usr/local/bin/gcc
```

Additional symlinks needed:

```sh
ln -s /usr/local/bin/gcc-4.2 /usr/local/bin/cc
ln -s /usr/local/bin/gcc-4.2 /usr/local/bin/g++ # gem unf_ext uses g++
```

### Vagrant Plugin

`vagrant plugin install vagrant-box-updater`