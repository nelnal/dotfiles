if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# LC_ALL環境変数を設定（グローバルかつexport）
# これを設定すると、他の LC_* 変数よりも優先されます
set -gx LC_ALL "ja_JP.UTF-8"

# LANGも合わせて設定しておくのも良いでしょう
set -gx LANG "ja_JP.UTF-8"

keychain --eval --quiet github | source

set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes

set -U FZF_LEGACY_KEYBINDINGS 0

fish_add_path (python -m site --user-base)/bin

## aliases

alias ls="eza"
alias ll="eza -al --git --icons --time-style relative"
alias lla="eza -a --git -g -h --oneline --icons"

alias cat="bat"
