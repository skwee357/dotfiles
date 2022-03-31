OS := $(shell uname)

setup:
	@mkdir -p ~/.vim/undodir
	@chmod 0700 ~/.vim/undodir
	brew tap homebrew/cask-fonts

fonts:
	brew install --cask font-dejavu-sans-mono-nerd-font

install-packages:
	brew install fd fzf tmux 

brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
	sh install.sh
	rm install.sh

tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

oh-my-zsh:
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh
	rm install.sh

all: install-packages

.PHONY: brew install-packages oh-my-zsh all tpm vim-plug 
