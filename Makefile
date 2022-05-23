OS := $(shell uname)
VIM_UNDODIR		= ~/.vim/undodir
NVIM_UNDODIR	= ~/.local/share/nvim/undodir

setup:
	@mkdir -p $(VIM_UNDODIR)
	@chmod 0700 $(VIM_UNDODIR)
	@mkdir -p $(NVIM_UNDODIR)
	@chmod 0700 $(NVIM_UNDODIR)
	brew tap homebrew/cask-fonts

fonts:
	brew install --cask font-dejavu-sans-mono-nerd-font

install-packages:
	brew install fd fzf tmux exa bat ripgrep romkatv/powerlevel10k/powerlevel10k lazygit pyenv

vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim-plug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

tmux-tpm:
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@echo "tpm installed, please add run '~/.tmux/plugins/tpm/tpm' to your tmux.conf"

oh-my-zsh:
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh
	rm install.sh

all: install-packages

.PHONY: all
