# ssh default shell of tmux
function ssh
  set -l subcmd $argv[1]
  if test "$subcmd" = "list" || test "$subcmd" = "ls"
    set -l command "cat ~/.ssh/**config | grep -v '*' | grep -i '^host' -A 1"
    for val in $argv[2..-1]
      set command "$command | grep -i $val -A 1"
    end
    eval $command
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

