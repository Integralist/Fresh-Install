# Fresh Install

These are my own instructions for a fresh laptop/mac install.

This file is broken down into sections:

- [Automated provisioning](https://github.com/Integralist/Fresh-Install#automated-provisioning)
- [Step by Step](https://github.com/Integralist/Fresh-Install#step-by-step)
- [dotfiles](https://github.com/Integralist/Fresh-Install#dotfiles)
- [Certificates](https://github.com/Integralist/Fresh-Install#certificates)
- [Shell Theme](https://github.com/Integralist/Fresh-Install#shell-theme)
- [Shell Font](https://github.com/Integralist/Fresh-Install#shell-font)
- [Vim Themes](https://github.com/Integralist/Fresh-Install#vim-themes)
- [Vim and Tmux status line improvements](https://github.com/Integralist/Fresh-Install#vim-and-tmux-status-line-improvements)
- [CLI Task Manager](https://github.com/Integralist/Fresh-Install#cli-task-manager)
- [IRSSI](https://github.com/Integralist/Fresh-Install#irssi)
- [WeeChat](https://github.com/Integralist/Fresh-Install#weechat)
- [Grunt error `Error: spawn EMFILE`](https://github.com/Integralist/Fresh-Install#grunt-error-error-spawn-emfile)
- [Upgrading to Mac OS X Mavericks](https://github.com/Integralist/Fresh-Install#upgrading-to-mac-os-x-mavericks)
- [PHP REPL](https://github.com/Integralist/Fresh-Install#php-repl)
- [Clojure development](https://github.com/Integralist/Fresh-Install#clojure-development)
- [Renaming files](https://github.com/Integralist/Fresh-Install#renaming-files)
- [Load testing with Siege](https://github.com/Integralist/Fresh-Install#load-testing-with-siege)
- [Ensuring htop has access](https://github.com/Integralist/Fresh-Install#ensuring-htop-has-access)
- [NPM](https://github.com/Integralist/Fresh-Install#npm)

## Automated provisioning

There is [`provision.sh`](https://github.com/Integralist/Fresh-Install/blob/master/provision.sh) script which can help to install a lot of the software and specific settings/dotfiles detailed below.

If you have a truely fresh install then you probably wont have Git installed to do a `git clone` of this repo to access the `provision.sh` file, so instead simply run the following command from your terminal of choice (e.g. Terminal.app is the default on Mac OS X):

```sh
curl https://raw.githubusercontent.com/Integralist/Fresh-Install/master/provision.sh | sh
```

**Update** I've moved my dotfiles into a separate repo and the `provision.sh` has been updated accordingly to pull the dotfiles and install them into the users `$HOME` directory.

~~There is also a [`provision-complete.sh`](https://github.com/Integralist/Fresh-Install/blob/master/provision-complete.sh) file you'll need to run after Dropbox has finished sync'ing. To download the script run the following command:~~

```sh
curl https://raw.githubusercontent.com/Integralist/Fresh-Install/master/provision-complete.sh | sh
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
- Choose one of the available terminal themes: `:colorscheme xxx` (you may need to change the background to light or dark -> `set background=light`)
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

**UPDATE** my dotfiles are now in a separate repo and are installed by the `provision.sh` script.

## Certificates

My developer certs aren't committed to GitHub (obviously) and so I need to manually symlink them:

- `ln -s "$DEV_CERT_PATH/Certificate.p12" $HOME/.pki/Certificate.p12`
- `ln -s "$DEV_CERT_PATH/Certificate.pem" $HOME/.pki/Certificate.pem`
- `ln -s "$DEV_CERT_PATH/cloud-ca.pem" $HOME/.pki/cloud-ca.pem`

## Vim Themes

The following are themes available (either installed inside `.vim/colors` or via plugin inside `.vim/bundle`):

### Light Themes

- :colorscheme `pencil` (requires `set background=light` to be explictly set)
- :colorscheme `github`
- :colorscheme `Tomorrow`
- :colorscheme `whitebox`

### Dark Themes

- :colorscheme `badwolf`
- :colorscheme `blazer`
- :colorscheme `flatland`
- :colorscheme `gruvbox`
- :colorscheme `kellys`
- :colorscheme `Tomorrow-Night`
- :colorscheme `Tomorrow-Night-Bright`
- :colorscheme `vividchalk`

## Vim and Tmux status line improvements

We use a specific plugin to handle status bar line enhancements (both for Vim and Vim running inside tmux).

Once the following steps have been actioned you won't need to run them again (as the content of the file generated by the commands is added directly to our `.tmux.conf` file).

Open tmux and then Vim inside it and run the following commands...

- `:let g:tmuxline_preset = 'full'`
- `:Tmuxline`
- `:TmuxlineSnapshot ~/some/path/tmux-snapshot.conf`

...then inside our `tmux.conf` file we add `source-file ~/some/path/tmux-snapshot.conf` (or just copy the content directly into .tmux.conf which is what I ended up doing)

The status line also uses https://github.com/richo/battery which needs to be symlinked into the correct location (`ln -s ~/Dropbox/Fresh\ Install/Shell/bin/battery $HOME/bin/battery`). Also need to make sure you set the correct permissions: `chmod +x ~/bin/battery`

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

## IRSSI

The IRC terminal client irssi is hard to remember and type so I aliased it to `irc` which is much easier.

See the .irssi folder with notifier script (`/run scripts/notifier.pl` from within irssi - the script is taken from here: https://github.com/paddykontschak/irssi-notifier) and it also requires `gem install terminal-notifier` to be installed (possible into the system ruby -> like WeeChat did). You'll need to make sure the .irssi folder is symlinked to/or copied into your `$HOME` directory.

> Note: you may need to run `/script load notifier.pl` from within irssi

- `/help [command]` = by itself it displays all commands available; with a command it shows the docs for that command - in your main connection window (first window)
- `/join {channel}` = join a specific channel
- `/n` = lists all users
- `/q {nick}` = send a private message to a user
- `/window close` = close a another window opened
- `/me` = perform an action in third person
- `/away {message}` = mark yourself as away
- `/whois {nick}` = shows information on that user in your main connection window (first window)
- `ESC {n}` = change windows (seems the Meta key - ALT - is actually ESC for me?)

If you need more commands then see: http://www.ircbeginner.com/ircinfo/ircc-commands.html

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
- `/me is happy` will display something like `integralist is happy` in chat window
- `/nick foobar` will change your nickname to `foobar`
- `/list` displays a list of all channels available for the network connected to
- Shift and up/down arrow keys moves you up/down the discussion window content
  (use fn key as well if on a small Mac laptop)

To post to some channels on freenode you'll need to register your username first:

`/msg NickServ REGISTER password email`

> Note: the password AND email are not displayed (they just show as one long stream of asterisks)

You'll get an email asking you to register using a special code at the end, like so...

`/msg NickServ VERIFY REGISTER Integralist sOmeCodeHERE` (where `sOmeCodeHERE` is a code emailed to you)

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
- [https://github.com/tpope/vim-sexp-mappings-for-regular-people](https://github.com/tpope/vim-sexp-mappings-for-regular-people) (automatically add closing brackets/parenthesis and allows you to move forms and elements using `<f`, `>f`, `<e`, `>e`, `<I`, `>I` and `ysaf)` for adding parentheses around current form)±
- [https://github.com/kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim) (adds colourful pairs to your brackets/parenthesis)
- [https://github.com/tpope/vim-classpath](https://github.com/tpope/vim-classpath) (fix some Java `$PATH` details)
- [https://github.com/tpope/vim-clojure-static/](https://github.com/tpope//vim-clojure-static/) (Clojure formatting stuff)

> ± requires guns/vim-sexp.git and tpope/vim-repeat.git and tpope/vim-surround.git

You'll need three consoles open:

1. `vim`
2. `lein repl` (make sure you run this inside the `my-project` directory (see next point)
3. `lein new compojure my-project`
4. `lein ring server-headless` (or `lein ring server` which fires upp the browser)

> Note: you'll need a Clojure file open within Vim before the `:Connect` command becomes available

Then once the REPL is started, inside of Vim run the command `:Connect` and select the REPL you want to connect to and then enter the port number Leiningen provided when it started up (e.g. `:Connect nrepl://127.0.0.1:60356`).

### Evaluation commands

- `cpp` = quick evaluation (prints immediately the current expression under the cursor)
- `cqq` = same as `cpp` but allows you to modify the expression (e.g. introducing side effects for debugging)
- `cqp` = one-line REPL prompt (for quick evaluation of custom code)

### Documentation and Navigation commands

- `:Source` = view source of any symbol
- `:Doc` = view documentation of any symbol
- `:FindDoc` = lists multiple docs for any symbol matching your search criteria
- `K` = when pressed over a symbol will open documentation for that symbol
- `[d` = show the source code for the symbol under the cursor
- `[<C-d>` = jump to definition of a symbol
 
### Testing commands

- `:A` = takes you to the test file (or vice-versa)
- `:AS` = same as above but in horizontal split
- `:AV` = same as above but in vertical split

## Renaming files

`brew install rename`

Usage: Change File-A-B.gif to File-AB.gif

Example: `rename 's/(.+)-(.+)$/$1$2/' File-*`

## Load testing with Siege

`brew install siege`

Example: `siege -c 10 -r 10 -b http://www.domain.com/`

## Ensuring htop has access

`brew edit htop` will open up a file that you can then see the contents of a `caveats` function.

This function will demonstrate the commands you need to run to allow `htop` to access your CPU and Memory consumption:

```
sudo chown root:wheel /usr/local/bin/htop
sudo chmod u+s /usr/local/bin/htop
```

## NPM

- `npm install -g vtop`
- `npm install -g is-up`
- `npm install -g dnc`
