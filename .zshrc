# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# vim: ft=zsh

for file in ~/.{zshpaths,exports,exports.priv,aliases,zplugrc,funcs}; do
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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
