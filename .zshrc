# vim: ft=zsh

for file in ~/.{zshpaths,exports,exports.priv,aliases,zplugrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

fpath=(
  $HOME/.functions
  $fpath
)

typeset -gU fpath FPATH

bindkey -e

# load shell functions (contains completions)
fpath=(/usr/local/share/zsh-completions $fpath)

bindkey -e

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
