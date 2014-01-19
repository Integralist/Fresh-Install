# Fresh Install

These are my own instructions for a fresh laptop/mac install

For a quick step-by-step (based off of my doing a fresh install of Mac OS X
Mavericks recently) then [click here](#step-by-step)

- [Homebrew](http://mxcl.github.io/homebrew/)
	- `brew install apple-gcc42`
	- `brew install vim` (you'll need to rename the system Vim `which vim` e.g. `sudo mv /usr/bin/vim /usr/bin/vim-7.3` so the system will then find the brew vim via the `$PATH`)
	- `brew install node` (which installs NPM)
	- `brew install git`
	- `brew install the_silver_searcher` (e.g. `ag 'js\b' ./some-directory`)
	- `brew install phantomjs`
	- `brew install chruby` && `brew install ruby-install`
	- `brew install tmux`
		- `brew install reattach-to-user-namespace` ([see below](#vim-tmux-and-vundle))
	- `brew install gnu-sed`
	- `brew install rename` (change File-A-B.gif to File-AB.gif with `rename 's/(.+)-(.+)$/$1$2/' File-*`)
	- `brew install tree`
	- `brew install wget`
	- `brew install cmake`
	- `brew install ctags` for use with Vim (you might need to change the system version of ctags like so `sudo mv /usr/bin/ctags /usr/bin/ctags-original` so the Homebrew version gets picked up when you do `which ctags`)
	- `brew install weechat` (see below for details)
- [Pure ZSH](https://github.com/sindresorhus/pure)
	- [PHPShell](http://www.phpsh.org/)
- [Grunt](http://gruntjs.com/)
- Nave (Node Version Manager) `npm install -g nave` (could need `PATH=${NAVEPATH}:$PATH`)
- [Xcode Command Line Tools](http://connect.apple.com/)
- Google Chrome Plugins (should come from Google account sync)
	- [Quick JavaScript Switcher](https://t.co/ryLRETND)
	- [goo.gl URL Shortener](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&ved=0CDcQFjAB&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fgoogl-url-shortener%2Fiblijlcdoidgdpfknkckljiocdbnlagk%3Fhl%3Den&ei=tTDAUen3IImAOIOqgKgG&usg=AFQjCNEkUotK__kdeBXARBUc6WNTQ7rB3A&sig2=gTtTOryLRAYyLIiyL-84HQ&bvm=bv.47883778,d.ZWU)
	- [Stylish](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CC8QFjAA&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fstylish%2Ffjnbnpbmkenffdnngjfgmeleoegfcffe%3Fhl%3Den&ei=BcAIUtODCIPQhAe4xIGwAg&usg=AFQjCNHqQ_jWum-eFNn9yAtVsdvLWn0fkw&bvm=bv.50500085,d.ZG4)
	- [Dimensions](https://chrome.google.com/webstore/detail/dimensions/hdmihohhdcbejdkidbfijmfehjbnmifk?utm_source=chrome-ntp-icon)
- Applications
	- Box.com
	- iWriter
	- Regexr
	- Caffeine
	- Alfred
	- AppCleaner
	- RightZoom
	- CloudApp
	- VLC Player
	- Fantastical
	- Memory Clean
	- Dash
	- NotesTab
	- xScope
	- Pocket
	- Clean My Mac
	- Vienna
	- [LiceCap](http://www.cockos.com/licecap/) (animated GIF from screen recording)

## Dot Files

See the `Shell` directory that includes a .zshrc file which imports a Zsh settings file on Dropbox.

We need to symlink our .zshrc, .vimrc and .tmux.conf files (and our .vim) from our home directory to our Dropbox versions...

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.NERDTreeBookmarks ~/.NERDTreeBookmarks`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.gitconfig ~/.gitconfig`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.gitignore_global ~/.gitignore_global`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.task ~/.task`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.taskrc ~/.taskrc`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.tmux.conf ~/.tmux.conf`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.vim ~/.vim`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.vimrc ~/.vimrc`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.weechat ~/.weechat`

`ln -s ~/Box\ Sync/Fresh\ Install/Shell/.zshrc ~/.zshrc`

Note: rather than export a $PATH you *could* (not that I'd recommend it) also edit the file directly: `vim /private/etc/paths`

## Shell Theme

Use one of the themes inside the `Shell/themes` folder.

Just double click to install (don't forget to open up the terminal preferences and make sure it's the default theme and to increase the font size).

## Shell Font

We need to make sure one of the fonts in the `Shell/fonts` folder is installed and set within the terminal preferences for the terminal theme

## Vim, tmux and Vundle

All of the following is already set within the dot files but I've explained them below as it's important to understand why they are there.

With tmux and `brew install reattach-to-user-namespace` both installed, make sure to add to your `.tmux.conf` the following settings...

```
set -g default-command "reattach-to-user-namespace -l \"/bin/zsh\""
set-option -g default-shell /bin/zsh
```

...the first setting fixes an issue where you're unable to paste content copied from tmux into another application (or even another tmux session).

To install vundle do `git clone https://github.com/gmarik/vundle.git ~/Dropbox/Fresh\ Install/Shell/.vim/bundle/vundle`

To install the Vim plugins either:

- launch `vim` and run `:BundleInstall`
- or just run from the command line `vim +BundleInstall`

### Vim and tmux status line improvements

We use a specific plugin (installed via Vundle) to handle status bar line enhancements (both for Vim and Vim running inside tmux).

Open tmux and then Vim inside it and run the following commands...

- `:let g:tmuxline_preset = 'full'`
- `:Tmuxline`
- `:TmuxlineSnapshot ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/tmux-snapshot.conf`

...then inside our tmux.conf file we add `source-file ~/Google\ Drive/Dropbox/Fresh\ Install/Shell/tmux-snapshot.conf` (or just copy the content directly into .tmux.conf)

## CLI Task Manager

www.taskwarrior.org

**Installation**

Download from website then run the following commands:

- `gunzip task-{version}.tar.gz`
- `tar xf task-{version}.tar`
- `cd task-{version}`
- `cmake .` (`brew install cake` if you haven't got it)
- `make`
- `sudo make install`
- `task help` (to see available commands or read
  http://taskwarrior.org/projects/taskwarrior/wiki/Tutorial)

**Usage**

Note: you can shorten commands (e.g. `task list project:dotfiles` === `task l pro:dot`)

- `task add {description}`
- `task list`
- `task long` (shows the full output possible, inc. tags and priorities etc)
- `task log {description}` (this is something you've already done but are
  tracking its progress)
- `task {n} duplicate {substitution}` (e.g. `task 4 duplicate /Test/ABC/` we
  duplicate our 4th task and replace the word "Test" in the description with
"ABC")
- `task {n} modify {substitution}` (note: you can use the `g` flag
  `/search/replacement/g`)
- `task {n} modify {new description}`
- `task {n} modify project:{name}` (assign a task to a specific project)
- `task {n-n,n} modify project:{name}` (you can specify a range `task 1-2,4 modify`)
- `task projects` (lists all projects)
- `task list project:{name}` (filter tasks by project)
- `task {n} modify priority:{value}` (use: [H]igh, [M]edium, [L]ow)
- `task {n} modify +{tag}` (apply a tag to a task, same tag can be used multiple
  times)
- `task list +{tag}` (filter results by tag)
- `task {n} modify -{tag}` (removes the tag)
- `task {n} edit` (opens up Vim and allows you to make big changes)
- `task {n} delete`
- `task {n} done`

## WeeChat

Once installed via Hombrew we need to sync our configuration file (irc.conf within the .weechat directory) via Dropbox so make sure you symlink the dotfiles (see above section with symlinks).

- `/connect {config_name}` to connect to channel
- `/connect freenode` and then `/join #gulpjs`
- `/quit`
- `/q {user_name}` for private chat
- `/close` to close a window
- `ESC {window_number}` to change windows
- `/help` do this in the status window (1) to see all commands
- `/buffer close` to close a window
- `/buffer clear` to clear the current buffer
- `ctrl-x` to switch buffer in current window
- `/set config.section.option value`
- `/set weechat.*` to see all options
- Shift and up/down arrow keys moves you up/down the discussion window content
  (use fn key as well if on a small Mac laptop)

The status bar can be a bit confusing...

`[11:55] [4] [irc/BBC] 2:#news [H: 3(6,2), 4(3)]`

...but it breaks down like this...

- `[11:55]` = time
- `[4]` = number of buffers (windows/panes) open
- `[irc/BBC]` = server connected to currently
- `2:#news` = current buffer being viewed + channel connected to
- `[H: 3(6,2), 4(3)]` tells you what has changed. So buffer 3 has 6 messages since you last looked and 2 connections (someone has joined or left) and buffer 4 has either 3 connections or 3 messages depending on the colour (if white then its a connection, if its yellow its a message).

## Step by Step

These are the steps I took when I recently did a fresh install...

### Install

- Google Drive (25gb of space)
- Dropbox (install inside of Google Drive)
- Google Chrome
- Right Zoom

### Settings

- Change Keyboard delay to be fastest setting possible (inside System
  Preferences)

### While Dropbox Syncs

This can take quite a long time as while Dropbox is syncing it causes the
containing Google Drive to sync as well.

Ideally you'll turn off Google Drive until Dropbox is finished.

- Switch to Zsh (`chsh -s /bin/zsh`)
- Install Homebrew (`ruby -e "$(curl -fsSL
  https://raw.github.com/mxcl/homebrew/go)”` which installs the Command Line
Tools for you)
- Check $PATH (`echo $PATH` should now look something like:
  `/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin` - notice that our local bin
where we’ll install all custom stuff via Brew or NPM or wherever is actually
last in the pecking order so the Mac will look at its own system bin first
before checking our local bin, also it’ll only have a single package ’brew’
inside it for now)
- Check if you even need to install (via Homebrew) things like Vim or Git as the
  versions installed might be close enough to current releases any way (I
thought I didn't need Vim installed but I did because of lack of clipboard
support in system version).
- `brew install node` (this can take ~9mins, this creates a Cellar directory
  inside your `/usr/local` which holds the installed versions of Node. Cellar
belongs to Homebrew and so all packages you install go in this folder along with
any dependencies those packages themselves require)
- `brew install the_silver_searcher`
- `brew install phantomjs`
- `brew install chruby`
- `brew install ruby-build` (as our local bin is after our system bin for now,
but when Dropbox finishes syncing then it'll be switched by our .zshrc + also check 
`gem env` in both a directory that has no `.ruby-version` file and one that does to 
make sure the shell switches between system ruby and custom ruby)
- App Store iAWriter
- App Store Dash
- App Store Cloud
- App Store Twitter
- App Store Caffeine
- App Store Pocket
- VLC Player
- Regexr

### Once Dropbox is synced...

- [Install Terminal
  theme](https://github.com/Integralist/Fresh-Install/blob/master/Shell/Tomorrow%20Night%20Bright.terminal)
- Symlink dotfiles (see earlier in this README)
- Check Vim copy and paste (and install `brew install
  reattach-to-user-namespace` if necessary)
- `brew install tmux`
- `brew install rename`
- `brew install vim` (needed to do this as the default vim didn’t have the
  `+clipboard` feature enabled)
- Need to regenerate my SSH keys for GitHub
- Install task manager (see below)
- Run all the symlinks

## Grunt error `Error: spawn EMFILE`

This was an issue with using the Node static site generator: CabinJS.

See [https://github.com/gruntjs/grunt/issues/788](https://github.com/gruntjs/grunt/issues/788)

The solution is to run `ulimit -n 10240` and then restart the shell.

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

You'll know when it's working because before you do the symlinks, if you run `gcc --version` you'll see:

```sh
Configured with: --prefix=/Library/Developer/CommandLineTools/usr
--with-gxx-include-dir=/usr/include/c++/4.2.1

Apple LLVM version 5.0 (clang-500.2.79) (based on LLVM 3.3svn)

Target: x86_64-apple-darwin13.0.0

Thread model: posix
```

...and after symlinking you'll see:

```sh
i686-apple-darwin11-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)

Copyright (C) 2007 Free Software Foundation, Inc.

This is free software; see the source for copying conditions.  There is NO

warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

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
