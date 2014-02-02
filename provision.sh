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
