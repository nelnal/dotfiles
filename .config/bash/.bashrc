# vim: ft=sh

# Load common settings
source ~/.config/shell/base;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Share command histories
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND";
shopt -u histappend;

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell;

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable some Bash 4 features when posibble
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# use bash-it
## Add tab completion for many Bash commands
##if which brew ^> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
#  # Ensure existing Homebrew v1 completions continue to work
#  export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
#  source "$(bash --prefix)/etc/profile.d/bash_completion.sh";
#elif [ -f /etc/bash_completion ]; then
#  source /etc/bash_completion;
#fi;

# use bash-it
## Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\')" scp sftp ssh;

