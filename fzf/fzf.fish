set -x FZF_DEFAULT_OPTS "--height 60% --layout=reverse --inline-info --preview 'cat {}'"
set -x FZF_DEFAULT_COMMAND 'fd -H --exclude .git'

# Key bindings
# ------------
#source "/usr/local/opt/fzf/shell/key-bindings.fish"
