# set
set -x LC_CTYPE en_US.UTF-8
set -x TITLE DevOps
set -x EDITOR vim

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
if test -z "$TMUX"
  tmux -f ~/.config/tmux/tmux.conf attach -t TMUX || tmux -f ~/.config/tmux/tmux.conf new -s TMUX
end

# fish
test -f ~/.config/fish/fish_greeting.fish && source ~/.config/fish/fish_greeting.fish

# fzf
test -f ~/.config/fzf/fzf.fish && source ~/.config/fzf/fzf.fish

# kubernetes config
source ~/.config/scripts/kube_config.fish


# ssh default shell of tmux
function ssh
  /usr/bin/ssh -t $argv "tmux attach || tmux new || zsh || bash";
end

# copy ssh key to clipboard
function key
  cat ~/.ssh/id_rsa.pub|pbcopy
end

# Use $EDITOR to edit the current command
function edit-command
    set -q EDITOR; or return 1
    set -l tmpfile (mktemp); or return 1
    commandline > $tmpfile
    eval $EDITOR $tmpfile
    commandline -r (cat $tmpfile)
    rm $tmpfile
end
