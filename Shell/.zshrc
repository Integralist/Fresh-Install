# Environment Variables
export GITHUB_USER="integralist"

# Specify synchronised location
dropbox="$HOME/Dropbox"
syncfolder="$HOME/Box Sync" # sourcing a file breaks with backslashes
syncfolderalias="$HOME/Box\ Sync" # aliasing needs backslashes as it's an actual command

# Export the path so it can be used elsewhere (such as in our .vimrc file)
export DROPBOX=$dropbox
export SYNCFOLDER=$syncfolder
export SYNCFOLDERALIAS=$syncfolderalias

# Vagrant fixes issue with Chef not completing
if `tty -s`; then
   mesg n
fi

# reorder PATH so local bin is first
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# When installing Node via Homebrew you may need to add NPM to your $PATH
    # export PATH="$PATH:/usr/local/share/npm/bin"
# Noticed to update NPM using `npm i -g npm` that my path picks up `/usr/local/bin/npm` first
# So instead I'm moving that to the start of my path
export PATH="/usr/local/share/npm/bin:$PATH"

# sets up chruby and allows us to use .ruby-version files to switch ruby versions
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' | sed 's:.*(\(.*\)):\1:')"

if [ $NETWORK_LOCATION = 'BBC On Network'  ]; then
    export http_proxy='http://www-cache.reith.bbc.co.uk:80'
    export https_proxy='http://www-cache.reith.bbc.co.uk:80'
    export ftp_proxy='ftp-gw.reith.bbc.co.uk:21'
    export socks_proxy='socks-gw.reith.bbc.co.uk:1085'

    export HTTP_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export HTTPS_PROXY='http://www-cache.reith.bbc.co.uk:80'
    export FTP_PROXY='ftp-gw.reith.bbc.co.uk:21'
    export SOCKS_PROXY='socks-gw.reith.bbc.co.uk:1085'
else
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_proxy

    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset SOCKS_PROXY
fi;

alias r="source ~/.zshrc"
alias st="cd tabloid/webapp/static"
alias rubyv="ls /opt/rubies/"
alias grunt="grunt --verbose --stack"
alias tka="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions
alias tmuxsrc="tmux source-file ~/.tmux.conf"
alias lib="cd $syncfolderalias/Library"
alias df="cd $dropbox/Fresh\ Install/Shell"
alias site="cd $syncfolderalias/Library/Github/integralist/Website"
alias vs="vagrant suspend"
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vr="vagrant box remove responsive virtualbox"
alias vst="vagrant status"
alias gemu="for i in `gem list --no-versions`; do gem uninstall -aIx $i; done"

# Using CabinJS to create my blog, but it only works with GitHub pages
# So rather than write a Rake task or a Node/Grunt task and have to remember the File system APIs
# I've decided to use standard unix commands to achieve the same thing.
# Yes it's a lot more long winded but it works and took me a lot less time to write.
#
# we move into our website directory
# we create a log.txt file
# we send to stdout the latest commit message
# we cut out just the message (ignoring the commit hash)
# we pipe the stdout to xargs where we then write it into the log.txt
# we move into our website release folder
# we copy the content of the `dist` folder into our website release folder
# we `git add` and `git add -A`
# we send to stdout the content of our log.txt (which is the commit message)
# we then pipe that commit message over to xargs which runs `git commit` using it
# finally we `git push origin master`
alias deploysite="cd $syncfolderalias/Library/Github/integralist/Website && touch log.txt && git log --oneline -n 1 | cut -d ' ' -f 2- | xargs -I {} echo {} > log.txt && cd ../integralist.github.com && cp -r ../Website/dist/* ./ && git add . && git add -A && cat ../Website/log.txt | xargs -I {} git commit -m {} && git push origin master"

# Color grep results
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Makes installing versions of Ruby slightly easier
function ri() {
    ruby-install -i ~/.rubies/ ruby $1
}

# Handle installing of Ruby Gems using Gemsets
# Create a `.gemset` file alongside your Gemfile
# The content of `.gemset` is your project name.
# Will install Gems to `~/.gem/gemsets/ruby/{version}/{identifier}/gems`
function chruby_gemset() {
  # Save existing environment setup
  if [ -z "$DEFAULT_GEM_HOME" ]; then
    export DEFAULT_GEM_HOME=$GEM_HOME
  fi

  if [ -z "$DEFAULT_GEM_PATH" ]; then
    export DEFAULT_GEM_PATH=$GEM_PATH
  fi

  if [ -z "$DEFAULT_PATH" ]; then
    export DEFAULT_PATH=$PATH
  fi
  chruby_gemset=$1

  ruby_bin="`command -v unbundled_ruby || command -v ruby`"

eval `$ruby_bin - <<EOF
require 'rubygems'
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "ruby_version=#{RUBY_VERSION}"
puts "gem_path=\"#{Gem.path.join(':')}\""
EOF`

  gem_dir="$HOME/.gem/gemsets/$ruby_engine/$ruby_version/$chruby_gemset"

  export PATH="$gem_dir/bin:$PATH"
  export GEM_HOME="$gem_dir"
  export GEM_PATH="$gem_dir"
}

function reset_chruby_gemset() {
  export PATH=$DEFAULT_PATH
  export GEM_HOME=$DEFAULT_GEM_HOME
  export GEM_PATH=$DEFAULT_GEM_PATH
}

function chruby_gemset_auto() {
  local dir="$PWD"
  local gemset

  until [[ -z "$dir" ]]; do
    if { read -r gemset <"$dir/.gemset"; } 2>/dev/null; then
        chruby_gemset "$gemset"
        return $?
    fi
    if { read -r gemset <"$dir/.ruby-gemset"; } 2>/dev/null; then
      chruby_gemset "$gemset"
      return $?
    fi

    dir="${dir%/*}"
  done

  if [[ -z "$gemset" ]]; then
    if [ -z "$DEFAULT_GEM_PATH" ]; then
    else
      reset_chruby_gemset
      unset DEFAULT_GEM_PATH
      unset DEFAULT_GEM_HOME
      unset DEFAULT_PATH
    fi
  fi
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *chruby_gemset_auto* ]]; then
    preexec_functions+=("chruby_gemset_auto")
  fi
fi

# Makes creating a new tmux session (with a specific name) easier
function tmuxopen() {
    tmux attach -t $1
}

# Makes creating a new tmux session (with a specific name) easier
function tmuxnew() {
    tmux new -s $1
}

# Makes deleting a tmux session easier
function tmuxkill() {
    tmux kill-session -t $1
}

# Open path in the terminal which matches current directory within the the forefront Finder window.
function cdf() {
    if [ "`osascript -e 'tell application "System Events" to "Finder" is in (get name of processes)'`" = "true" ]; then

        if [ "`osascript -e 'tell application "Finder" to get collapsed of front window' 2>/dev/null`" != "false" ]; then

            if [ "`osascript -e 'tell application "System Events" to "TotalFinderCrashWatcher" is in (get name of processes)'`" = "true" ];then
                open .
                osascript -e 'tell application "System Events" to tell process "Finder" to keystroke "w" using {command down}' -e 'tell application "System Events" to tell process "Finder" to keystroke "h" using {command down}'
            else
                finderState=`osascript -e 'tell application "System Events" to set visible of application process "Finder" to true' -e 'tell application "Finder" to set collapsed of front window to true' 2>/dev/null`
            fi
        fi

        finder=`osascript -e 'tell application "Finder" to set curName to (POSIX path of (target of front window as alias))' 2>/dev/null`

        if [ -z "$finder" ]; then
            echo "Failed to find \"Finder\""
        else
            echo "$finder"
            cd "$finder"
        fi

    else
        echo "\"Finder\" is not running"
    fi
}

# find shorthand
# find ./ -name '*.js'
function f() {
    find . -name "$1"
}

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function phpserver() {
    php -S localhost:8888
}

function rubyserver() {
    ruby -run -e httpd . -p 5000
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# Auto completion
autoload -U compinit
compinit -C

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Convert movie file to animated gif
gif-ify() {
    if [[ -n "$1" && -n "$2" ]]; then
        ffmpeg -i $1 -pix_fmt rgb24 temp.gif
        convert -layers Optimize temp.gif $2
        rm temp.gif
    else
        echo "proper usage: gif-ify <input_movie.mov> <output_file.gif>. You DO need to include extensions."
    fi
}

function restart_finder() {
    killall Finder
}

function show_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles TRUE
    restart_finder
}

function hide_hidden_files() {
    defaults write com.apple.finder AppleShowAllFiles FALSE
    restart_finder
}

set completion-ignore-case on

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make vim the default editor
export EDITOR="vim"

# Pull in 'Pure' shell prompt: skin and settings
source "$dropbox/Fresh Install/Shell/prompt.zsh"
