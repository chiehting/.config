mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

.DEFAULT_GOAL:=help

.PHONY: help
help: ## show help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)|awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install_package
install_package: scripts/install_package.sh ## install package
	sh scripts/install_package.sh

.PHONY: init
init: scripts/init.sh ## initialization.
	sh scripts/init.sh

.PHONY: remove
remove:
	rm -rf ${mkfile_dir}zsh/oh-my-zsh
	rm -f ~/.bashrc ~/.gitconfig ~/.yarnrc ~/.zshrc

.PHONY: resetLaunch
resetLaunch: ## reset launch pad
	defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock


