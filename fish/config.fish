# set env
set -x LC_ALL en_US.UTF-8
set -x EDITOR vim
set -lx LOCAL_CONFIGDIR ~/.config

# alias
alias vi="nvim"
alias vim="nvim"
alias ls="exa"
alias l="exa -alh"
alias cat="bat -p"
alias du="ncdu -q"
alias df="duf"
alias sed="gsed"
alias python='python3'
alias rg='rg -LH --hidden --no-ignore'
alias copy='pbcopy'
abbr -a -- - 'cd -'

bind \cx\ce edit-command

# run terminal with tmux
if test -n "(command -v tmux)" && test -z "$TMUX"
  tmux attach -t FISH || tmux -f $LOCAL_CONFIGDIR/tmux/tmux.conf new -s FISH
end

# fish
test -f $LOCAL_CONFIGDIR/fish/fish_greeting.fish && source $LOCAL_CONFIGDIR/fish/fish_greeting.fish
test -f $LOCAL_CONFIGDIR/fish/fish_greeting.fish && source $LOCAL_CONFIGDIR/fish/fish_function.fish

# fzf
test -f $LOCAL_CONFIGDIR/fzf/fzf.fish && source $LOCAL_CONFIGDIR/fzf/fzf.fish

# kubernetes config
test -f $LOCAL_CONFIGDIR/scripts/kube_config.fish && source $LOCAL_CONFIGDIR/scripts/kube_config.fish

