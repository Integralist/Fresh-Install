# Fresh Install

These are my own instructions for a fresh laptop/mac install.

This file is broken down into sections:

- [Automated provisioning](https://github.com/Integralist/Fresh-Install#automated-provisioning)
- [Step by Step](https://github.com/Integralist/Fresh-Install#step-by-step)
- [dotfiles](https://github.com/Integralist/Fresh-Install#dotfiles)
- [Shell Theme](https://github.com/Integralist/Fresh-Install#shell-theme)
- [Shell Font](https://github.com/Integralist/Fresh-Install#shell-font)
- [Vim and Tmux status line improvements](https://github.com/Integralist/Fresh-Install#vim-and-tmux-status-line-improvements)
- [CLI Task Manager](https://github.com/Integralist/Fresh-Install#cli-task-manager)
- [WeeChat](https://github.com/Integralist/Fresh-Install#weechat)
- [Grunt error `Error: spawn EMFILE`](https://github.com/Integralist/Fresh-Install#grunt-error-error-spawn-emfile)
- [Upgrading to Mac OS X Mavericks](https://github.com/Integralist/Fresh-Install#upgrading-to-mac-os-x-mavericks)
- [PHP REPL](https://github.com/Integralist/Fresh-Install#php-repl)
- [Clojure development](https://github.com/Integralist/Fresh-Install#clojure-development)
- [Renaming files](https://github.com/Integralist/Fresh-Install#renaming-files)
- [Load testing with Siege](https://github.com/Integralist/Fresh-Install#load-testing-with-siege)

## Automated provisioning

There is [`provision.sh`](https://github.com/Integralist/Fresh-Install/blob/master/provision.sh) script which can help to install a lot of the software and specific settings/dotfiles detailed below.

If you have a truely fresh install then you probably wont have Git installed to do a `git clone` of this repo to access the `provision.sh` file, so instead simply run the following command from your terminal of choice (e.g. Terminal.app is the default on Mac OS X):

```sh
curl https://raw.githubusercontent.com/Integralist/Fresh-Install/master/provision.sh -o ~/Desktop/provision.sh
```

The above command will download the provisioning script to your desktop. To execute it run the following command:

```sh
sh ~/Desktop/provision.sh
```

When all software is installed and/or configured you can safely remove the `provision.sh` file by running the following command (or you can manually delete the file if you so choose):

```sh
rm ~/Desktop/provision.sh
```

There is also a [`provision-complete.sh`](https://github.com/Integralist/Fresh-Install/blob/master/provision-complete.sh) file you'll need to run after Dropbox has finished sync'ing. To download the script run the following command:

```sh
curl https://raw.githubusercontent.com/Integralist/Fresh-Install/master/provision-complete.sh -o ~/Desktop/provision-complete.sh
```

To execute the script once it has been downloaded, run the following command:

```sh
sh ~/Desktop/provision-complete.sh
```

When the script is finished you can safely remove the `provision-complete.sh` file by running the following command (or you can manually delete the file if you so choose):

```sh
rm ~/Desktop/provision-complete.sh
```

## Step by Step

- Download and run provision.sh
- Click on battery icon in menu bar and select “Show Percentage”
- Click on time icon in menu bar and select “Open Date & Time Preferences…” then select “Clock” tab and tick the “Display the time with seconds” box
- Open the “Keyboard” system preferences and set “Key Repeat” to “Fast” and “Delay Until Repeat” to “Short”
- Open the “Trackpad” system preferences and set “Tracking speed” to the seventh (7th) pipe (7/10)
- Execute the command “defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder” so I can see hidden files in Finder (so I know when Dropbox has finished sync’ing my dotfiles”
- Install Ubuntu fonts within ~/Dropbox/Fresh Install/Shell/fonts
- Restart Terminal.app (so the switch from Bash to Zsh takes effect)
- Run `provision-complete.sh` script (this is after Dropbox has finished sync’ing so all my dotfiles will be available)
- Update terminal theme(s) to use “Ubuntu Mono derivative Powerline” font (so Vim airline plugin works as expected)
- Choose one of the three terminal themes (`set background=light`): Tomorrow, Tomorrow-Night, Tomorrow-Night-Bright
- Install the “Solarized Dark” Terminal theme; increase font-size; change font to “Ubuntu Mono derivative Powerline” and set theme as “Default”
- Log into Box Sync
- Generate SSH keys to provide to GitHub: `ssh-keygen -t rsa -C "mark.mcdx@gmail.com"` then `cat ~/.ssh/id_rsa.pub | pbcopy`
- (App Store) iAWriter
- (App Store) Dash
- (App Store) Cloud
- (App Store) Twitter
- (App Store) Caffeine
- (App Store) Pocket
- (App Store) Memory Clean
- (App Store) Airmail
- VLC Player

## dotfiles

See contents of the `Shell` directory.

Symlinking of dotfiles is handled by the [`provision-complete.sh`](https://github.com/Integralist/Fresh-Install/blob/master/provision-complete.sh) script.

## Vim and Tmux status line improvements

We use a specific plugin to handle status bar line enhancements (both for Vim and Vim running inside tmux).

Once the following steps have been actioned you won't need to run them again (as the content of the file generated by the commands is added directly to our `.tmux.conf` file).

Open tmux and then Vim inside it and run the following commands...

- `:let g:tmuxline_preset = 'full'`
- `:Tmuxline`
- `:TmuxlineSnapshot ~/some/path/tmux-snapshot.conf`

...then inside our `tmux.conf` file we add `source-file ~/some/path/tmux-snapshot.conf` (or just copy the content directly into .tmux.conf which is what I ended up doing)

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

You'll find my WeeChat configuration files within `shell/.weechat`

**Requirements for notifications:**

- [https://github.com/wallace/weechat-notification-center-rb](https://github.com/wallace/weechat-notification-center-rb)
- `brew install terminal-notifier` (needed to be in /local/ bin path -> you'll need the entire XCode)
- `gem install weechat` (into system Ruby)
- `gem install terminal-notifier` (into system Ruby)

**Usage:**

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

## PHP REPL

- `wget psysh.org/psysh`
- `chmod +x psysh`
- `mv ./psysh /usr/local/bin/psysh`

## Clojure development

We need the Lein project tool: `brew install leiningen` (run REPL with `lein repl`)

We need the following vim packages to try and mimick a reasonably decent Clojure dev environment...

- [https://github.com/tpope/vim-fireplace/](https://github.com/tpope/vim-fireplace/) (adds key bindings so you can run code against a REPL)
- [https://github.com/vim-scripts/paredit.vim](https://github.com/vim-scripts/paredit.vim) (automatically add closing brackets/parenthesis)
- [https://github.com/kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim) (adds colourful pairs to your brackets/parenthesis)
- [https://github.com/tpope/vim-classpath](https://github.com/tpope/vim-classpath) (fix some Java `$PATH` details)
- [https://github.com/tpope/vim-clojure-static/](https://github.com/tpope//vim-clojure-static/) (Clojure formatting stuff)

You'll need three consoles open:

1. `vim`
2. `lein repl`
3. `lein new compojure my-project`

Then once the REPL is started, inside of Vim run the command `:Connect` and select the REPL you want to connect to and then enter the port number Leiningen provided when it started up (e.g. `:Connect nrepl://127.0.0.1:60356`).

- `K` = when pressed over a symbol will open documentation for that symbol
- `` = 
- `` = 
- `` = 

## Renaming files

`brew install rename`

Usage: Change File-A-B.gif to File-AB.gif

Example: `rename 's/(.+)-(.+)$/$1$2/' File-*`

## Load testing with Siege

`brew install siege`

Example: `siege -c 10 -r 10 -b http://www.domain.com/`
