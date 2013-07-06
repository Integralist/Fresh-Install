# Fresh Install

These are my own instructions for a fresh laptop/mac install

- [Homebrew](http://mxcl.github.io/homebrew/)
	- `brew install node` (which installs NPM)
	- `brew install git`
	- `brew install ack`
	- `brew install phantomjs`
	- `brew install chruby`
- [Pure ZSH](https://github.com/sindresorhus/pure)
	- [Prezto](https://github.com/sorin-ionescu/prezto)
	- [PHPShell](http://www.phpsh.org/)
- [Grunt](http://gruntjs.com/)
	- `npm install -g grunt-cli`
	- `npm install -g grunt-init`
	- `npm init` (creates a package.json file)
- [Lo-Dash](https://npmjs.org/package/lodash)
- [Uglify](https://npmjs.org/package/uglify-js2) (`npm install uglify-js2`)
- [Sass](http://sass-lang.com/) (`gem install sass`)
- [Xcode Command Line Tools](http://connect.apple.com/)
- Google Chrome Plugins (should come from Google account sync)
	- [Quick JavaScript Switcher](https://t.co/ryLRETND)
	- [goo.gl URL Shortener](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&ved=0CDcQFjAB&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fgoogl-url-shortener%2Fiblijlcdoidgdpfknkckljiocdbnlagk%3Fhl%3Den&ei=tTDAUen3IImAOIOqgKgG&usg=AFQjCNEkUotK__kdeBXARBUc6WNTQ7rB3A&sig2=gTtTOryLRAYyLIiyL-84HQ&bvm=bv.47883778,d.ZWU)
- Applications
	- Sublime Text
	- iWriter
	- xScope
	- Pocket
	- Regexr
	- Caffeine
	- Alfred
	- AppCleaner
	- RightZoom
	- Dropbox
	- CloudApp
	- VLC Player
	- Fantastical
	- Vienna
	- Clean My Mac

## Dot Files

See the `Shell` directory that includes a .zshrc file which imports a Zsh settings file on Dropbox.

## Sublime Text

To sync our packages and settings we need to symlink references via the terminal to point to our `Fresh Install/Sublime Text 3` directory

`cd ~/Library/Application\ Support/Sublime\ Text\ 3`

Remove only the following folders (copy them first to your Dropbox folder!)

- `rm -r Installed\ Packages`
- `rm -r Packages`

Then you can symlink them...

- `ln -s ~/Dropbox/Fresh\ Install/Sublime\ Text\ 3/Installed\ Packages`
- `ln -s ~/Dropbox/Fresh\ Install/Sublime\ Text\ 3/Packages`