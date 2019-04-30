mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

.DEFAULT_GOAL:=help


.PHONY: init
init: ## initialization.
	git clone https://github.com/robbyrussell/oh-my-zsh.git ${mkfile_dir}zsh/oh-my-zsh
	git clone https://github.com/bhilburn/powerlevel9k.git ${mkfile_dir}zsh/oh-my-zsh/custom/themes/powerlevel9k
	ln -s ${mkfile_dir}bash/bashrc ~/.bashrc
	ln -s ${mkfile_dir}git/gitconfig ~/.gitconfig
	ln -s ${mkfile_dir}yarn/yarnrc ~/.yarnrc
	ln -s ${mkfile_dir}zsh/zshrc ~/.zshrc

.PHONY: remove
remove:
	rm -rf ${mkfile_dir}zsh/oh-my-zsh
	rm -f ~/.bashrc ~/.gitconfig ~/.yarnrc ~/.zshrc

.PHONY: help
help: ## show help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)|awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: resetLaunch
resetLaunch: ## reset launch pad
	defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
