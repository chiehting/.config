#!/bin/sh

echo 'shell list:'
cat /etc/shells |grep -v "#"|grep -v '^$' && echo

read -p "please choose shell: " shell

chsh -s $shell

