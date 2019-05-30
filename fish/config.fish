# set env
set -x LC_CTYPE en_US.UTF-8
set -x TITLE DevOps
set -x EDITOR vim
set -lx LOCAL_CONFIGDIR ~/.config

# alias
alias vi="nvim"
alias vim="nvim"
alias ls="exa"
alias l="exa -alh"
alias cat="bat -p"
alias du="ncdu -q"
alias python='python3'
abbr dcdu 'docker-compose down && docker-compose up -d'
abbr -a -- - 'cd -'

bind \cx\ce edit-command

# run terminal with tmux
if test -n "(command -v tmux)" && test -z "$TMUX"
  tmux -f $LOCAL_CONFIG/tmux/tmux.conf attach -t TMUX || tmux -f $LOCAL_CONFIGDIR/tmux/tmux.conf new -s TMUX
end

# fish
test -f $LOCAL_CONFIGDIR/fish/fish_greeting.fish && source $LOCAL_CONFIGDIR/fish/fish_greeting.fish
test -f $LOCAL_CONFIGDIR/fish/fish_greeting.fish && source $LOCAL_CONFIGDIR/fish/fish_function.fish

# fzf
test -f $LOCAL_CONFIGDIR/fzf/fzf.fish && source $LOCAL_CONFIGDIR/fzf/fzf.fish

# kubernetes config
test -f $LOCAL_CONFIGDIR/scripts/kube_config.fish && source $LOCAL_CONFIGDIR/scripts/kube_config.fish

