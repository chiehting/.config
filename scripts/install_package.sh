#!/bin/sh

cd "$(dirname "$0")"/..
package_dir=scripts/package

# check ruby is installed
[ -n "$(command -v /usr/bin/ruby)" ] || exit 1

# install brew
[ -z "$(command -v brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install tap
tap_list=("caskroom/fonts" "homebrew/cask" "sass/sass")
for ((i=0; i<${#tap_list[@]}; i++)); do
  brew tap ${tap_list[$i]}
done

# install brew package
[ -f $package_dir/package ] && cat $package_dir/package | grep -v '#' | grep -v '^$' | xargs brew install
[ -f $package_dir/cask_package ] && cat $package_dir/cask_package | grep -v '#' | grep -v '^$' | xargs brew cask install

# brew cleanup cache
brew cleanup -s

# install kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install nodejs manage
npm install -g n

echo 'done'

