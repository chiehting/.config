# git
#function git
#  GIT_TRACE=true \
#  GIT_CURL_VERBOSE=true \
#  GIT_SSH_COMMAND="ssh -vvv" \
#  GIT_TRACE_PACK_ACCESS=true \
#  GIT_TRACE_PACKET=true \
#  GIT_TRACE_PACKFILE=true \
#  GIT_TRACE_PERFORMANCE=true \
#  GIT_TRACE_SETUP=true \
#  GIT_TRACE_SHALLOW=true \
#  /usr/bin/git $argv
#end

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

# ssh convert formate
function sshc
  sh ~/.config/scripts/sshc.sh $argv
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

# chrome disable web security
function chrome-dev
  set datadir /tmp/chrome_dev
  rm -rf $datadir
  open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="$datadir" --disable-web-security
end

# fix slow command autocompletion
if test (uname) = Darwin
  function __fish_describe_command; end
end

