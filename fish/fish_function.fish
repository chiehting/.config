# ssh default shell of tmux
function ssh
  if test "$argv" = "list" || test "$argv" = "ls"
    cat ~/.ssh/**config | grep -i '^host'
  else
    /usr/bin/ssh -t $argv "tmux attach || tmux new || zsh || bash";
  end
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

